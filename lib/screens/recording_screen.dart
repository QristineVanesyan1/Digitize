import 'dart:io';

import 'package:diplomayin/constants/constants.dart';
import 'package:diplomayin/repository/db_repository.dart';
import 'package:diplomayin/utils/utils.dart';
import 'package:diplomayin/widget/app_error_widget.dart';
import 'package:diplomayin/widget/save_button.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class RecordingScreen extends StatefulWidget {
  const RecordingScreen({Key? key}) : super(key: key);

  @override
  _RecordingScreenState createState() => _RecordingScreenState();
}

class _RecordingScreenState extends State<RecordingScreen> {
  final SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;
  String _lastWords = '';

  @override
  void initState() {
    super.initState();
    _initSpeech();
  }

  void _initSpeech() async {
    _speechEnabled = await _speechToText.initialize();
    setState(() {});
  }

  void _startListening() async {
    await _speechToText.listen(onResult: _onSpeechResult);
    setState(() {});
  }

  void _stopListening() async {
    await _speechToText.stop();
    setState(() {});
  }

  void _onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      _lastWords = result.recognizedWords;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(Constants.appTitle),
        leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              _stopListening();
              Navigator.of(context).pop(true);
            } //TODO check if something was changes
            ),
        actions: [SaveButton(onTap: _onSavePressed)],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(16),
              child: const Text(
                'Recognized words:',
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16),
                child: Text(
                  _speechToText.isListening
                      ? '$_lastWords'
                      : _speechEnabled
                          ? 'Tap the microphone to start listening...'
                          : 'Speech not available',
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:
            _speechToText.isNotListening ? _startListening : _stopListening,
        tooltip: 'Listen',
        child: Icon(_speechToText.isNotListening ? Icons.mic_off : Icons.mic,
            color: Colors.white),
      ),
    );
  }

  void _onSavePressed() async {
    try {
      _stopListening();
      final directory = await getApplicationDocumentsDirectory();
      final a = '/speechToText_${DateTime.now().toString()}.txt';
      final speechToTextPath = '${directory.path}${a}';
      final filePathFile = File(speechToTextPath);
      if (_lastWords.isNotEmpty) {
        await filePathFile.writeAsString(_lastWords);
      }
      await DbRepository.getDb();
      await DbRepository()
          .insertDataTxt(jsonPathTxt: a, filePathTxt: a, titleStr: a);

      // ignore: use_build_context_synchronously

      Utils.showAppDialog(
          context,
          AppErrorWidget(
              message: 'File successfully saved',
              onConfirm: (context) {
                Navigator.of(context).pop(true);
              }));
    } catch (e) {
      Utils.showAppDialog(context, const AppErrorWidget());
    }
  }
}
