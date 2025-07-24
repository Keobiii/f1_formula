import 'package:dio/dio.dart';
import 'package:f1/core/network/dio_client.dart';
import 'package:f1/features/teams/data/datasources/f1_remote_datasouce.dart';
import 'package:f1/features/teams/data/datasources/f1_remote_datasource_impl.dart';
import 'package:f1/features/teams/data/repositories/f1_repository_impl.dart';
import 'package:f1/features/teams/domain/repositories/f1_repository.dart';
import 'package:f1/features/teams/domain/usecases/get_f1_drivers_usecase.dart';
import 'package:f1/features/teams/presentation/bloc/bloc_f1/f1_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Dio
  sl.registerLazySingleton<Dio>(() => Dio());
  sl.registerLazySingleton<DioClient>(() => DioClient(dio: sl()));

  // DataSources
  sl.registerLazySingleton<F1RemoteDatasouce>(
    () => F1RemoteDatasourceImpl(client: sl()),
  );

  // Repositories
  sl.registerLazySingleton<F1Repository>(
    () => F1RepositoryImpl(
      remoteDatasource: sl()
    )
  );

  // UseCases
  sl.registerLazySingleton(() => GetF1DriversUseCase(repository: sl()));

  // Bloc
  sl.registerFactory(() => F1Bloc(getF1DriversUseCase: sl()));
}