import 'package:diplomayin/constants/constants.dart';
import 'package:diplomayin/models/scan_item_view_model.dart';
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
  var scansRefreshKey = GlobalKey<RefreshIndicatorState>();
  var docsRefreshKey = GlobalKey<RefreshIndicatorState>();

  List<Widget> get _tabViews => [
        Utils.refreshWidget(scansRefreshKey, () async {
          scansRefreshKey.currentState?.show();
          await _fetchScannedFiles();
          setState(() {});
        },
            list.isEmpty
                ? const EmptyList()
                : Utils.gridWidget(
                    List.generate(
                        list.length,
                        (index) => ScanItemWidget(
                              scanItemViewModel: list[index],
                            )),
                  )),
        Utils.refreshWidget(docsRefreshKey, () async {
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
        floatingActionButton: _ScanButton(onTap: _onScanTap),
        body: FutureBuilder(
          future: _fetchScannedFiles(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            return TabBarView(controller: _tabController, children: _tabViews);
          },
        ));
  }

  Future<void> _onScanTap() async {
    bool? isRefresh = await Utils.navigatorPush(context, const HomeScreen());
    if (isRefresh != null && isRefresh == true) {
      await _fetchScannedFiles();
      setState(() {});
    }
  }

  Future<ConnectionState> _fetchScannedFiles() async {
    DbRepository db = DbRepository();
    await DbRepository.getDb();
    final data = await db.getData();
    var tempList = [];
    // TODO optimize after MVP1 :D
    for (var e in data) {
      tempList.add(ScanItemViewModel.toJson(e));
    }
    list = tempList;
    return ConnectionState.done;
  }
}

class EmptyList extends StatelessWidget {
  const EmptyList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text(
      'No result',
      style: TextStyle(color: Colors.grey, fontSize: 18.0),
    ));
  }
}

class _ScanButton extends StatelessWidget {
  const _ScanButton({this.onTap});
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () => onTap?.call(),
      label: const Text(
        'SCAN',
        style: TextStyle(fontWeight: FontWeight.w600),
      ),
      icon: const Icon(Icons.document_scanner_outlined),
      backgroundColor: Colors.yellow,
    );
  }
}
