import 'package:diplomayin/screens/sign_up_screen.dart';
import 'package:diplomayin/utils/utils.dart';
import 'package:diplomayin/widget/app_error_widget.dart';
import 'package:diplomayin/widget/option_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
                  const SizedBox(
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
                        final firebaseAuth = FirebaseAuth.instance;
                        await firebaseAuth.signInWithEmailAndPassword(
                            email: _textEditingController1.text,
                            password: _textEditingController2.text);

                        // final user = firebaseAuth.currentUser;
                        // if (user != null) {
                        //   if (!user.emailVerified) {
                        //     await user.sendEmailVerification();
                        //   }
                        // }
                      } catch (e) {
                        Utils.showAppDialog(
                            context,
                            AppErrorWidget(
                              message: e.toString(),
                            ));
                      }
                    },
                    text: 'Continue',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account?"),
                      TextButton(
                          onPressed: () =>
                              Utils.pushReplacement(context, SignUpScreen()),
                          child: const Text("Sign Up")),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            )));
  }
}
