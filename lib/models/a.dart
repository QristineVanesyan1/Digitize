class A {
  final int id;
  final String file;
  final String image;
  final String json;
  final String? timestamp;
  A({
    required this.id,
    required this.file,
    required this.image,
    required this.json,
    required this.timestamp,
  });

  factory A.toJson(Map<String, dynamic> json) => A(
        id: json['id'] as int,
        file: json['file'] as String,
        image: json['image'] as String,
        json: json['json'] as String,
        timestamp: json['timestamp'] as String?,
      );
}
