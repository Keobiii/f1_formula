import 'package:f1/core/models/f1_driver_model.dart';
import 'package:f1/core/network/dio_client.dart';
import 'package:f1/features/teams/data/datasources/f1_remote_datasouce.dart';

class F1RemoteDatasourceImpl implements F1RemoteDatasouce {
  final DioClient client;

  F1RemoteDatasourceImpl({required this.client});

  @override
  Future<List<F1DriverModel>> fetchDrivers() async {
    final response = await client.get('drivers');
    
    final List driversJson = (response.data['items'] ?? []) as List;

    return driversJson.map((json) => F1DriverModel.fromJson(json)).toList();
  }
}