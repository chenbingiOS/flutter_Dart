import 'package:flutter/material.dart';
import 'package:flutter_douban/widgets/MainPage.dart';
import 'package:flutter_douban/widgets/SubjectMarkImageWidget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          // 解决弹出键盘时TabBar向上滚动
          resizeToAvoidBottomInset: false,
          // body: MainPageWidget(),
          body: SafeArea(
            child: SubjectMarkImageWidget(
                imgNetUrl:
                    'http://img1.doubanio.com/view/photo/s_ratio_poster/public/p457760035.webp'),
          ),
        ));
  }
}
