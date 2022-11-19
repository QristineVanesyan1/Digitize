// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Word _$WordFromJson(Map<String, dynamic> json) => Word(
      json['Id'] as String,
      json['Text'] as String,
      (json['Outline'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      (json['Confidence'] as num).toDouble(),
      json['Lang'] as String,
    );

Map<String, dynamic> _$WordToJson(Word instance) => <String, dynamic>{
      'Id': instance.Id,
      'Text': instance.Text,
      'Outline': instance.Outline,
      'Confidence': instance.Confidence,
      'Lang': instance.Lang,
    };
