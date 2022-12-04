import 'package:flutter/material.dart';

class ScanItemWidget extends StatelessWidget {
  // const ScanItemWidget({required this.scanViewModel, Key? key})
  //     : super(key: key);
  // final ScanViewModel scanViewModel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.grey),
                borderRadius: BorderRadius.all(Radius.circular(8.0))),
            padding: const EdgeInsets.all(8),
            child: Image.asset("assets/images/text.png"),
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "IMG_565465456",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 14.0),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      "12/10/2022",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 10.0),
                    )
                  ]),
            ),
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.lightBlue,
                border: Border.all(width: 1, color: Colors.grey),
                borderRadius: BorderRadius.all(Radius.circular(8.0))),
          ),
        ),
      ],
    );
  }
}
