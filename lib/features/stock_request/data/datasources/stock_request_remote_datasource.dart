import 'package:injectable/injectable.dart';
import '../../../../core/network/network_client.dart';
import '../models/stock_request_models.dart';

/// Abstract remote data source for stock requests
abstract class StockRequestRemoteDataSource {
  Future<StockRequestModel> createRequest({
    required int productId,
    required int quantity,
  });

  Future<List<StockRequestModel>> getRequests();

  Future<StockRequestModel> getRequest(int id);
}

@Injectable(as: StockRequestRemoteDataSource)
class StockRequestRemoteDataSourceImpl implements StockRequestRemoteDataSource {
  final NetworkClient _networkClient;

  StockRequestRemoteDataSourceImpl(this._networkClient);

  @override
  Future<StockRequestModel> createRequest({
    required int productId,
    required int quantity,
  }) async {
    final result = await _networkClient.post(
      '/stock-orders',
      data: {
        'product_id': productId,
        'quantity': quantity,
      },
    );

    return result.fold(
      (failure) => throw Exception(failure.message),
      (response) {
        final data = response.data['data'] as Map<String, dynamic>;
        return StockRequestModel.fromJson({
          ...data,
          'product_name': data['product_name'] ?? 'Unknown Product',
        });
      },
    );
  }

  @override
  Future<List<StockRequestModel>> getRequests() async {
    final result = await _networkClient.get('/stock-orders');

    return result.fold(
      (failure) => throw Exception(failure.message),
      (response) {
        final List<dynamic> dataList = response.data['data'] ?? [];
        return dataList
            .map((json) => StockRequestModel.fromJson(json as Map<String, dynamic>))
            .toList();
      },
    );
  }

  @override
  Future<StockRequestModel> getRequest(int id) async {
    final result = await _networkClient.get('/stock-orders/$id');

    return result.fold(
      (failure) => throw Exception(failure.message),
      (response) {
        final data = response.data['data'] as Map<String, dynamic>;
        return StockRequestModel.fromJson(data);
      },
    );
  }
}
