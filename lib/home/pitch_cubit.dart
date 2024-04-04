import 'package:flutter/foundation.dart';
import 'package:flutter_audio_capture/flutter_audio_capture.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pitch_detector_dart/pitch_detector.dart';
import 'package:pitchupdart/pitch_handler.dart';
import 'package:pitchupfluttersample/home/tunning_state.dart';

class PitchCubit extends Cubit<TunningState> {
  final FlutterAudioCapture _audioRecorder;
  final PitchDetector _pitchDetectorDart;
  final PitchHandler _pitchupDart;

  PitchCubit(this._audioRecorder, this._pitchDetectorDart, this._pitchupDart):
   super(TunningState(note: "", status: "Play something")) {
    _init();
  }

  _init() {
    _audioRecorder.start(_listener, onError,
        sampleRate: 44100, bufferSize: 3000);
  }

  void stop() {
    _audioRecorder.stop();

    emit(TunningState(
      note: "",
      status: "Not listening - STOPPED",
    ));
  }

  void _listener(dynamic obj) {
    //Gets the audio sample
    var buffer = Float64List.fromList(obj.cast<double>());
    final List<double> audioSample = buffer.toList();

    //Uses pitch_detector_dart library to detect a pitch from the audio sample
    _pitchDetectorDart.getPitch(audioSample).then((detectedPitch) => {
      if (detectedPitch.pitched) {
        _pitchupDart.handlePitch(detectedPitch.pitch).then((pitchResult) => {
          emit(TunningState(
            note: pitchResult.note,
            status: pitchResult.tuningStatus.toString(),
          ))       
        })
      }
    });
  }
}