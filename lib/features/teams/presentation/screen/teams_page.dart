import 'package:f1/features/teams/presentation/bloc/bloc_f1/f1_bloc.dart';
import 'package:f1/features/teams/presentation/bloc/bloc_f1/f1_event.dart';
import 'package:f1/features/teams/presentation/bloc/bloc_f1/f1_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TeamsPage extends StatefulWidget {
  const TeamsPage({super.key});

  @override
  State<TeamsPage> createState() => _TeamsPageState();
}

class _TeamsPageState extends State<TeamsPage> {
  @override
  void initState() {
    super.initState();
    context.read<F1Bloc>().add(F1FetchDrivers());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('F1 Drivers')),
      body: BlocBuilder<F1Bloc, F1State>(
        builder: (context, state) {
           print('State: $state'); 
          if (state is F1Loading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is F1Loaded) {
            final drivers = state.drivers;

            return ListView.builder(
              itemCount: drivers.length,
              itemBuilder: (context, index) {
                final driver = drivers[index];
                final fullName = '${driver.firstName} ${driver.lastName}';
                final nationality = driver.nationality;

                return ListTile(
                  leading:
                      driver.headshotUrl.isNotEmpty
                          ? ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              driver.headshotUrl,
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                              errorBuilder:
                                  (context, error, stackTrace) =>
                                      const Icon(Icons.person, size: 50),
                            ),
                          )
                          : const Icon(Icons.person, size: 50),
                  title: Text(fullName),
                  subtitle: Text('$nationality • #${driver.number ?? 'N/A'}'),
                );
              },
            );
          }

          if (state is F1Error) {
            return Center(child: Text('Error: ${state.message}'));
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
