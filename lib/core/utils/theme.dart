import 'package:flutter/material.dart';

import '../../constant/constant.dart';

class AppTheme {
  static ThemeData light() {
    return ThemeData.light().copyWith(
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),
      useMaterial3: true,
      scaffoldBackgroundColor: Colors.white,
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all(
              AppColor.tertiaryColor.withOpacity(0.2)),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          foregroundColor: Colors.white,
          backgroundColor: AppColor.secondaryColor,
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        border: InputBorder.none,
      ),
      appBarTheme: AppBarTheme(
        elevation: 10,
        surfaceTintColor: Colors.white,
        shadowColor: AppColor.secondaryColor.withOpacity(0.2),
        backgroundColor: Colors.white,
        foregroundColor: Colors.white,
        // color: Colors.transparent,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        centerTitle: true,
        titleTextStyle: const TextStyle(
          fontSize: 22.0,
          fontFamily: 'Aeonik',
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
        // elevation: 0,
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
          fontWeight: FontWeight.bold,
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
