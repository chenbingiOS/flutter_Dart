import 'package:flutter/material.dart';
import 'package:flutter_douban/pages/ContainerPageWidget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        home: Scaffold(
          // 解决弹出键盘时TabBar向上滚动
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: ContainerPageWidget(),
            // child: ToDayPlayMovieWidget([
            //   'https://img3.doubanio.com/view/photo/s_ratio_poster/public/p480747492.webp',
            //   'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p1374786017.webp',
            //   'https://img3.doubanio.com/view/photo/s_ratio_poster/public/p480747492.webp',
            //   'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p1374786017.webp',
            //   'https://img3.doubanio.com/view/photo/s_ratio_poster/public/p480747492.webp',
            //   'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p1374786017.webp',
            //   'https://img3.doubanio.com/view/photo/s_ratio_poster/public/p480747492.webp',
            //   'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p1374786017.webp',
            // ]),
            // child: TitleWidget(),
            // child: SubjectMarkImageWidget(
            //     imgNetUrl:
            //         'http://img1.doubanio.com/view/photo/s_ratio_poster/public/p457760035.webp'),
          ),
        ));
  }
}
