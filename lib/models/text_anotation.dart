import 'package:diplomayin/models/page.dart';
import 'package:json_annotation/json_annotation.dart';

part 'text_anotation.g.dart';

@JsonSerializable()
class TextAnnotation {
  // ignore: non_constant_identifier_names
  final List<Page> Pages;

  TextAnnotation(this.Pages);
  factory TextAnnotation.fromJson(Map<String, dynamic> json) =>
      _$TextAnnotationFromJson(json);

  Map<String, dynamic> toJson() => _$TextAnnotationToJson(this);
}
