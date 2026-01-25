import 'package:dartz/dartz.dart';
import '../../../../config/api_config.dart';
import '../../../../core/network/network_client.dart';
import '../models/sales_models.dart';

/// Remote data source for sales API calls
abstract class SalesRemoteDataSource {
  /// Create a new sale
  Future<Either<NetworkFailure, SaleModel>> createSale({
    required String customerName,
    required List<CreateSaleItemRequestModel> items,
  });

  /// Get list of sales with optional filters
  Future<Either<NetworkFailure, Map<String, dynamic>>> getSales({
    String? search,
    DateTime? dateFrom,
    DateTime? dateTo,
    String? sort,
    String? order,
    int? perPage,
    int? page,
  });

  /// Get sale detail by ID
  Future<Either<NetworkFailure, SaleModel>> getSaleDetail(int saleId);

  /// Get sales statistics
  Future<Either<NetworkFailure, SaleStatisticsModel>> getSalesStatistics();

  /// Get invoice PDF as bytes
  Future<Either<NetworkFailure, List<int>>> getInvoicePdf(int saleId);
}

/// Implementation of SalesRemoteDataSource
class SalesRemoteDataSourceImpl implements SalesRemoteDataSource {
  final NetworkClient networkClient;

  SalesRemoteDataSourceImpl(this.networkClient);

  @override
  Future<Either<NetworkFailure, SaleModel>> createSale({
    required String customerName,
    required List<CreateSaleItemRequestModel> items,
  }) async {
    final requestModel = CreateSaleRequestModel(
      customerName: customerName,
      items: items,
    );

    final result = await networkClient.post(
      ApiConfig.createSale,
      data: requestModel.toJson(),
    );

    return result.fold(
      (failure) => Left(failure),
      (response) {
        try {
          final data = response.data as Map<String, dynamic>;
          final saleData = data['data'] as Map<String, dynamic>;
          final sale = SaleModel.fromJson(saleData);
          return Right(sale);
        } catch (e) {
          return Left(
            NetworkFailure(
              message: 'Failed to parse sale response: ${e.toString()}',
            ),
          );
        }
      },
    );
  }

  @override
  Future<Either<NetworkFailure, Map<String, dynamic>>> getSales({
    String? search,
    DateTime? dateFrom,
    DateTime? dateTo,
    String? sort,
    String? order,
    int? perPage,
    int? page,
  }) async {
    final queryParams = <String, dynamic>{};
    if (search != null && search.isNotEmpty) {
      queryParams['search'] = search;
    }
    if (dateFrom != null) {
      queryParams['date_from'] = dateFrom.toIso8601String().split('T')[0];
    }
    if (dateTo != null) {
      queryParams['date_to'] = dateTo.toIso8601String().split('T')[0];
    }
    if (sort != null) {
      queryParams['sort'] = sort;
    }
    if (order != null) {
      queryParams['order'] = order;
    }
    if (perPage != null) {
      queryParams['per_page'] = perPage;
    }
    if (page != null) {
      queryParams['page'] = page;
    }

    final result = await networkClient.get(
      ApiConfig.getSales,
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
              message: 'Failed to parse sales data: ${e.toString()}',
            ),
          );
        }
      },
    );
  }

  @override
  Future<Either<NetworkFailure, SaleModel>> getSaleDetail(int saleId) async {
    final result = await networkClient.get(
      '${ApiConfig.getSaleDetail}/$saleId',
    );

    return result.fold(
      (failure) => Left(failure),
      (response) {
        try {
          final data = response.data as Map<String, dynamic>;
          final saleData = data['data'] as Map<String, dynamic>;
          final sale = SaleModel.fromJson(saleData);
          return Right(sale);
        } catch (e) {
          return Left(
            NetworkFailure(
              message: 'Failed to parse sale detail: ${e.toString()}',
            ),
          );
        }
      },
    );
  }

  @override
  Future<Either<NetworkFailure, SaleStatisticsModel>> getSalesStatistics() async {
    final result = await networkClient.get(ApiConfig.salesStatistics);

    return result.fold(
      (failure) => Left(failure),
      (response) {
        try {
          final data = response.data as Map<String, dynamic>;
          final statsData = data['data'] as Map<String, dynamic>;
          final statistics = SaleStatisticsModel.fromJson(statsData);
          return Right(statistics);
        } catch (e) {
          return Left(
            NetworkFailure(
              message: 'Failed to parse sales statistics: ${e.toString()}',
            ),
          );
        }
      },
    );
  }

  @override
  Future<Either<NetworkFailure, List<int>>> getInvoicePdf(int saleId) async {
    // TODO: Implement PDF download when NetworkClient supports responseType
    // For now, return an error indicating this needs to be implemented
    return Left(
      NetworkFailure(
        message: 'PDF download not yet implemented. Please use the invoice endpoint directly.',
      ),
    );
  }
}
