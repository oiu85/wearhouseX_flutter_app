import 'package:dartz/dartz.dart';
import '../../../../config/api_config.dart';
import '../../../../core/network/network_client.dart';
import '../models/stock_models.dart';

/// Remote data source for stock API calls
abstract class StockRemoteDataSource {
  /// Get driver's stock with optional filters
  Future<Either<NetworkFailure, Map<String, dynamic>>> getDriverStock({
    String? search,
    int? categoryId,
    String? sort,
    String? order,
    bool? lowStockOnly,
    int? perPage,
    int? page,
  });
  
  /// Get stock detail by product ID
  Future<Either<NetworkFailure, StockDetailModel>> getStockDetail(int productId);
  
  /// Get stock statistics
  Future<Either<NetworkFailure, StockStatisticsModel>> getStockStatistics({
    int? lowStockThreshold,
  });
  
  /// Get a single stock item by ID (legacy method)
  Future<Either<NetworkFailure, StockItemModel>> getStockItemById(int stockItemId);
}

/// Implementation of StockRemoteDataSource
class StockRemoteDataSourceImpl implements StockRemoteDataSource {
  final NetworkClient networkClient;

  StockRemoteDataSourceImpl(this.networkClient);

  @override
  Future<Either<NetworkFailure, Map<String, dynamic>>> getDriverStock({
    String? search,
    int? categoryId,
    String? sort,
    String? order,
    bool? lowStockOnly,
    int? perPage,
    int? page,
  }) async {
    final queryParams = <String, dynamic>{};
    if (search != null && search.isNotEmpty) {
      queryParams['search'] = search;
    }
    if (categoryId != null) {
      queryParams['category_id'] = categoryId;
    }
    if (sort != null) {
      queryParams['sort'] = sort;
    }
    if (order != null) {
      queryParams['order'] = order;
    }
    if (lowStockOnly != null) {
      queryParams['low_stock_only'] = lowStockOnly;
    }
    if (perPage != null) {
      queryParams['per_page'] = perPage;
    }
    if (page != null) {
      queryParams['page'] = page;
    }

    final result = await networkClient.get(
      ApiConfig.driverMyStock,
      queryParameters: queryParams.isNotEmpty ? queryParams : null,
    );

    return result.fold(
      (failure) => Left(failure),
      (response) {
        try {
          final data = response.data as Map<String, dynamic>;
          return Right(data);
        } catch (e) {
          return Left(
            NetworkFailure(
              message: 'Failed to parse stock data: ${e.toString()}',
            ),
          );
        }
      },
    );
  }

  @override
  Future<Either<NetworkFailure, StockDetailModel>> getStockDetail(
    int productId,
  ) async {
    final result = await networkClient.get(
      '${ApiConfig.stockDetail}/$productId',
    );

    return result.fold(
      (failure) => Left(failure),
      (response) {
        try {
          final data = response.data as Map<String, dynamic>;
          final detailData = data['data'] as Map<String, dynamic>;
          final stockDetail = StockDetailModel.fromJson(detailData);
          return Right(stockDetail);
        } catch (e) {
          return Left(
            NetworkFailure(
              message: 'Failed to parse stock detail: ${e.toString()}',
            ),
          );
        }
      },
    );
  }

  @override
  Future<Either<NetworkFailure, StockStatisticsModel>> getStockStatistics({
    int? lowStockThreshold,
  }) async {
    final queryParams = <String, dynamic>{};
    if (lowStockThreshold != null) {
      queryParams['low_stock_threshold'] = lowStockThreshold;
    }

    final result = await networkClient.get(
      ApiConfig.stockStatistics,
      queryParameters: queryParams.isNotEmpty ? queryParams : null,
    );

    return result.fold(
      (failure) => Left(failure),
      (response) {
        try {
          final data = response.data as Map<String, dynamic>;
          final statsData = data['data'] as Map<String, dynamic>;
          final statistics = StockStatisticsModel.fromJson(statsData);
          return Right(statistics);
        } catch (e) {
          return Left(
            NetworkFailure(
              message: 'Failed to parse stock statistics: ${e.toString()}',
            ),
          );
        }
      },
    );
  }

  @override
  Future<Either<NetworkFailure, StockItemModel>> getStockItemById(int stockItemId) async {
    //* Get all stock items and find the one with matching ID
    final result = await getDriverStock();

    return result.fold(
      (failure) => Left(failure),
      (responseData) {
        try {
          // Extract the data list from the response
          final data = responseData['data'] as List<dynamic>;
          final stockItems = data
              .map((json) => StockItemResponseModel.fromJson(json as Map<String, dynamic>))
              .toList();
          
          final stockItemResponse = stockItems.firstWhere(
            (item) => item.id == stockItemId,
            orElse: () => throw Exception('Stock item not found'),
          );
          
          // Convert to StockItemModel for compatibility
          final stockItem = StockItemModel(
            id: stockItemResponse.id,
            driverId: 0,
            productId: stockItemResponse.productId,
            quantity: stockItemResponse.quantity,
            product: ProductModel(
              id: stockItemResponse.productId,
              name: stockItemResponse.productName,
              priceString: stockItemResponse.price,
              categoryId: stockItemResponse.category?['id'] as int? ?? 0,
              description: stockItemResponse.productDescription,
              image: stockItemResponse.productImage,
              category: stockItemResponse.category != null
                  ? CategoryModel.fromJson(stockItemResponse.category!)
                  : null,
            ),
            updatedAt: stockItemResponse.updatedAt,
          );
          
          return Right(stockItem);
        } catch (e) {
          return Left(
            NetworkFailure(
              message: 'Stock item not found: ${e.toString()}',
            ),
          );
        }
      },
    );
  }
}
