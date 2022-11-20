import 'package:flutter/material.dart';

class OnBoardIndicator extends StatelessWidget {
  const OnBoardIndicator({Key? key, this.isActive = false}) : super(key: key);
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        margin: const EdgeInsets.symmetric(horizontal: 5.0),
        height: 8.0,
        width: 8.0,
        decoration: BoxDecoration(
          color: isActive ? Colors.lightBlue : Colors.grey,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
      ),
    );
  }
}
