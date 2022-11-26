import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utilities/colors.dart';

ThemeData? myLightTheme() {
  return ThemeData(
    primaryColorLight: MyColors.red,
    focusColor: MyColors.red,
    //text
    textTheme: TextTheme(
      bodyText2: TextStyle(
        color: MyColors.black,
        fontSize: 14,
      ),
      bodyText1: TextStyle(
        fontWeight: FontWeight.w600,
        color: MyColors.black,
        fontSize: 18,
      ),
    ),
    //Scafold
    scaffoldBackgroundColor: Colors.white,
    //bottom nav  bar
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        backgroundColor: MyColors.red,
        unselectedItemColor: MyColors.white),
    //app bar
    appBarTheme: const AppBarTheme(
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
          statusBarColor: MyColors.red,
        ),
        backgroundColor: MyColors.red,
        titleTextStyle: TextStyle(
            color: MyColors.white, fontWeight: FontWeight.bold, fontSize: 20)),
  );
}

ThemeData? myDarkTheme() {
  return ThemeData(
    primaryColorDark: MyColors.white,
    focusColor: MyColors.white,
    //text
    textTheme: TextTheme(
      bodyText2: TextStyle(
        color: MyColors.white,
        fontSize: 14,
      ),
      bodyText1: TextStyle(
        fontWeight: FontWeight.w600,
        color: MyColors.white,
        fontSize: 18,
      ),
    ),
    //scafold
    scaffoldBackgroundColor: MyColors.black,
    //bottom
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: MyColors.red,
      unselectedItemColor: MyColors.white,
      type: BottomNavigationBarType.fixed,
      backgroundColor: MyColors.grey,
    ),
    //bar
    appBarTheme: const AppBarTheme(
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
          statusBarColor: MyColors.black,
        ),
        backgroundColor: MyColors.black,
        titleTextStyle: TextStyle(
            color: MyColors.white, fontWeight: FontWeight.bold, fontSize: 20)),
  );
}
