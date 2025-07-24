import 'package:equatable/equatable.dart';
import 'package:f1/core/models/f1_driver_model.dart';

abstract class F1State extends Equatable{
  @override
  List<Object> get props => [];
}

class F1Initial extends F1State {}
class F1Loading extends F1State {}
class F1Loaded extends F1State {
  final List<F1DriverModel> drivers;

  F1Loaded(this.drivers);

  @override
  List<Object> get props => [drivers];
}
class F1Error extends F1State {
  final String message;

  F1Error(this.message);

  @override
  List<Object> get props => [message];
}
