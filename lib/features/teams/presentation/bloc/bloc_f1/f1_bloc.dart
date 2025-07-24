import 'package:f1/features/teams/domain/usecases/get_f1_drivers_usecase.dart';
import 'package:f1/features/teams/presentation/bloc/bloc_f1/f1_event.dart';
import 'package:f1/features/teams/presentation/bloc/bloc_f1/f1_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class F1Bloc extends Bloc<F1Event, F1State>{
  final GetF1DriversUseCase getF1DriversUseCase;

  F1Bloc({
    required this.getF1DriversUseCase,
  }) : super(F1Initial()) {
    on<F1FetchDrivers>(_onFetchDrivers);
  }

  Future<void> _onFetchDrivers(F1FetchDrivers event, Emitter<F1State> emit) async {
    emit(F1Loading());
    try {
      print('F1FetchDrivers triggered');
      final drivers = await getF1DriversUseCase();
      print('Drivers fetched: ${drivers.length}');
      emit(F1Loaded(drivers));
    } catch (e) {
      debugPrint(e.toString());
      emit(F1Error(e.toString()));
    }
  }
}