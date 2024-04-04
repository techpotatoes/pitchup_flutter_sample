import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pitchupfluttersample/home/pitch_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pitchCubitState = context.watch<PitchCubit>().state;
    final pitchCubit = context.read<PitchCubit>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Pitchup sample"),
      ),
      body: Center(
        child: Column(children: [
          Center(
              child: Text(
            pitchCubitState.note,
            style: const TextStyle(
                color: Colors.black87,
                fontSize: 25.0,
                fontWeight: FontWeight.bold),
          )),
          const Spacer(),
          Center(
              child: Text(
            pitchCubitState.status,
            style: const TextStyle(
                color: Colors.black87,
                fontSize: 14.0,
                fontWeight: FontWeight.bold),
          )),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Center(
                    child: FloatingActionButton(
                        onPressed: () {
                          pitchCubit.stop();
                        },
                        child: const Text("Stop")
                    )
                  )
                ),
              ],
            )
          )
        ]),
      ),
    );
  }
}