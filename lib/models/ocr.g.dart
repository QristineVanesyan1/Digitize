// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ocr.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OCR _$OCRFromJson(Map<String, dynamic> json) => OCR(
      json['status'] as String,
      (json['documents'] as List<dynamic>)
          .map((e) => Document.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['id'] as String,
    );

Map<String, dynamic> _$OCRToJson(OCR instance) => <String, dynamic>{
      'status': instance.status,
      'documents': instance.documents,
      'id': instance.id,
    };
