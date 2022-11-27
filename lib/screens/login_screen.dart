import 'package:diplomayin/screens/home_screen.dart';
import 'package:diplomayin/screens/main_screen.dart';
import 'package:diplomayin/screens/sign_up_screen.dart';
import 'package:diplomayin/utils/utils.dart';
import 'package:diplomayin/widget/option_button.dart';
import 'package:diplomayin/widget/picker_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController _textEditingController1 =
      TextEditingController();
  late final TextEditingController _textEditingController2 =
      TextEditingController();
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
                  SizedBox(
                    height: 100,
                  ),
                  const Text(
                    'Sign In',
                    style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.w600,
                        fontSize: 20),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextField(
                    enableSuggestions: false,
                    controller: _textEditingController1,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      // errorText: 'Error message',
                      enabledBorder: OutlineInputBorder(
                          // width: 0.0 produces a thin "hairline" border
                          // borderSide: const BorderSide(color: Colors.grey, width: 0.0),
                          ),
                      border: OutlineInputBorder(),
                      // labelStyle: new TextStyle(color: Colors.green),
                    ),
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  TextField(
                    controller: _textEditingController2,
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: const InputDecoration(
                      labelText: 'Password',

                      // errorText: 'Error message',
                      enabledBorder: OutlineInputBorder(
                          // width: 0.0 produces a thin "hairline" border
                          // borderSide: const BorderSide(color: Colors.grey, width: 0.0),
                          ),
                      border: OutlineInputBorder(),
                      // labelStyle: new TextStyle(color: Colors.green),
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  SignUpButton(
                    onTap: () async {
                      try {
                       await FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                                email: _textEditingController1.text,
                                password: _textEditingController2.text);
                         Utils.pushReplacement(context, MainScreen());
                      } catch (e) {
                        Utils.showAppDialog(context, Text(e.toString()));
                      }
                    },
                    text: 'Continue',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account?"),
                      TextButton(
                          onPressed: () =>
                              Utils.pushReplacement(context, SignUpScreen()),
                          child: Text("Sign Up")),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            )));
  }
}
