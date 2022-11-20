import 'package:diplomayin/constants/constants.dart';
import 'package:diplomayin/screens/home_screen.dart';
import 'package:diplomayin/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({required this.tabs, Key? key, required this.tabBarViews})
      : super(key: key);
  final List<Widget> tabs;
  final List<Widget> tabBarViews;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  late final TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: widget.tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(Constants.appTitle),
        bottom: TabBar(controller: _tabController, tabs: widget.tabs),
      ),
      body:
          TabBarView(controller: _tabController, children: widget.tabBarViews),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Utils.navigatorPush(context, const HomeScreen()),
        label: const Text(
          'SCAN',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        icon: const Icon(Icons.document_scanner_outlined),
        backgroundColor: Colors.yellow,
      ),
    );
  }
}
