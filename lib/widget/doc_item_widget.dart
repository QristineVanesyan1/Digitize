import 'dart:math';

import 'package:diplomayin/view_models/scan_view_model.dart';
import 'package:flutter/material.dart';

class DocItemWidget extends StatelessWidget {
  // const ScanItemWidget({required this.scanViewModel, Key? key})
  //     : super(key: key);
  // final ScanViewModel scanViewModel;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset('assets/images/documents.png'),
      title: Text(
        Random().nextInt(1000000).toString() + '.txt',
        style: TextStyle(
            color: Colors.black87, fontWeight: FontWeight.w500, fontSize: 16.0),
      ),
      subtitle: Text('03/05/2022',
          style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.w400,
              fontSize: 10.0)),
    );
  }
}
