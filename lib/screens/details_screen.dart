import 'package:diplomayin/utils/utils.dart';
import 'package:diplomayin/view_models/ocr_view_model.dart';
import 'package:flutter/material.dart';

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
