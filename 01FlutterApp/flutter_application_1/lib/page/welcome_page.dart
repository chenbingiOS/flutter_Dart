import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/app_colors.dart';
import 'package:flutter_application_1/theme/app_size.dart';
import 'package:flutter_application_1/theme/app_style.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColor,
      body: Column(
        children: [WelcomeHeaderWidget()],
      ),
    );
  }
}

class WelcomeHeaderWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset('assets/images/bg_welcome_header.png'),
        Positioned(
          top: 194,
          left: 40,
          child: Column(children: [
            AppIconWidget(),
            SizedBox(
              height: 8,
            ),
            Text(
              'Sour',
              style: kTitleTextStyle,
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              'Best drink\nreceipes',
              style: kBodyTextStyle,
            )
          ]),
        )
      ],
    );
  }
}

class AppIconWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
        width: kIconBoxSize,
        height: kIconBoxSize,
        decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
        alignment: Alignment.center,
        child: Image.asset(
          'assets/icons/app_icon.png',
          width: 24,
          height: 32,
        ));
  }
}
