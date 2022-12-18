import 'dart:convert';
import 'package:diplomayin/constants/constants.dart';
import 'package:diplomayin/env/env.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

abstract class Utils {
  static ThemeData getTheme() => ThemeData(
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
              fontSize: Constants.appBarFontSize)));

  static String decodeBase64(String base64Txt) =>
      utf8.decode(base64.decode(base64Txt));

  static void pushReplacement(BuildContext context, Widget screen) =>
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => screen),
      );

  static Future<dynamic> navigatorPush(
          BuildContext context, Widget screen) async =>
      await Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => screen),
      );

  static void navigatorPop(BuildContext context) => Navigator.of(context).pop();

  static void showAppBottomSheet(BuildContext context, Widget child) =>
      showModalBottomSheet<void>(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0))),
          context: context,
          builder: (BuildContext context) {
            return child;
          });

  static void showAppDialog(BuildContext context, Widget child) {
    showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return child;
        });
  }

  static AppBar appBar() => AppBar(
        centerTitle: true,
        title: const Text(Constants.appTitle),
      );

  static Widget refreshWidget(
          Key key, RefreshCallback onRefresh, Widget child) =>
      RefreshIndicator(key: key, onRefresh: onRefresh, child: child);

  static Widget gridWidget(List<Widget> children) => GridView.count(
      physics: const AlwaysScrollableScrollPhysics(),
      primary: false,
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      children: children);

  static Widget listViewWidget(List<Widget> children) => ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
      itemBuilder: (BuildContext context, int index) => children[index],
      itemCount: children.length,
      separatorBuilder: (BuildContext context, int index) => Divider());

  static Future<String> makeRequest(String path) async {
    var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            'https://backend.scandocflow.com/v1/api/documents/extract?access_token=${Env.key}'));
    request.files.add(await http.MultipartFile.fromPath('type', path));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      return (await response.stream.bytesToString());
    }
    if (response.statusCode == 401) {
      throw Exception('Authorization Error');
    } else {
      throw Exception('Something went wrong');
    }
  }
}
