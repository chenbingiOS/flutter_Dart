import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

typedef BoolCallBack = void Function(bool markAdded);

class SubjectMarkImageWidget extends StatefulWidget {
  SubjectMarkImageWidget({Key key, this.imgNetUrl, this.markAdd})
      : super(key: key);

  final String imgNetUrl;
  final BoolCallBack markAdd;

  @override
  State<StatefulWidget> createState() {
    return _SubjectMarkImageState(imgNetUrl: imgNetUrl, markAdd: markAdd);
  }
}

class _SubjectMarkImageState extends State<SubjectMarkImageWidget> {
  _SubjectMarkImageState({this.imgNetUrl, this.markAdd});

  var markAdded = false;
  final String imgNetUrl;
  final BoolCallBack markAdd;

  Image markAddedIcon, defaultMarkIcon;
  Widget loadImg;

  @override
  void initState() {
    super.initState();
    markAddedIcon = Image.asset("assets/images/ic_subject_mark_added.png");
    defaultMarkIcon =
        Image.asset("assets/images/ic_subject_rating_mark_wish.png");
    loadImg = getCacheImg(imgNetUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      loadImg,
      IconButton(
          onPressed: () {
            if (markAdd != null) {
              markAdd(markAdded);
            }
            setState(() {
              markAdded = !markAdded;
            });
          },
          icon: markAdded ? markAddedIcon : defaultMarkIcon)
    ]);
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
