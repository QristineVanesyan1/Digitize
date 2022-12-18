class DocItemViewModel {
  final int id;
  final String file;
  final String json;
  final String? timestamp;
  DocItemViewModel({
    required this.id,
    required this.file,
    required this.json,
    required this.timestamp,
  });

  factory DocItemViewModel.toJson(Map<String, dynamic> json) =>
      DocItemViewModel(
        id: json['idTxt'] as int,
        file: json['fileTxt'] as String,
        json: json['jsonTxt'] as String,
        timestamp: json['timestampTxt'] as String?,
      );
}
