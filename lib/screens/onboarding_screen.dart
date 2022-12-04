// ignore_for_file: library_private_types_in_public_api

import 'package:diplomayin/screens/sign_up_screen.dart';
import 'package:diplomayin/utils/utils.dart';
import 'package:diplomayin/view_models/onboarding_screen_type.dart';
import 'package:diplomayin/widget/button.dart';
import 'package:diplomayin/widget/on_board_indicator.dart';
import 'package:diplomayin/widget/on_board_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return _render();
  }

  Widget _render() {
    return Scaffold(resizeToAvoidBottomInset: false, body: _renderBody());
  }

  Widget _renderBody() {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Flexible(flex: 4, child: _renderPageView()),
          Flexible(
              flex: 1,
              child: Column(children: [
                _renderBuildIndicator(),
                _renderBottomButton(),
              ]))
        ]));
  }

  Widget _renderBuildIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _buildPageIndicator(),
    );
  }

  List<Widget> get boardingList => const [
        OnBoardItem(
          itemType: OnBoardingScreenType.productivity,
        ),
        OnBoardItem(
          itemType: OnBoardingScreenType.organized,
        ),
        OnBoardItem(
          itemType: OnBoardingScreenType.aligned,
        ),
      ];
  Widget _renderPageView() {
    return PageView(
      physics: const BouncingScrollPhysics(),
      controller: _pageController,
      onPageChanged: (int page) {
        setState(() {
          _currentPage = page;
        });
      },
      children: boardingList,
    );
  }

  Widget _renderBottomButton() {
    return Button(
      onTap: () => Utils.pushReplacement(context, SignUpScreen()),
      text: 'GET STARTED',
    );
  }

  List<Widget> _buildPageIndicator() {
    var list = <Widget>[];
    for (var i = 0; i < boardingList.length; i++) {
      list.add(i == _currentPage
          ? const OnBoardIndicator(isActive: true)
          : const OnBoardIndicator(isActive: false));
    }
    return list;
  }
}
