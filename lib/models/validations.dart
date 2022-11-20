import 'package:diplomayin/models/recognition_status_check.dart';
import 'package:json_annotation/json_annotation.dart';

part 'validations.g.dart';

@JsonSerializable()
class Validations {
  final RecognitionStatusCheck recognitionStatusCheck;

  Validations(this.recognitionStatusCheck);
  factory Validations.fromJson(Map<String, dynamic> json) =>
      _$ValidationsFromJson(json);
  Map<String, dynamic> toJson() => _$ValidationsToJson(this);
}
