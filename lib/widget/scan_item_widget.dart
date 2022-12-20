import 'dart:convert';
import 'dart:io';

import 'package:diplomayin/models/ocr.dart';
import 'package:diplomayin/models/scan_item_view_model.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class ScanItemWidget extends StatefulWidget {
  const ScanItemWidget({required this.scanItemViewModel, this.onCardPressed});
  final ScanItemViewModel scanItemViewModel;
  final VoidCallback? onCardPressed;

  @override
  State<ScanItemWidget> createState() => _ScanItemWidgetState();
}

class _ScanItemWidgetState extends State<ScanItemWidget> {
  String a = '';
  Future<ConnectionState> _f() async {
    var _dir = await getApplicationDocumentsDirectory();
    a = _dir.path;
    return ConnectionState.done;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _f(),
        builder: (context, state) {
          if (state.connectionState != ConnectionState.done) {
            return CircularProgressIndicator();
          }
          return InkWell(
            onTap: () => widget.onCardPressed?.call(),
            child: Stack(
              children: [
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                    padding: const EdgeInsets.all(8),
                    child: Image.asset('${a}${widget.scanItemViewModel.image}'),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.lightBlue,
                        border: Border.all(width: 1, color: Colors.grey),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8.0))),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.scanItemViewModel.title ?? 'N/A',
                              maxLines: 2,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 14.0),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            // const Text(
                            //   "12/10/2022",
                            //   maxLines: 1,
                            //   style: TextStyle(
                            //       color: Colors.white,
                            //       fontWeight: FontWeight.w400,
                            //       fontSize: 10.0),
                            // )
                          ]),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
