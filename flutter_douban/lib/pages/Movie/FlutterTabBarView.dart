import 'package:flutter/material.dart';
import 'package:flutter_douban/pages/Movie/MoviePage.dart';

class FlutterTabBarView extends StatefulWidget {
  FlutterTabBarView({Key key, this.tabController}) : super(key: key);
  final TabController tabController;

  @override
  State<StatefulWidget> createState() {
    return _FlutterTabBarViewState(tabController: tabController);
  }
}

class _FlutterTabBarViewState extends State<FlutterTabBarView> {
  _FlutterTabBarViewState({this.tabController});
  final TabController tabController;

  var viewList;
  @override
  void initState() {
    super.initState();
    viewList = [
      MoviePage(),
      Page1(),
      Page1(),
      Page1(),
      Page1(),
      Page1(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: viewList,
      controller: tabController,
    );
  }
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Page1"),
    );
  }
}
