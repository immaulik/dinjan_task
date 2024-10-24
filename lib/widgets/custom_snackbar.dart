import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dinjan_task/const/color_const.dart';

void showCustomSnackBar(
    {required String title,
    required String subTitle,
    required SnackBarType type}) {
  ScaffoldMessenger.of(Get.context!).showSnackBar(
    SnackBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                color: Color(0x19000000),
                spreadRadius: 2.0,
                blurRadius: 8.0,
                offset: Offset(2, 4),
              )
            ],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                    color: type.color,
                    fontWeight: FontWeight.w700,
                    fontSize: 14),
              ),
              SizedBox(height: 5),
              Text(subTitle,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: type.color,
                  )),
            ],
          )),
    ),
  );
}

enum SnackBarType {
  general,
  success,
  error,
}

extension SnackBarExtension on SnackBarType {
  Color get color {
    switch (this) {
      case SnackBarType.error:
        return Color(0xFFF05252);
      case SnackBarType.success:
        return Color(0xFF0E9F6E);
      case SnackBarType.general:
        return ColorConst.primary;
    }
  }
}
