class DocItemViewModel {
  final int id;
  final String file;
  final String json;
  final String? timestamp;
  final String? titleTxt;
  DocItemViewModel({
    required this.id,
    required this.file,
    required this.json,
    required this.timestamp,
    required this.titleTxt,
  });

  factory DocItemViewModel.toJson(Map<String, dynamic> json) =>
      DocItemViewModel(
        id: json['idTxt'] as int,
        file: json['fileTxt'] as String,
        json: json['jsonTxt'] as String,
        titleTxt: json['titleTxt'] as String,
        timestamp: json['timestampTxt'] as String?,
      );
}
