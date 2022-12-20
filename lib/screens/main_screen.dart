import 'package:diplomayin/constants/constants.dart';
import 'package:diplomayin/models/scan_item_view_model.dart';
import 'package:diplomayin/repository/db_repository.dart';
import 'package:diplomayin/screens/details_screen.dart';
import 'package:diplomayin/screens/home_screen.dart';
import 'package:diplomayin/screens/recording_screen.dart';
import 'package:diplomayin/utils/utils.dart';
import 'package:diplomayin/view_models/doc_item_view_model.dart';
import 'package:diplomayin/widget/doc_item_widget.dart';
import 'package:diplomayin/widget/expandable_fab.dart';
import 'package:diplomayin/widget/logout_button.dart';
import 'package:diplomayin/widget/scan_item_widget.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  List<Widget> get _tabs => [
        _tabBarTitle("Scans"),
        _tabBarTitle("Documents"),
      ];
  List<ScanItemViewModel> list = [];
  List<DocItemViewModel> docs = [];
  final _scansRefreshKey = GlobalKey<RefreshIndicatorState>();
  final _docsRefreshKey = GlobalKey<RefreshIndicatorState>();

  Future<void> _onRefresh() async {
    _scansRefreshKey.currentState?.show();
    await _fetchScannedFiles();
    setState(() {});
  }

  Widget get _scans => Utils.refreshWidget(
      _scansRefreshKey,
      _onRefresh,
      list.isEmpty
          ? const EmptyList()
          : Utils.gridWidget(
              List.generate(
                  list.length,
                  (index) => ScanItemWidget(
                        scanItemViewModel: list[index],
                        onCardPressed: () {
                          Utils.navigatorPush(
                              context,
                              TxtReaderScreen(
                                scanItemViewModel: list[index],
                              ));
                        },
                      )),
            ));

  Widget get _docs => Utils.refreshWidget(
        _docsRefreshKey,
        _onRefresh,
        docs.isEmpty
            ? const EmptyList()
            : Utils.listViewWidget(List.generate(
                docs.length,
                (index) => DocItemWidget(
                    docItemViewModel: docs[index],
                    onCardPressed: () {
                      Utils.navigatorPush(
                          context,
                          TxtReaderScreen1(
                            docItemViewModel: docs[index],
                          ));
                    }),
              )),
      );
  List<Widget> get _tabViews => [_scans, _docs];

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
        floatingActionButton: _ActionButton(
          scan: _onScanTap,
          textRecognition: _onTextRecognition,
        ),
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

  Future<void> _onTextRecognition() async {
    bool? isRefresh = await Utils.navigatorPush(context, RecordingScreen());
    if (isRefresh != null && isRefresh == true) {
      await _fetchScannedFiles();
      setState(() {});
    }
  }

  Future<ConnectionState> _fetchScannedFiles() async {
    //TODO Separate fetch of files
    DbRepository db = DbRepository();
    await DbRepository.getDb();
    final data = await db.getData();
    List<ScanItemViewModel> tempList = [];
    // TODO: optimize after MVP1 :D
    for (var e in data) {
      tempList.add(ScanItemViewModel.toJson(e));
    }
    list = tempList;

    final dataTxt = await db.getDataTxt();
    List<DocItemViewModel> docsTempList = [];

    // TODO: optimize after MVP1 :D
    for (var e in dataTxt) {
      docsTempList.add(DocItemViewModel.toJson(e));
    }
    docs = docsTempList;

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

@immutable
class ActionButton extends StatelessWidget {
  const ActionButton({
    super.key,
    this.onPressed,
    required this.icon,
  });

  final VoidCallback? onPressed;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: const CircleBorder(),
      clipBehavior: Clip.antiAlias,
      color: Colors.yellow,
      elevation: 4.0,
      child: IconButton(
        onPressed: onPressed,
        icon: icon,
        color: Colors.lightBlue,
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({required this.textRecognition, required this.scan});
  final VoidCallback? textRecognition;
  final VoidCallback? scan;

  @override
  Widget build(BuildContext context) {
    return ExpandableFab(
      distance: 100.0,
      children: [
        ActionButton(
          onPressed: textRecognition,
          icon: const Icon(
            Icons.audio_file,
            color: Colors.black87,
          ),
        ),
        ActionButton(
          onPressed: scan,
          icon: const Icon(
            Icons.insert_photo,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}
