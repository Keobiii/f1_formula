import 'package:f1/core/models/f1_driver_model.dart';

abstract class F1Repository {
    Future<List<F1DriverModel>> fetchDrivers();
}