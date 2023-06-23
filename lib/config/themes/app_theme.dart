import 'package:brain_tumor/core/utils/color_mange.dart';
import 'package:brain_tumor/core/utils/font_mange.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData appTheme() {
  return ThemeData(
    scaffoldBackgroundColor: ColorManger.bodyColor,
    fontFamily: FontFamily.fontFamily,
    primaryColor: ColorManger.defaultColor,
    appBarTheme: AppBarTheme(
        centerTitle: true,
        systemOverlayStyle:  SystemUiOverlayStyle(
            statusBarColor:ColorManger.bodyColor,
            statusBarIconBrightness: Brightness.dark),
        backgroundColor: ColorManger.bodyColor,
        elevation: 0,
        titleTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: ColorManger.defaultColor),
        iconTheme: IconThemeData(color: ColorManger.defaultColor, size: 25)),
    iconTheme: IconThemeData(color: ColorManger.defaultColor),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: ColorManger.defaultColor),
    primaryIconTheme: IconThemeData(color: ColorManger.defaultColor),
  );
}
