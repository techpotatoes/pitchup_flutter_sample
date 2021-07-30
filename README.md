## PitchUp Flutter Sample - Guitar tuning app

This app is a sample Flutter Guitar tuning app which demonstrates how to use 2 different dart libraries to implement a guitar tuning app. It also uses a library called flutter_audio_capture to capture an audio sample. 

The libraries used are: 

- https://github.com/techpotatoes/pitchup_dart: Dart library to check if a pitch is in tune for a given instrument.
- https://github.com/techpotatoes/pitch_detector_dart: Dart library to detect a pitch for a given audio sample.

## Usage

```dart

audioSample = .... //See main.dart if you want to learn how to capture audio.

//Step 1
//Create a new pitch detector and set the sample rate and buffer size  
final pitchDetectorDart = PitchDetector(44100, 2000);

//Step 2
//Call the get pitch method passing as a parameter the audio sample (List<double>) to detect a pitch 
final result = pitchDetectorDart.getPitch(audioSample);

if (result.pitched) { //There is a pitch of some sort 

    //Step 3
    //Create a PitchHandler and choose the instrument type
    final pitchUp = PitchHandler(InstrumentType.guitar);

    //Step 4
    //Uses the pitchUp library to check if a a given pitch consists of a guitar note and if it's tuned 
    final handledPitchResult = pitchUp.handlePitch(pitch);

    //Step 5 
    //Change the UI accordingly to the tuning status
    setState(() {
        note = handledPitchResult.note;
        status = handledPitchResult.tuningStatus.toString();
        ...
    })
}
```

## Contributing

Please, drop me an email if you have any suggestions, problems or feedback. Feel free to submit a pull request if you improved the library and want to share it. 

### Privacy Policy

This page informs you of our policies regarding the collection, use and disclosure of Personal Information when you use our Service.

The library don't store or share any kind of information. No data is saved or shared through any means. 
