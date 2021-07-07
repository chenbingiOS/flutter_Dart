import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_douban/theme/app_colors.dart';
import 'package:flutter_douban/pages/Movie/FlutterTabBarView.dart';
import 'package:flutter_douban/pages/Movie/Widgets/SearchTextFieldWidget.dart';

final titleList = ['电影', '电视', '综艺', '读书', '音乐', '同城'];
List<Widget> tabList;
TabController _tabController;

class BookAudioVideoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BookAudioVideoPageState();
  }
}

class _BookAudioVideoPageState extends State<BookAudioVideoPage>
    with SingleTickerProviderStateMixin {
  var tabBar;
  List<Widget> getTabList() {
    return titleList
        .map((item) => Text("$item", style: TextStyle(fontSize: 15)))
        .toList();
  }

  @override
  void initState() {
    super.initState();
    tabBar = BookAudioVideoPageTabBar();
    tabList = getTabList();
    _tabController = TabController(length: tabList.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: DefaultTabController(
            length: titleList.length, child: getNestedScrollView(tabBar)),
      ),
    );
  }
}

Widget getNestedScrollView(Widget tabBar) {
  return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverToBoxAdapter(
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.all(10.0),
              child: SearchTextFieldWidget(
                hintText: "用一部电影来形容你的 2018",
              ),
            ),
          ),
          SliverPersistentHeader(
              floating: true,
              pinned: true,
              delegate: _SliverAppBarDelegate(
                  maxHeight: 49.9,
                  minHeight: 49.0,
                  child: Container(
                    color: Colors.white,
                    child: tabBar,
                  )))
        ];
      },
      body: FlutterTabBarView(tabController: _tabController));
}

class BookAudioVideoPageTabBar extends StatefulWidget {
  BookAudioVideoPageTabBar({Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _BookAudioVideoPageTabBarState();
  }
}

class _BookAudioVideoPageTabBarState extends State<BookAudioVideoPageTabBar> {
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

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({this.minHeight, this.maxHeight, this.child});
  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => math.max((minHeight ?? kToolbarHeight), minExtent);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  bool shouldRebuild(covariant _SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
