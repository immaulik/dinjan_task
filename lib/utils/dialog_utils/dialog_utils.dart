import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:dinjan_task/const/color_const.dart';
import 'package:dinjan_task/utils/dialog_utils/progress_dialog.dart';

typedef IntCallback = void Function(int value);

class DialogUtils {
  DialogUtils.__();

  static bool _showProgress = false;

  static Future<bool?> showAlertBottomSheet({
    required String title,
    String description = "",
  }) {
    return Get.bottomSheet<bool>(
        _AlertBottomSheet(
          title: title,
          description: description,
        ),
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        isDismissible: true,
        enterBottomSheetDuration: const Duration(milliseconds: 300),
        exitBottomSheetDuration: const Duration(milliseconds: 300),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ));
  }

  static Future<T?> showDialog<T>({
    required Widget child,
  }) async {
    return (await Get.dialog(
      child,
      transitionCurve: Curves.slowMiddle,
      transitionDuration: Duration(milliseconds: 100),
    ));
  }

  static void showProgress() {
    _showProgress = true;
    Get.dialog(
      const ProgressDialog(),
      barrierDismissible: false,
    );
  }

  static void dismissProgress() {
    if (_showProgress) {
      _showProgress = false;
      Get.back();
    }
  }

  static Future<T?> showSimpleBottomSheet<T>({
    required String title,
    required String description,
  }) {
    return Get.bottomSheet(
        _SimpleBottomSheet(
          title: title,
          description: description,
        ),
        backgroundColor: Colors.white,
        isScrollControlled: true,
        isDismissible: true,
        enterBottomSheetDuration: const Duration(milliseconds: 300),
        exitBottomSheetDuration: const Duration(milliseconds: 300),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ));
  }
}

class _AlertBottomSheet extends StatelessWidget {
  final String title;
  final String description;

  const _AlertBottomSheet({
    super.key,
    required this.title,
    this.description = "",
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black12),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 3.h),
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                    fontSize: 16.sp,
                  ),
                ),
                if (description.isNotEmpty) ...[
                  SizedBox(height: 3.h),
                  Text(
                    description,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 11.sp,
                    ),
                  ),
                ],
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                          onPressed: () {
                            Get.back(result: true);
                          },
                          style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: BorderSide(color: ColorConst.primary)),
                          ),
                          child: Text(
                            "Yes",
                            style: TextStyle(
                              color: ColorConst.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                    ),
                    SizedBox(width: 3.w),
                    Expanded(
                      child: TextButton(
                          onPressed: () {
                            Get.back(result: false);
                          },
                          style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            backgroundColor: ColorConst.primary,
                            foregroundColor: Colors.white,
                          ),
                          child: Text(
                            "No",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                    )
                  ],
                ),
                SizedBox(height: 5.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SimpleBottomSheet extends StatelessWidget {
  final String title;
  final String description;

  const _SimpleBottomSheet({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
                onPressed: Get.back,
                icon: const Icon(
                  Icons.close,
                  color: Colors.black,
                )),
          ),
          Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w800,
              fontSize: 20.sp,
            ),
          ),
          SizedBox(height: 3.h),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontSize: 11.sp,
            ),
          ),
          SizedBox(height: 5.h),
        ],
      ),
    );
  }
}
