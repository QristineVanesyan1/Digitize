import 'package:json_annotation/json_annotation.dart';

part 'word.g.dart';

@JsonSerializable()
class Word {
  Word(this.Id, this.Text, this.Outline, this.Confidence, this.Lang);

  final String Id;
  final String Text;
  final List<double> Outline;
  final double Confidence;
  final String Lang;
  factory Word.fromJson(Map<String, dynamic> json) => _$WordFromJson(json);

  Map<String, dynamic> toJson() => _$WordToJson(this);
}
