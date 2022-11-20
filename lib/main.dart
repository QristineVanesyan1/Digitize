import 'package:diplomayin/constants/constants.dart';
import 'package:diplomayin/screens/home_screen.dart';
import 'package:diplomayin/screens/main_screen.dart';
import 'package:diplomayin/screens/onboarding_screen.dart';
import 'package:diplomayin/screens/startup_screen.dart';
import 'package:diplomayin/utils/utils.dart';
import 'package:diplomayin/widget/scan_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void main() {
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
        home:
            //MainScreen(tabBarViews: _tabViews, tabs: _tabs) //
            const HomeScreen());
  }
/*
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
              ],
            )),
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
            ))
      ];
  List<Widget> get _tabs => [
        _tabBarTitle("Scans"),
        _tabBarTitle("Documents"),
        _tabBarTitle("Favorites")
      ];

  Widget _tabBarTitle(String title) => Text(title,
      style: const TextStyle(fontWeight: FontWeight.w500, color: Colors.white));
*/
  // StartupScreen(
  //   onComplete: (context) =>
  //       Utils.pushReplacement(context, const OnboardingScreen()),
  // ));
}
