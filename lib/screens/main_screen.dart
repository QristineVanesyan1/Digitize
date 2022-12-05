import 'package:diplomayin/constants/constants.dart';
import 'package:diplomayin/models/a.dart';
import 'package:diplomayin/repository/db_repository.dart';
import 'package:diplomayin/screens/home_screen.dart';
import 'package:diplomayin/utils/utils.dart';
import 'package:diplomayin/widget/doc_item_widget.dart';
import 'package:diplomayin/widget/logout_button.dart';
import 'package:diplomayin/widget/scan_item_widget.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  var list = [];
  List<Widget> get _tabViews => [
        Utils.refreshWidget(GlobalKey(), () async {
//TODO
        },
            Utils.gridWidget(
              List.generate(
                  list.length,
                  (index) => ScanItemWidget(
                        a: list[index],
                      )),
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

  late final TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
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
          bottom: TabBar(controller: _tabController, tabs: _tabs),
          actions: const [LogoutButton()],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () => Utils.navigatorPush(context, const HomeScreen()),
          label: const Text(
            'SCAN',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          icon: const Icon(Icons.document_scanner_outlined),
          backgroundColor: Colors.yellow,
        ),
        body: FutureBuilder(
          future: _future(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            return TabBarView(controller: _tabController, children: _tabViews);
          },
        ));
  }

  Future<ConnectionState> _future() async {
    DbRepository db = DbRepository();
    await DbRepository.getDb();
    final data = await db.getData();
    data.forEach((e) {
      print(e);
      final b = A.toJson(e);
      list.add(b);
    });

    return ConnectionState.done;
  }
}
