import 'package:f1/core/models/f1_driver_model.dart';
import 'package:f1/features/teams/data/datasources/f1_remote_datasouce.dart';
import 'package:f1/features/teams/domain/repositories/f1_repository.dart';

class F1RepositoryImpl implements F1Repository{
  final F1RemoteDatasouce remoteDatasource;

  F1RepositoryImpl({required this.remoteDatasource});

  @override
  Future<List<F1DriverModel>> fetchDrivers() async {
    return await remoteDatasource.fetchDrivers();
  }
}