import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 初始化 HSizeFit
    HSizeFit.initialize(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("首页"),
      ),
      body: Center(
        child: Container(
          width: HSizeFit.setPx(200),
          height: HSizeFit.setRpx(400),
          // width: 200,
          // height: 200,
          color: Colors.red,
          alignment: Alignment.center,
          child: Text(
            "Hello World",
            style: TextStyle(fontSize: 30, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class HSizeFit {
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static double rpx;
  static double px;

  static void initialize(BuildContext context, {double standardWidth = 750}) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    rpx = screenWidth / standardWidth;
    px = screenWidth / standardWidth * 2;
  }

  // 按照像素来设置
  static double setPx(double size) {
    return HSizeFit.rpx * size * 2;
  }

  // 按照 rpx 来设置
  static double setRpx(double size) {
    return HSizeFit.rpx * size;
  }
}
