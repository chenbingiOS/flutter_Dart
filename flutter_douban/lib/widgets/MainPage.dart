import 'package:flutter/material.dart';
import 'package:flutter_douban/pages/GroupPage.dart';
import 'package:flutter_douban/pages/MoviePage.dart';
import 'package:flutter_douban/pages/PersonPage.dart';
import 'package:flutter_douban/pages/ShopPage.dart';
import 'package:flutter_douban/theme/app_colors.dart';
import 'package:flutter_douban/widgets/FlutterTabBar.dart';

class MainPageWidget extends StatefulWidget {
  MainPageWidget({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MainPageWidgetState();
  }
}

class _MainPageWidgetState extends State<MainPageWidget> {
  final List<Widget> pages = [
    HomePage(),
    MoviePage(),
    GroupPage(),
    ShopPage(),
    PersonPage()
  ];

  int _selectIndex = 0;

  final itemNames = [
    Item('首页', Icons.home),
    Item('书影音', Icons.movie),
    Item('小组', Icons.group),
    Item('市集', Icons.receipt),
    Item('我的', Icons.person)
  ];
  List<BottomNavigationBarItem> itemList;

  @override
  void initState() {
    super.initState();
    itemList = itemNames
        .map((item) => BottomNavigationBarItem(
            label: item.name,
            icon: Icon(
              item.icon,
              color: kTabBarIconColor,
            ),
            activeIcon: Icon(item.icon)))
        .toList();
  }

  Widget getWidget(int index) {
    return Offstage(
      offstage: _selectIndex != index,
      child: TickerMode(
        enabled: _selectIndex == index,
        child: pages[index],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColor,
      body: Stack(
        children: [
          getWidget(0),
          getWidget(1),
          getWidget(2),
          getWidget(3),
          getWidget(4)
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 24,
        currentIndex: _selectIndex,
        fixedColor: kNaviFixedColor,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          setState(() {
            _selectIndex = index;
          });
        },
        items: itemList,
      ),
    );
  }
}

class Item {
  String name;
  IconData icon;
  Item(this.name, this.icon);
}
