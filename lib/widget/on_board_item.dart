import 'package:diplomayin/view_models/onboarding_screen_type.dart';
import 'package:flutter/material.dart';

class OnBoardItem extends StatefulWidget {
  const OnBoardItem({required this.itemType, Key? key});
  final OnBoardingScreenType itemType;

  @override
  State<OnBoardItem> createState() => _OnBoardItemState();
}

class _OnBoardItemState extends State<OnBoardItem> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.only(top: 90, bottom: 30),
        child: Text(
          widget.itemType.getTitle(),
          textAlign: TextAlign.center,
          // style: getStyle(weight: FontWeight.w600, fontSize: 20),
        ),
      ),
      Image.asset(
        widget.itemType.getImagePath(),
        // \height: height / 4,
      ),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Text(
            widget.itemType.getText(),
            textAlign: TextAlign.center,
            // style: getStyle(
            //     weight: FontWeight.w500, fontSize: 16, color: regentGrayColor),
          ),
        ),
      ),
    ]);
  }
}
