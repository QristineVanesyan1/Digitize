import 'package:diplomayin/screens/login_screen.dart';
import 'package:diplomayin/screens/main_screen.dart';
import 'package:diplomayin/utils/utils.dart';
import 'package:diplomayin/widget/app_error_widget.dart';
import 'package:diplomayin/widget/button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: Utils.getTheme(),
        home: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const WaitingScreen();
              }
              if (snapshot.hasData) {
                final User? user = snapshot.data;
                if (user != null) {
                  if (user.emailVerified == false) {
                    final user = FirebaseAuth.instance.currentUser;
                    if (user != null) {}
                    return const VerifyScreen();
                  } else {
                    return MainScreen();
                  }
                }
              }
              // return RecordingScreen();
              return const LoginScreen();
            }));
  }
}

class WaitingScreen extends StatelessWidget {
  const WaitingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Utils.appBar(),
      body: const Center(child: CircularProgressIndicator()),
    );
  }
}

class VerifyScreen extends StatefulWidget {
  const VerifyScreen({super.key});

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final firebase = FirebaseAuth.instance;
      final user = firebase.currentUser;
      if (user != null) {
        if (!user.emailVerified) {
          try {
            user.sendEmailVerification();
          } catch (e) {
            Utils.showAppDialog(
                context,
                AppErrorWidget(
                  message: e.toString(),
                ));
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Utils.appBar(),
      body: SingleChildScrollView(
          child: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          const Text(
            "Verify you Email",
            style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 20,
          ),
          Image.asset(
            'assets/images/telegram.png',
            width: 100,
          ),
          const SizedBox(
            height: 30,
          ),
          const Center(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                "To confirm your email address, tap the button in the email we send you",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Button(
            onTap: () async {
              try {
                await FirebaseAuth.instance.signOut();
              } catch (e) {
                Utils.showAppDialog(
                    context,
                    AppErrorWidget(
                      message: e.toString(),
                    ));
              }
            },
            text: 'GO BACK',
          ),
        ],
      )),
    );
  }
}
