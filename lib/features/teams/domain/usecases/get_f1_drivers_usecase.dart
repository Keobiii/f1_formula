import 'package:f1/core/models/f1_driver_model.dart';
import 'package:f1/features/teams/domain/repositories/f1_repository.dart';

class GetF1DriversUseCase {
  final F1Repository repository;

  GetF1DriversUseCase({required this.repository});

  Future<List<F1DriverModel>> call() async {
    return await repository.fetchDrivers();
  }
}