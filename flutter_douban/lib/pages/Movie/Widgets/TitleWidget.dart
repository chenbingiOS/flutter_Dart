import 'package:flutter/material.dart';
import 'package:flutter_douban/theme/app_colors.dart';

typedef TapCallBack = void Function();

class TitleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _TextImgWidget(
          text: "找电影",
          imgAsset: "assets/images/find_movie.png",
          tapCallBack: () {
            print("找电影");
          },
        ),
        _TextImgWidget(
          text: "豆瓣榜单",
          imgAsset: "assets/images/douban_top.png",
          tapCallBack: () {
            print("豆瓣榜单");
          },
        ),
        _TextImgWidget(
          text: "豆瓣猜",
          imgAsset: "assets/images/douban_guess.png",
          tapCallBack: () {
            print("豆瓣猜");
          },
        ),
        _TextImgWidget(
          text: "豆瓣片单",
          imgAsset: "assets/images/douban_film_list.png",
          tapCallBack: () {
            print("豆瓣片单");
          },
        )
      ],
    );
  }
}

class _TextImgWidget extends StatelessWidget {
  _TextImgWidget({this.text, this.imgAsset, this.tapCallBack});

  final String text;
  final String imgAsset;
  final TapCallBack tapCallBack;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (tapCallBack != null) {
          tapCallBack();
        }
      },
      child: Column(
        children: <Widget>[
          Image.asset(imgAsset, width: 45, height: 45),
          Text(text, style: TextStyle(fontSize: 13, color: kIconColor))
        ],
      ),
    );
  }
}
