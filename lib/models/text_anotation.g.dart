// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_anotation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TextAnnotation _$TextAnnotationFromJson(Map<String, dynamic> json) =>
    TextAnnotation(
      (json['Pages'] as List<dynamic>)
          .map((e) => Page.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TextAnnotationToJson(TextAnnotation instance) =>
    <String, dynamic>{
      'Pages': instance.Pages,
    };
