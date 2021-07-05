import 'package:flutter/material.dart';
import 'package:flutter_application_1/page/login_page.dart';
import 'package:flutter_application_1/theme/app_colors.dart';
import 'package:flutter_application_1/theme/app_size.dart';
import 'package:flutter_application_1/theme/app_style.dart';

class WelcomePage extends StatefulWidget {
  WelcomePage({Key key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColor,
      body: Column(children: [
        WelcomeHeaderWidget(),
        GradientBtnWidget(
            width: 200,
            child: BtnTextWhiteWidget(
              text: "Sign up",
            )),
        SizedBox(
          height: 16,
        ),
        GestureDetector(
          child: LoginBtnWidget(),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return LoginPage();
            }));
          },
        ),
        SizedBox(
          height: 16,
        ),
        Text(
          'Forgot password?',
          style: TextStyle(fontSize: 18, color: kTextColor),
        ),
        SizedBox(
          height: 54,
        ),
        Row(
          children: [
            Spacer(),
            LineWidget(),
            LoginTypeIconWidget(
              icon: 'assets/icons/logo_ins.png',
            ),
            LoginTypeIconWidget(
              icon: 'assets/icons/logo_fb.png',
            ),
            LoginTypeIconWidget(
              icon: 'assets/icons/logo_twitter.png',
            ),
            LineWidget(),
            Spacer(),
          ],
        )
      ]),
    );
  }
}

// 头部封装
class WelcomeHeaderWidget extends StatelessWidget {
  @override
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

class GradientBtnWidget extends StatelessWidget {
  const GradientBtnWidget({Key key, this.width, this.child, this.onTap})
      : super(key: key);

  final double width;
  final Widget child;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: 48,
        decoration: BoxDecoration(
            gradient: kBtnLinearGradient,
            boxShadow: kBtnShadow,
            borderRadius: BorderRadius.circular(kBtnRadius)),
        alignment: Alignment.center,
        child: child,
      ),
    );
  }
}

// 白色按钮文字
class BtnTextWhiteWidget extends StatelessWidget {
  const BtnTextWhiteWidget({Key key, this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: kBtnTextStyle.copyWith(color: Colors.white),
    );
  }
}

class LoginBtnWidget extends StatelessWidget {
  const LoginBtnWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 48,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: kBtnShadow,
          borderRadius: BorderRadius.circular(kBtnRadius)),
      alignment: Alignment.center,
      child: Text(
        'Login',
        style: kBtnTextStyle,
      ),
    );
  }
}

class LineWidget extends StatelessWidget {
  const LineWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      child: Divider(
        color: kTextColor,
      ),
    );
  }
}

class LoginTypeIconWidget extends StatelessWidget {
  const LoginTypeIconWidget({Key key, this.icon}) : super(key: key);

  final String icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Image.asset(icon, width: 16, height: 16));
  }
}
