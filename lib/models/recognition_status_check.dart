import 'package:json_annotation/json_annotation.dart';

part 'recognition_status_check.g.dart';

@JsonSerializable()
class RecognitionStatusCheck {
  final String type;
  final bool value;

  RecognitionStatusCheck(this.type, this.value);
  factory RecognitionStatusCheck.fromJson(Map<String, dynamic> json) =>
      _$RecognitionStatusCheckFromJson(json);
  Map<String, dynamic> toJson() => _$RecognitionStatusCheckToJson(this);
}
