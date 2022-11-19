// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'validation_checks.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ValidationChecks _$ValidationChecksFromJson(Map<String, dynamic> json) =>
    ValidationChecks(
      json['result'] as int,
      Validations.fromJson(json['validations'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ValidationChecksToJson(ValidationChecks instance) =>
    <String, dynamic>{
      'result': instance.result,
      'validations': instance.validations,
    };
