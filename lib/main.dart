import 'package:diplomayin/constants/constants.dart';
import 'package:diplomayin/screens/home_screen.dart';
import 'package:diplomayin/screens/login_screen.dart';
import 'package:diplomayin/screens/main_screen.dart';
import 'package:diplomayin/screens/onboarding_screen.dart';
import 'package:diplomayin/screens/startup_screen.dart';
import 'package:diplomayin/utils/utils.dart';
import 'package:diplomayin/widget/doc_item_widget.dart';
import 'package:diplomayin/widget/scan_item_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

GetIt getIt = GetIt.instance;
bool shouldUseFirebaseEmulator = false;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb) {
    await Firebase.initializeApp();
  } else {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: 'AIzaSyAgUhHU8wSJgO5MVNy95tMT07NEjzMOfz0',
        appId: '1:448618578101:web:0b650370bb29e29cac3efc',
        messagingSenderId: '448618578101',
        projectId: 'react-native-firebase-testing',
        authDomain: 'react-native-firebase-testing.firebaseapp.com',
        databaseURL: 'https://react-native-firebase-testing.firebaseio.com',
        storageBucket: 'react-native-firebase-testing.appspot.com',
        measurementId: 'G-F79DJ0VFGS',
      ),
    );
  }

  if (shouldUseFirebaseEmulator) {
    await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  }

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.lightBlue,
            backgroundColor: Colors.white,
            fontFamily: Constants.appFontFamily,
            textTheme: const TextTheme(
                headline1: TextStyle(
                    color: Colors.white,
                    fontFamily: Constants.appBarFontFamily,
                    fontSize: 40.0)),
            appBarTheme: const AppBarTheme(
                foregroundColor: Colors.white,
                titleTextStyle: TextStyle(
                    fontFamily: Constants.appBarFontFamily,
                    fontSize: Constants.appBarFontSize))),
        home: StartupScreen(
            onComplete: (context) =>
                Utils.pushReplacement(context, const LoginScreen()))
        // MainScreen(tabBarViews: _tabViews, tabs: _tabs) //
        // const HomeScreen()

        );
  }

  List<Widget> get _tabViews => [
        Utils.refreshWidget(GlobalKey(), () async {
//TODO
        },
            Utils.gridWidget(
              <Widget>[
                ScanItemWidget(),
                ScanItemWidget(),
                ScanItemWidget(),
                ScanItemWidget(),
                ScanItemWidget(),
                ScanItemWidget(),
                ScanItemWidget(),
                ScanItemWidget(),
                ScanItemWidget(),
                ScanItemWidget(),
                ScanItemWidget(),
                ScanItemWidget(),
              ],
            )),
        Utils.refreshWidget(GlobalKey(), () async {
//TODO
        },
            Utils.listViewWidget(
              <Widget>[
                DocItemWidget(),
                DocItemWidget(),
                DocItemWidget(),
                DocItemWidget(),
                DocItemWidget(),
                DocItemWidget(),
                DocItemWidget(),
                DocItemWidget(),
                DocItemWidget(),
              ],
            )),
      ];
  List<Widget> get _tabs => [
        _tabBarTitle("Scans"),
        _tabBarTitle("Documents"),
      ];

  Widget _tabBarTitle(String title) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text(title,
            style: const TextStyle(
                fontWeight: FontWeight.w500, color: Colors.white)),
      );

  // StartupScreen(
  //   onComplete: (context) =>
  //       Utils.pushReplacement(context, const OnboardingScreen()),
  // ));
}
