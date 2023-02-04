import 'package:flutter/material.dart';

import 'color.dart';

ThemeData lightTheme = ThemeData(
  iconTheme: const IconThemeData(
    color: Colors.black,
  ),
  fontFamily: 'arabic',
  scaffoldBackgroundColor: Colors.white,
  appBarTheme:  AppBarTheme(
    centerTitle: true,
    actionsIconTheme: IconThemeData(
      color: Colors.white,
    ),

    titleTextStyle: const TextStyle(
      fontFamily: 'arabic',
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    iconTheme: const IconThemeData(
      color: Colors.black,
    ),
    elevation: 2.0,
    color: AppColor.mainColor,
  ),
);
