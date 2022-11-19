import 'package:json_annotation/json_annotation.dart';

part 'page_detail.g.dart';

@JsonSerializable()
class PageDetail {
  final int fileIdx;
  final int offset;
  final int count;

  PageDetail(this.fileIdx, this.offset, this.count);
  factory PageDetail.fromJson(Map<String, dynamic> json) =>
      _$PageDetailFromJson(json);
  Map<String, dynamic> toJson() => _$PageDetailToJson(this);
}
