
import 'package:flutter/material.dart';
import 'package:flutter_audio_capture/flutter_audio_capture.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pitch_detector_dart/pitch_detector.dart';
import 'package:pitchupdart/instrument_type.dart';
import 'package:pitchupdart/pitch_handler.dart';
import 'package:pitchupfluttersample/home/home_screen.dart';
import 'package:pitchupfluttersample/home/pitch_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<FlutterAudioCapture>(
          create: (context) => FlutterAudioCapture(),
        ),
        RepositoryProvider<PitchDetector>(
          create: (context) => PitchDetector(44100, 2000),
        ),
        RepositoryProvider<PitchHandler>(
          create: (context) => PitchHandler(InstrumentType.guitar),
        ),
      ],
      child: MultiBlocProvider(
          providers: [
            BlocProvider<PitchCubit>(
              create: (context) => PitchCubit(
                context.read<FlutterAudioCapture>(),
                context.read<PitchDetector>(),
                context.read<PitchHandler>(),
              ),
            ),
          ],
          child: MaterialApp(
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: const HomeScreen(),
          )
      ),
    );
  }
}