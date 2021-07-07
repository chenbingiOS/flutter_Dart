import 'package:flutter/material.dart';
import 'package:flutter_douban/theme/app_colors.dart';
import 'package:flutter_douban/widgets/image/LaminatedImage.dart';

class ToDayPlayMovieWidget extends StatelessWidget {
  ToDayPlayMovieWidget(this.urls, {Key key}) : super(key: key);
  final urls;

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: AlignmentDirectional.bottomStart, children: [
      Container(
        height: 120.0,
        width: double.infinity,
        decoration: BoxDecoration(
            color: kDecColor,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
      ),
      Container(
          height: 140,
          margin: EdgeInsets.only(left: 13.0, bottom: 14.0),
          child: Row(
            children: [
              Stack(
                children: [
                  LaminatedImage(
                    urls: urls,
                    w: 90.0,
                  ),
                  Positioned(
                      child: Image.asset(
                    "assets/images/ic_action_playable_video_s.png",
                    width: 20.0,
                    height: 20.0,
                  ))
                ],
              ),
              Expanded(
                  child: Padding(
                padding: EdgeInsets.only(top: 40.0, left: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '今日可播放电影已更新',
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    Text(
                      '全部 30 >',
                      style: TextStyle(fontSize: 13, color: Colors.white),
                    )
                  ],
                ),
              ))
            ],
          )),
    ]);
  }
}
