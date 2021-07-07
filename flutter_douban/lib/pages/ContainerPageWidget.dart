import 'package:flutter/material.dart';
import 'package:flutter_douban/pages/GroupPage.dart';
import 'package:flutter_douban/pages/Movie/BookAudioVideoPage.dart';
import 'package:flutter_douban/pages/PersonPage.dart';
import 'package:flutter_douban/pages/ShopPage.dart';
import 'package:flutter_douban/theme/app_colors.dart';
import 'package:flutter_douban/pages/HomePage.dart';

class ContainerPageWidget extends StatefulWidget {
  ContainerPageWidget({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ContainerPageWidgetState();
  }
}

class _ContainerPageWidgetState extends State<ContainerPageWidget> {
  final List<Widget> pages = [
    BookAudioVideoPage(),
    HomePage(),
    GroupPage(),
    ShopPage(),
    PersonPage()
  ];

  int _selectIndex = 0;

  final itemNames = [
    Item('首页', 'assets/images/ic_tab_home_active.png',
        'assets/images/ic_tab_home_normal.png'),
    Item('书影音', 'assets/images/ic_tab_subject_active.png',
        'assets/images/ic_tab_subject_normal.png'),
    Item('小组', 'assets/images/ic_tab_group_active.png',
        'assets/images/ic_tab_group_normal.png'),
    Item('市集', 'assets/images/ic_tab_shiji_active.png',
        'assets/images/ic_tab_shiji_normal.png'),
    Item('我的', 'assets/images/ic_tab_profile_active.png',
        'assets/images/ic_tab_profile_normal.png')
  ];
  List<BottomNavigationBarItem> itemList;

  @override
  void initState() {
    super.initState();
    itemList = itemNames
        .map((item) => BottomNavigationBarItem(
            label: item.name,
            icon: Image.asset(
              item.normalIcon,
              width: 30.0,
              height: 30.0,
            ),
            activeIcon: Image.asset(
              item.activeIcon,
              width: 30.0,
              height: 30.0,
            )))
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
        items: itemList,
        iconSize: 24,
        currentIndex: _selectIndex,
        fixedColor: kNaviFixedColor,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          setState(() {
            _selectIndex = index;
          });
        },
      ),
    );
  }
}

class Item {
  String name, activeIcon, normalIcon;
  Item(this.name, this.activeIcon, this.normalIcon);
}
