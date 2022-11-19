// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'document.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Document _$DocumentFromJson(Map<String, dynamic> json) => Document(
      json['id'] as String,
      json['version'] as String,
      json['type'] as String,
      (json['pages'] as List<dynamic>)
          .map((e) => PageDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['categorizedUrl'] as String,
      json['plainTextBase64'] as String,
      ValidationChecks.fromJson(
          json['validationChecks'] as Map<String, dynamic>),
      TextAnnotation.fromJson(json['textAnnotation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DocumentToJson(Document instance) => <String, dynamic>{
      'id': instance.id,
      'version': instance.version,
      'type': instance.type,
      'pages': instance.pages,
      'categorizedUrl': instance.categorizedUrl,
      'plainTextBase64': instance.plainTextBase64,
      'validationChecks': instance.validationChecks,
      'textAnnotation': instance.textAnnotation,
    };
