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
        items: [
          BottomNavigationBarItem(
              label: "首页",
              icon: Icon(
                Icons.home,
                color: kTabBarIconColor,
              ),
              activeIcon: Icon(Icons.home)),
          BottomNavigationBarItem(
              label: "书影音",
              icon: Icon(
                Icons.movie,
                color: kTabBarIconColor,
              ),
              activeIcon: Icon(Icons.movie)),
          BottomNavigationBarItem(
              label: "小组",
              icon: Icon(
                Icons.group,
                color: kTabBarIconColor,
              ),
              activeIcon: Icon(Icons.group)),
          BottomNavigationBarItem(
              label: "市集",
              icon: Icon(
                Icons.receipt,
                color: kTabBarIconColor,
              ),
              activeIcon: Icon(Icons.receipt)),
          BottomNavigationBarItem(
              label: "我的",
              icon: Icon(
                Icons.person,
                color: kTabBarIconColor,
              ),
              activeIcon: Icon(Icons.person))
        ],
      ),
    );
  }
}
