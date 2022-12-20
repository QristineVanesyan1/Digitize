import 'dart:convert';
import 'package:diplomayin/models/ocr.dart';
import 'package:diplomayin/repository/db_repository.dart';
import 'package:diplomayin/utils/utils.dart';
import 'package:image_picker/image_picker.dart';

class OCRRepository {
  OCRRepository({required this.dbRepository});
  final DbRepository dbRepository;

  Future<OCR?> fetchOcr(XFile file) async {
    final json = await Utils.makeRequest(file.path);
    final ocr = OCR.fromJson(jsonDecode(json));
    return ocr;
  }
}
