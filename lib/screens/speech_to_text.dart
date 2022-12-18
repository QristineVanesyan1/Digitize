// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:record/record.dart';

// class SpeechToTextScreen extends StatefulWidget {
//   const SpeechToTextScreen({super.key});

//   @override
//   State<SpeechToTextScreen> createState() => _SpeechToTextScreenState();
// }

// class _SpeechToTextScreenState extends State<SpeechToTextScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }

//   Future<void> _a() async {
//     final record = Record();

// // Check and request permission
//     if (await record.hasPermission()) {
//       // Start recording
//       await record.start(
//         path: 'aFullPath/myFile.m4a',
//         encoder: AudioEncoder.aacLc, // by default
//         bitRate: 128000, // by default
//       );
//     }

// // Get the state of the recorder
//     bool isRecording = await record.isRecording();

// // Stop recording
//     await record.stop();
//   }
// }
