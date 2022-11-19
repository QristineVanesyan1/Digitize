import 'package:diplomayin/models/page_detail.dart';
import 'package:diplomayin/models/text_anotation.dart';
import 'package:diplomayin/models/validation_checks.dart';
import 'package:json_annotation/json_annotation.dart';

part 'document.g.dart';

@JsonSerializable()
class Document {
  final String id;
  final String version;
  final String type;
  final List<PageDetail> pages;
  final String categorizedUrl;
  final String plainTextBase64;
  final ValidationChecks validationChecks;
  final TextAnnotation textAnnotation;

  Document(this.id, this.version, this.type, this.pages, this.categorizedUrl,
      this.plainTextBase64, this.validationChecks, this.textAnnotation);
  factory Document.fromJson(Map<String, dynamic> json) =>
      _$DocumentFromJson(json);
  Map<String, dynamic> toJson() => _$DocumentToJson(this);
}
