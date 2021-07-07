import 'package:flutter/material.dart';
import 'package:flutter_douban/pages/Movie/Widgets/HotSoonMovieWidget.dart';
import 'package:flutter_douban/pages/Movie/Widgets/TitleWidget.dart';
import 'package:flutter_douban/pages/Movie/Widgets/ToDayPlayMovieWidget.dart';

class MoviePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MoviePageState();
  }
}

class _MoviePageState extends State<MoviePage> {
  Widget toDayPlayMovieWidget;

  @override
  void initState() {
    super.initState();
    toDayPlayMovieWidget = ToDayPlayMovieWidget([
      'https://img3.doubanio.com/view/photo/s_ratio_poster/public/p792776858.webp',
      'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p1374786017.webp',
      'https://img3.doubanio.com/view/photo/s_ratio_poster/public/p917846733.webp',
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        padding: EdgeInsets.only(left: 10.0, right: 10.0),
        child: CustomScrollView(
          slivers: [
            SliverList(
                delegate: SliverChildListDelegate([
              Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: TitleWidget(),
              ),
              Padding(
                padding: EdgeInsets.only(top: 22.0),
                child: toDayPlayMovieWidget,
              ),
              Padding(
                padding: EdgeInsets.only(top: 25.0),
                child: HotSoonMovieWidget(),
              ),
            ]))
          ],
        ));
  }
}
