import 'dart:io';

class ScanViewModel {
  ScanViewModel(
      {required this.title, required this.dateTime, required this.file});
  final String title;
  final String dateTime;
  final File file;
}
