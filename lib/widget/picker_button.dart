import 'package:flutter/material.dart';

class PickerButton extends StatelessWidget {
  const PickerButton(
      {required this.onTap, required this.icon, required this.text, Key? key})
      : super(key: key);
  final VoidCallback onTap;
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        padding: const EdgeInsets.only(top: 10),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.white,
            onPrimary: Colors.grey,
            shadowColor: Colors.grey[400],
            elevation: 10,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)),
          ),
          onPressed: onTap,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  icon,
                  size: 30,
                ),
                Text(
                  text,
                  style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                )
              ],
            ),
          ),
        ));
  }
}
