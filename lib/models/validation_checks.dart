import 'package:diplomayin/models/validations.dart';
import 'package:json_annotation/json_annotation.dart';

part 'validation_checks.g.dart';

@JsonSerializable()
class ValidationChecks {
  final int result;
  final Validations validations;

  ValidationChecks(this.result, this.validations);
  factory ValidationChecks.fromJson(Map<String, dynamic> json) =>
      _$ValidationChecksFromJson(json);
  Map<String, dynamic> toJson() => _$ValidationChecksToJson(this);
}
