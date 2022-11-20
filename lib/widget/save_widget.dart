import 'package:diplomayin/repository/db_repository.dart';
import 'package:diplomayin/widget/option_button.dart';
import 'package:flutter/material.dart';

class SaveWidget extends StatefulWidget {
  const SaveWidget(
      {required this.onSave,
      required this.onSaveTxt,
      required this.onSeeResult,
      Key? key})
      : super(key: key);
  final VoidCallback onSeeResult;
  final VoidCallback onSaveTxt;
  final VoidCallback onSave;
  @override
  State<SaveWidget> createState() => _SaveWidgetState();
}

class _SaveWidgetState extends State<SaveWidget> {
  final DbRepository db = DbRepository();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: kMaterialListPadding.copyWith(left: 20.0, right: 20.0),
          child: const Text(
            'Save recognized text or export in favorite extension',
            textAlign: TextAlign.center,
          ),
        ),
        const Divider(),
        Column(
          children: [
            OptionButton(onTap: widget.onSeeResult, text: 'See result'),
            OptionButton(onTap: widget.onSaveTxt, text: 'Save .txt'),
            OptionButton(onTap: widget.onSave, text: 'Save'),
            const SizedBox(
              height: 20.0,
            )
          ],
        )
      ],
    );
  }
}
