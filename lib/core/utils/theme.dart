import 'package:flutter/material.dart';

import '../../constant/constant.dart';

class AppTheme {
  static ThemeData light() {
    return ThemeData.light().copyWith(
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),
      scaffoldBackgroundColor: AppColor.backgroundColor,
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all(
              AppColor.tertiaryColor.withOpacity(0.2)),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: AppColor.secondaryColor, // foreground (text) color
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        border: InputBorder.none,
      ),
      appBarTheme: const AppBarTheme(
        color: Colors.transparent,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 22.0,
          fontFamily: 'Aeonik',
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
        elevation: 0,
      ),
      dividerTheme: const DividerThemeData(
        color: AppColor.greyColor2,
        thickness: 1,
      ),
      textTheme: const TextTheme(
        headline1: TextStyle(
          fontSize: 72.0,
          fontFamily: 'Aeonik',
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        headline2: TextStyle(
          fontSize: 36.0,
          fontFamily: 'Aeonik',
          color: Colors.black,
          fontWeight: FontWeight.normal,
        ),
        headline3: TextStyle(
          fontSize: 27.0,
          fontFamily: 'Aeonik',
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
        headline4: TextStyle(
          fontSize: 22.0,
          fontFamily: 'Aeonik',
          color: Colors.black,
          fontWeight: FontWeight.normal,
        ),
        headline5: TextStyle(
          fontSize: 18.0,
          fontFamily: 'Aeonik',
          color: Colors.black,
          fontWeight: FontWeight.normal,
        ),
        headline6: TextStyle(
          fontSize: 16.0,
          fontFamily: 'Aeonik',
          color: Colors.black,
          fontWeight: FontWeight.normal,
        ),
        bodyText1: TextStyle(
          fontSize: 14.0,
          fontFamily: 'Aeonik',
          color: Colors.black,
          fontWeight: FontWeight.w400,
        ),
        bodyText2: TextStyle(
          fontSize: 12.0,
          fontFamily: 'Aeonik',
          color: Colors.black,
          fontWeight: FontWeight.w400,
        ),
        subtitle1: TextStyle(
          fontSize: 14.0,
          fontFamily: 'Aeonik',
          color: Colors.black,
          fontWeight: FontWeight.w300,
        ),
        caption: TextStyle(
          fontSize: 12.0,
          fontFamily: 'Aeonik',
          color: Colors.black,
          fontWeight: FontWeight.w400,
        ),
        overline: TextStyle(
          fontSize: 12.0,
          fontFamily: 'Aeonik',
          color: Colors.black,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
