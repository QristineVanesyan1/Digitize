import 'package:diplomayin/models/word.dart';
import 'package:json_annotation/json_annotation.dart';

part 'page.g.dart';

@JsonSerializable()
class Page {
  final double clockwiseOrientation;
  final List<Word> words;

  Page(this.clockwiseOrientation, this.words);
  factory Page.fromJson(Map<String, dynamic> json) => _$PageFromJson(json);
  Map<String, dynamic> toJson() => _$PageToJson(this);
}
