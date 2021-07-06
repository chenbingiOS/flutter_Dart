import 'package:flutter/material.dart';

class NetworkImgWidget extends StatefulWidget {
  NetworkImgWidget({Key key, this.imgUrl, this.placeHolderAsset})
      : super(key: key);

  final String imgUrl;
  final String placeHolderAsset;

  @override
  State<StatefulWidget> createState() {
    throw _NetworkImgState();
  }
}

class _NetworkImgState extends State<NetworkImgWidget> {
  _NetworkImgState({this.imgUrl, this.placeHolderAsset});

  final String imgUrl;
  final String placeHolderAsset;

  Image img, netImg;

  @override
  void initState() {
    super.initState();
    img = Image.asset(placeHolderAsset);
    try {
      netImg = Image.network(imgUrl);
    } on Exception catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [img, netImg]);
  }
}
