import 'package:flutter/material.dart';
import 'package:flutter_douban/theme/app_colors.dart';

class HotSoonMovieWidget extends StatefulWidget {
  HotSoonMovieWidget({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HotSoonMovieWidgetState();
  }
}

class _HotSoonMovieWidgetState extends State<HotSoonMovieWidget>
    with SingleTickerProviderStateMixin {
  _HotSoonMovieWidgetState();

  Color selectColor, unselectedColor;
  TextStyle selectStyle, unselectedStyle;
  Widget tabBar;

  TabController _tabController;
  var movieCount = 16;

  @override
  void initState() {
    super.initState();
    selectColor = kSelColor;
    unselectedColor = kUnSelColor;
    selectStyle = TextStyle(
        fontSize: 20, color: selectColor, fontWeight: FontWeight.bold);
    unselectedStyle = TextStyle(fontSize: 20, color: unselectedColor);
    _tabController = TabController(length: 2, vsync: this);
    tabBar = TabBar(
      tabs: [Text("影院热映"), Text("即将上映")],
      isScrollable: true,
      controller: _tabController,
      indicatorColor: selectColor,
      labelColor: selectColor,
      labelStyle: selectStyle,
      unselectedLabelColor: unselectedColor,
      unselectedLabelStyle: unselectedStyle,
      indicatorSize: TabBarIndicatorSize.label,
      onTap: (index) {
        setState(() {
          if (index == 0) {
            movieCount = 16;
          } else {
            movieCount = 20;
          }
        });
      },
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: tabBar,
          flex: 1,
        ),
        Text(
          '全部$movieCount',
          style: TextStyle(
              fontSize: 12, color: Colors.black, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
