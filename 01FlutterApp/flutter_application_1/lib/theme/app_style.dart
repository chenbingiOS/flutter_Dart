import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/app_colors.dart';
import 'package:flutter_application_1/theme/app_size.dart';

// 按钮投影
const List<BoxShadow> kBtnShadow = [
  BoxShadow(color: kBtnShadowColor, offset: Offset(0, 8), blurRadius: 20)
];

// 标题文字样式
const TextStyle kTitleTextStyle = TextStyle(
    fontSize: kTitleTextSize, color: kTextColor, fontWeight: kMediumFontWeight);

// 内容文字样式
const TextStyle kBodyTextStyle = TextStyle(
    fontSize: kTitleTextSize, color: kTextColor, fontWeight: kMediumFontWeight);

// 按钮文字样式
const TextStyle kBtnTextStyle = TextStyle(
    fontSize: kTitleTextSize, color: kTextColor, fontWeight: kMediumFontWeight);

// 输入框边框
InputBorder kInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(kInputBorderRadius),
    borderSide: BorderSide(width: 1, color: kInputBorderColor));
