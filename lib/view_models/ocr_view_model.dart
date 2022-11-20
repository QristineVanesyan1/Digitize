import 'dart:convert';

import 'package:diplomayin/models/document.dart';
import 'package:diplomayin/models/ocr.dart';
import 'package:diplomayin/utils/utils.dart';

class OCRViewModel {
  final OCR model;
  final List<String> recognizedText;

  OCRViewModel(this.model, this.recognizedText);

  factory OCRViewModel.fromModel(OCR ocrModel) {
    final docsTextList = _getDocsTextList(ocrModel.documents);
    return OCRViewModel(ocrModel, docsTextList);
  }

  static List<String> _getDocsTextList(List<Document> docs) {
    return docs.map((e) => Utils.decodeBase64(e.plainTextBase64)).toList();
  }
}
