import 'package:diplomayin/view_models/scan_view_model.dart';
import 'package:flutter/material.dart';

class ScanItemWidget extends StatelessWidget {
  const ScanItemWidget({required this.scanViewModel, Key? key})
      : super(key: key);
  final ScanViewModel scanViewModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.teal,
          borderRadius: BorderRadius.all(Radius.circular(8.0))),
      padding: const EdgeInsets.all(8),
      child: const Text("He'd have you all unravel at the"),
    );
  }
}
