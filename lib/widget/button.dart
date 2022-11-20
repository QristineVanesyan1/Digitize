import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  const Button({required this.onTap, required this.text, Key? key})
      : super(key: key);
  final GestureTapCallback onTap;
  final String text;

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onTap,
      child: Text(
        widget.text,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
