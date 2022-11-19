import 'package:diplomayin/models/document.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ocr.g.dart';

@JsonSerializable()
class OCR {
  final String status;
  final List<Document> documents;
  final String id;

  OCR(this.status, this.documents, this.id);
  factory OCR.fromJson(Map<String, dynamic> json) => _$OCRFromJson(json);
  Map<String, dynamic> toJson() => _$OCRToJson(this);
}
