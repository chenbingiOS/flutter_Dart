import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_douban/theme/app_colors.dart';

class LaminatedImage extends StatelessWidget {
  LaminatedImage({Key key, this.urls, this.w}) : super(key: key);

  final urls;
  final w;

  @override
  Widget build(BuildContext context) {
    double h = w * 1.5;
    double dif = w * 0.14;
    double secondLeftPadding = w * 0.42;
    double thirdLeftPadding = w * 0.78;
    return Container(
        height: h,
        width: w + thirdLeftPadding,
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Positioned(
                left: w * 0.78,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6.0),
                  child: Image.network(
                    urls[2],
                    width: w,
                    height: h - dif - dif / 2,
                    fit: BoxFit.cover,
                    color: kBgColor,
                    colorBlendMode: BlendMode.screen,
                  ),
                )),
            Positioned(
                left: secondLeftPadding,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6.0),
                  child: Image.network(
                    urls[1],
                    width: w,
                    height: h - dif,
                    fit: BoxFit.cover,
                    color: kBgColor,
                    colorBlendMode: BlendMode.screen,
                  ),
                )),
            Positioned(
                left: 0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6.0),
                  child: getCacheImg(urls[0]),
                ))
          ],
        ));
  }
}

Widget getCacheImg(String imgNetUrl) {
  var defaultImg =
      Image.asset('assets/images/iuc_default_img_subject_movie.9.png');
  const millisecond = Duration(milliseconds: 80);
  return ClipRRect(
    child: CachedNetworkImage(
      imageUrl: imgNetUrl,
      placeholder: (context, url) => CircularProgressIndicator(),
      fadeInDuration: millisecond,
      fadeOutDuration: millisecond,
    ),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  );
}
