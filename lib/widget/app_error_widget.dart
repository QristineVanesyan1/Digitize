import 'package:diplomayin/screens/home_screen.dart';
import 'package:diplomayin/utils/utils.dart';
import 'package:flutter/material.dart';

class AppErrorWidget extends StatelessWidget {
  const AppErrorWidget({super.key, this.message});
  final String? message;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Oops!'),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text(message ?? 'Something went wrong.'),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
            child: const Text('OK'),
            onPressed: () => Navigator.of(context).pop()),
      ],
    );
  }
}

class AlertWidget extends StatelessWidget {
  const AlertWidget(
      {super.key,
      required this.title,
      required this.message,
      required this.confirmMessage,
      required this.cancelMessage,
      this.onCancel,
      this.onConfirm});
  final String title;
  final String message;
  final String confirmMessage;
  final String cancelMessage;
  final VoidCallback? onConfirm;
  final VoidCallback? onCancel;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text(message),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
            onPressed: () {
              onCancel?.call();
              Navigator.of(context).pop();
            },
            child: Text(
              cancelMessage,
              style: const TextStyle(color: Colors.red),
            )),
        TextButton(
            onPressed: () {
              onConfirm?.call();
              Navigator.of(context).pop();
            },
            child: Text(
              confirmMessage,
              style: const TextStyle(
                  fontWeight: FontWeight.w600, color: Colors.lightBlue),
            )),
      ],
    );
  }
}
