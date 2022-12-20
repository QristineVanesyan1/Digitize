import 'package:diplomayin/view_models/doc_item_view_model.dart';
import 'package:flutter/material.dart';

class DocItemWidget extends StatelessWidget {
  const DocItemWidget(
      {required this.docItemViewModel, this.onCardPressed, Key? key})
      : super(key: key);
  final DocItemViewModel docItemViewModel;
  final VoidCallback? onCardPressed;

  String get imgPath => 'assets/images/documents.png';

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onCardPressed,
      leading: Image.asset(imgPath),
      title: Text(
        docItemViewModel.titleTxt ?? 'N/A',
        maxLines: 1,
        style: const TextStyle(
            color: Colors.black87, fontWeight: FontWeight.w500, fontSize: 16.0),
      ),
      // subtitle: Text(docItemViewModel.timestamp.toString(),
      //     style: const TextStyle(
      //         color: Colors.black87,
      //         fontWeight: FontWeight.w400,
      //         fontSize: 10.0)),
    );
  }
}
