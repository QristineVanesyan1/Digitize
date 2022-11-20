import 'package:diplomayin/constants/constants.dart';
import 'package:flutter/material.dart';

class StartupScreen extends StatefulWidget {
  const StartupScreen({required this.onComplete, Key? key}) : super(key: key);
  final Function(BuildContext context) onComplete;

  @override
  State<StartupScreen> createState() => _StartupScreenState();
}

class _StartupScreenState extends State<StartupScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(kTabScrollDuration)
          .whenComplete(() => widget.onComplete(context));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Center(
          child: Text(
        Constants.appTitle,
        style: Theme.of(context).textTheme.headline1,
      )),
    );
  }
}
