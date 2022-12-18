import 'package:diplomayin/view_models/doc_item_view_model.dart';
import 'package:flutter/material.dart';

class DocItemWidget extends StatelessWidget {
  const DocItemWidget({required this.docItemViewModel, Key? key})
      : super(key: key);
  final DocItemViewModel docItemViewModel;

  String get imgPath => 'assets/images/documents.png';

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(imgPath),
      title: Text(
        docItemViewModel.file + '.txt',
        maxLines: 1,
        style: const TextStyle(
            color: Colors.black87, fontWeight: FontWeight.w500, fontSize: 16.0),
      ),
      subtitle: Text(docItemViewModel.timestamp.toString(),
          style: const TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.w400,
              fontSize: 10.0)),
    );
  }
}
