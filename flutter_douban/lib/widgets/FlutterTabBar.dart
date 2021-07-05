import 'package:flutter/material.dart';
import 'package:flutter_douban/theme/app_colors.dart';
import 'package:flutter_douban/widgets/FlutterTabBarView.dart';

final titleList = ['电影', '电视', '综艺', '读书', '音乐', '同城'];
List<Widget> tabList;
TabController _tabController;

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  var tabBar;

  List<Widget> getTabList() {
    return titleList
        .map((item) => Text("$item", style: TextStyle(fontSize: 18)))
        .toList();
  }

  @override
  void initState() {
    super.initState();
    tabBar = FlutterTabBar();
    tabList = getTabList();
    _tabController = TabController(length: tabList.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: DefaultTabController(
          length: titleList.length,
          child: Column(
            children: [
              tabBar,
              Expanded(
                  child: Container(
                color: Colors.white70,
                width: double.infinity,
                alignment: Alignment.center,
                child: FlutterTabBarView(tabController: _tabController),
              ))
            ],
          ),
        ),
      ),
    );
  }
}

class FlutterTabBar extends StatefulWidget {
  FlutterTabBar({Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _FlutterTabBarState();
  }
}

class _FlutterTabBarState extends State<FlutterTabBar> {
  Color selectColor, unselectedColor;
  TextStyle selectStyle, unselectStyle;

  @override
  void initState() {
    super.initState();
    selectColor = kSelColor;
    unselectedColor = kUnSelColor;
    selectStyle = TextStyle(fontSize: 18, color: selectColor);
    unselectStyle = TextStyle(fontSize: 18, color: selectColor);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(
      tabs: tabList,
      isScrollable: true,
      controller: _tabController,
      indicatorColor: selectColor,
      labelColor: selectColor,
      labelStyle: selectStyle,
      unselectedLabelColor: unselectedColor,
      unselectedLabelStyle: unselectStyle,
      indicatorSize: TabBarIndicatorSize.label,
    );
  }
}
