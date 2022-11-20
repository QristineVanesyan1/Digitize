import 'package:diplomayin/screens/home_screen.dart';
import 'package:flutter/material.dart';

class AppErrorWidget extends StatelessWidget {
  const AppErrorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Oops!'),
      content: SingleChildScrollView(
        child: ListBody(
          children: const <Widget>[
            Text('Something went wrong.'),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
            child: const Text('OK'),
            onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const HomeScreen()),
                (route) => false)),
      ],
    );
  }
}
