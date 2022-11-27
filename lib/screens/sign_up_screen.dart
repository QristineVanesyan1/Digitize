import 'package:diplomayin/screens/home_screen.dart';
import 'package:diplomayin/screens/login_screen.dart';
import 'package:diplomayin/screens/main_screen.dart';
import 'package:diplomayin/screens/onboarding_screen.dart';
import 'package:diplomayin/utils/utils.dart';
import 'package:diplomayin/widget/option_button.dart';
import 'package:diplomayin/widget/picker_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late final TextEditingController _textEditingController1 =
      TextEditingController();
  late final TextEditingController _textEditingController2 =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Utils.appBar(),
        body: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 70,
                        ),
                        const Text(
                          'Sign Up',
                          style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.w600,
                              fontSize: 20),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        TextField(
                          controller: _textEditingController1,
                          enableSuggestions: false,
                          decoration: const InputDecoration(
                            labelText: 'Email',
                            enabledBorder: OutlineInputBorder(),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        TextField(
                          enableSuggestions: false,
                          controller: _textEditingController2,
                          decoration: const InputDecoration(
                            labelText: 'Password',
                            enabledBorder: OutlineInputBorder(),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        TextField(
                          enableSuggestions: false,
                          controller: _textEditingController2,
                          decoration: const InputDecoration(
                            labelText: 'Repeat password',
                            enabledBorder: OutlineInputBorder(),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        SignUpButton(
                          onTap: () async {
                            try {
                              var a = await FirebaseAuth.instance
                                  .createUserWithEmailAndPassword(
                                      email: _textEditingController1.text,
                                      password: _textEditingController2.text);

                              Utils.pushReplacement(context, HomeScreen());
                            } catch (e) {
                              Utils.showAppDialog(context, Text(e.toString()));
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
                            Text("Already have an account?"),
                            TextButton(
                                onPressed: () => Utils.pushReplacement(
                                    context, LoginScreen()),
                                child: const Text("Sign In")),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ));
            }));
  }
}
