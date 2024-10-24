import 'package:flutter/material.dart';
import 'package:dinjan_task/const/color_const.dart';
import 'package:dinjan_task/const/font_const.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get appTheme => ThemeData(
        fontFamily: FontConst.dmSans,
        scaffoldBackgroundColor: ColorConst.onSurface,
        appBarTheme: AppBarTheme(
            color: ColorConst.primary,
            // toolbarHeight: 50.h,
            iconTheme: IconThemeData(color: Colors.white),
            scrolledUnderElevation: 0,
            centerTitle: true,
            titleTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontFamily: FontConst.dmSans,
              fontWeight: FontWeight.w400,
            )),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7),
                ),
                minimumSize: Size(double.infinity, 40),
                backgroundColor: ColorConst.elevatedBg,
                textStyle: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontFamily: FontConst.dmSans))),
        scrollbarTheme: ScrollbarThemeData(
            thumbColor: MaterialStateProperty.all(
              ColorConst.primary,
            ),
            thickness: MaterialStateProperty.all(
              5,
            )),
      );
}
