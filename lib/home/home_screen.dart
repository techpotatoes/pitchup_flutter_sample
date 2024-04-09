import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pitchupfluttersample/home/pitch_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pitchCubitState = context.watch<PitchCubit>().state;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Pitchup sample- Guitar tuner"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              pitchCubitState.note,
              style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 65.0,
                  fontWeight: FontWeight.bold
              ),
            ),
            Text(
             pitchCubitState.status,
              style: const TextStyle(
                color: Colors.black87,
                fontSize: 18.0,
              ),
            ),
        ]),
      ),
    );
  }
}