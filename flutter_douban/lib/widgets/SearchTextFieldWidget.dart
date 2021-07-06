import 'package:flutter/material.dart';
import 'package:flutter_douban/theme/app_colors.dart';

class SearchTextFieldWidget extends StatelessWidget {
  SearchTextFieldWidget({Key key, this.onSubmitted, this.hintText})
      : super(key: key);

  final ValueChanged<String> onSubmitted;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      height: 40.0,
      decoration: BoxDecoration(
          color: kBoxDecColor, borderRadius: BorderRadius.circular(24.0)),
      child: TextFormField(
        style: TextStyle(fontSize: 20),
        onFieldSubmitted: onSubmitted,
        cursorColor: kCursorColor,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(top: 8.0),
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: TextStyle(fontSize: 20, color: kHintColor),
            prefixIcon: Icon(
              Icons.search,
              size: 25,
              color: kIconColor,
            )),
      ),
    );
  }
}
