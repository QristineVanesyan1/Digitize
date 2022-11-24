import 'package:diplomayin/utils/utils.dart';
import 'package:diplomayin/widget/option_button.dart';
import 'package:diplomayin/widget/picker_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Utils.appBar(),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Sign Up',
                    style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.w600,
                        fontSize: 20),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'email',
                      // errorText: 'Error message',
                      enabledBorder: const OutlineInputBorder(
                          // width: 0.0 produces a thin "hairline" border
                          // borderSide: const BorderSide(color: Colors.grey, width: 0.0),
                          ),
                      border: const OutlineInputBorder(),
                      // labelStyle: new TextStyle(color: Colors.green),
                    ),
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Login',
                      // errorText: 'Error message',
                      enabledBorder: const OutlineInputBorder(
                          // width: 0.0 produces a thin "hairline" border
                          // borderSide: const BorderSide(color: Colors.grey, width: 0.0),
                          ),
                      border: const OutlineInputBorder(),
                      // labelStyle: new TextStyle(color: Colors.green),
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Login',
                      // errorText: 'Error message',
                      enabledBorder: const OutlineInputBorder(
                          // width: 0.0 produces a thin "hairline" border
                          // borderSide: const BorderSide(color: Colors.grey, width: 0.0),
                          ),
                      border: const OutlineInputBorder(),
                      // labelStyle: new TextStyle(color: Colors.green),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  SignUpButton(
                    onTap: () {},
                    text: 'Continue',
                  )
                ],
              ),
            )));
  }
}
