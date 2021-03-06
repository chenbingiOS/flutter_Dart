import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/page/welcome_page.dart';
import 'package:flutter_application_1/theme/app_size.dart';
import 'package:flutter_application_1/theme/app_style.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Image.asset('assets/images/bg_login_header.png'),
            Column(
              children: [
                SizedBox(
                  height: 320,
                ),
                ClipPath(
                  clipper: LoginClipper(),
                  child: LoginBodyWidget(),
                ),
              ],
            ),
            Positioned(
              child: BackIconWidget(),
              top: 64,
              left: 28,
            )
          ],
        ));
  }
}

class LoginBodyWidget extends StatelessWidget {
  const LoginBodyWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.maxFinite,
      padding: EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 86),
          Text('Login', style: kTitleTextStyle),
          SizedBox(
            height: 20,
          ),
          Text(
            'Your Email',
            style: kBodyTextStyle,
          ),
          SizedBox(
            height: 4,
          ),
          LoginInputWidget(
            hintText: 'Email',
            prefixIcon: 'assets/icons/icon_email.png',
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            'Your Password',
            style: kBodyTextStyle,
          ),
          SizedBox(
            height: 4,
          ),
          LoginInputWidget(
            hintText: 'Passworkd',
            prefixIcon: 'assets/icons/icon_pwd.png',
            obscureText: true,
          ),
          SizedBox(
            height: 32,
          ),
          LoginBtnIconWidget(),
          SizedBox(
            height: 32,
          ),
        ],
      ),
    );
  }
}

class LoginInputWidget extends StatelessWidget {
  const LoginInputWidget({
    Key key,
    this.hintText,
    this.prefixIcon,
    this.obscureText = false,
  }) : super(key: key);

  final String hintText;
  final String prefixIcon;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          hintText: hintText,
          border: kInputBorder,
          focusedBorder: kInputBorder,
          enabledBorder: kInputBorder,
          prefixIcon: Container(
            width: kIconBoxSize,
            height: kIconBoxSize,
            alignment: Alignment.center,
            child: Image.asset(
              prefixIcon,
              width: kIconSize,
              height: kIconSize,
            ),
          )),
      obscureText: obscureText,
      style: kBodyTextStyle.copyWith(fontSize: 18),
    );
  }
}

class LoginBtnIconWidget extends StatelessWidget {
  const LoginBtnIconWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Spacer(),
        GradientBtnWidget(
          width: 160,
          child: Row(
            children: [
              SizedBox(
                width: 34,
              ),
              BtnTextWhiteWidget(
                text: 'Login',
              ),
              Spacer(),
              Image.asset(
                'assets/icons/icon_arrow_right.png',
                width: kIconSize,
                height: kIconSize,
              ),
              SizedBox(
                width: 24,
              )
            ],
          ),
          onTap: () {
            Navigator.pop(context);
          },
        )
      ],
    );
  }
}

///????????????????????????
class LoginClipper extends CustomClipper<Path> {
  // ????????????
  Point p1 = Point(0.0, 54.0);
  Point c1 = Point(20.0, 25.0);
  Point c2 = Point(81.0, -8.0);
  // ????????????
  Point p2 = Point(160.0, 20.0);
  Point c3 = Point(216.0, 38.0);
  Point c4 = Point(280.0, 73.0);
  // ????????????
  Point p3 = Point(280.0, 44.0);
  Point c5 = Point(280.0, -11.0);
  Point c6 = Point(330.0, 8.0);

  @override
  Path getClip(Size size) {
    // ????????????
    Point p4 = Point(size.width, .0);

    Path path = Path();
    // ?????????????????????
    path.moveTo(p1.x, p1.y);
    //???????????? ?????????????????????
    path.cubicTo(c1.x, c1.y, c2.x, c2.y, p2.x, p2.y);
    //???????????? ?????????????????????
    path.cubicTo(c3.x, c3.y, c4.x, c4.y, p3.x, p3.y);
    //???????????? ?????????????????????
    path.cubicTo(c5.x, c5.y, c6.x, c6.y, p4.x, p4.y);
    // ??????????????????
    path.lineTo(size.width, size.height);
    // ??????????????????
    path.lineTo(0, size.height);
    //??????
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return this.hashCode != oldClipper.hashCode;
  }
}

class BackIconWidget extends StatelessWidget {
  const BackIconWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        width: kIconBoxSize,
        height: kIconBoxSize,
        alignment: Alignment.center,
        decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
        child: Image.asset(
          'assets/icons/icon_back.png',
          width: kIconSize,
          height: kIconSize,
        ),
      ),
    );
  }
}
