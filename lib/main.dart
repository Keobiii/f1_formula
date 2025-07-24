import 'package:f1/app.dart';
import 'package:f1/di/di.dart';
import 'package:f1/di/di.dart' as di;
import 'package:f1/features/teams/presentation/bloc/bloc_f1/f1_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await di.init();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<F1Bloc>())
      ], 
      child: const App()
    )
  );
}

