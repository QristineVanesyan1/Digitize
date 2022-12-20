import 'package:flutter/material.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({this.onTap});
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: const Icon(Icons.save, color: Colors.white),
        onPressed: () => onTap?.call());
  }
}
