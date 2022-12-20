import 'dart:convert';
import 'dart:io';

import 'package:diplomayin/models/ocr.dart';
import 'package:diplomayin/models/scan_item_view_model.dart';
import 'package:diplomayin/utils/utils.dart';
import 'package:diplomayin/view_models/doc_item_view_model.dart';
import 'package:diplomayin/view_models/ocr_view_model.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({required this.result, Key? key}) : super(key: key);
  final OCRViewModel result;
  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Utils.appBar(),
      body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
              children: List.generate(widget.result.recognizedText.length,
                  (index) => Text(widget.result.recognizedText[index])))),
    );
  }
}

class TxtReaderScreen extends StatefulWidget {
  const TxtReaderScreen({required this.scanItemViewModel, Key? key})
      : super(key: key);
  final ScanItemViewModel scanItemViewModel;

  @override
  State<TxtReaderScreen> createState() => _TxtReaderScreenState();
}

class _TxtReaderScreenState extends State<TxtReaderScreen> {
  String a = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Utils.appBar(),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: FutureBuilder(
              future: _f(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(a);
                } else {
                  return CircularProgressIndicator();
                }
              }),
        ));
  }

  Future<ConnectionState> _f() async {
    final directory1 = await getApplicationDocumentsDirectory();
    final directory = directory1.path;

    final _json = '$directory${widget.scanItemViewModel.file}';
    a = File(_json).readAsStringSync();

    return ConnectionState.done;
  }
}

//REF USE ABSTRACTION
class TxtReaderScreen1 extends StatefulWidget {
  const TxtReaderScreen1({required this.docItemViewModel, Key? key})
      : super(key: key);
  final DocItemViewModel docItemViewModel;

  @override
  State<TxtReaderScreen1> createState() => _TxtReaderScreen1State();
}

class _TxtReaderScreen1State extends State<TxtReaderScreen1> {
  String a = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Utils.appBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: FutureBuilder(
            future: _f(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(a);
              } else {
                return CircularProgressIndicator();
              }
            }),
      ),
    );
  }

  Future<ConnectionState> _f() async {
    final directory1 = await getApplicationDocumentsDirectory();
    final directory = directory1.path;

    final _json = '$directory${widget.docItemViewModel.file}';
    a = File(_json).readAsStringSync();
    return ConnectionState.done;
  }
}
