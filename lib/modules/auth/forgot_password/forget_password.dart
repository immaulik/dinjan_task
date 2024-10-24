import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:dinjan_task/const/color_const.dart';
import 'package:dinjan_task/modules/auth/forgot_password/forget_password_controller.dart';

class ForgetPassword extends GetView<ForgetPasswordController> {
  const ForgetPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: ColorConst.onSurface,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 21.w),
            alignment: Alignment.centerLeft,
            child: Text(
              'Enter your email',
              style: TextStyle(
                color: ColorConst.primary,
                fontSize: 30.sp,
                fontFamily: 'DMSans36pt',
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(
            height: 6.h,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 21.w),
            alignment: Alignment.centerLeft,
            child: Text(
              'Please the email address associated with your account and we\' send you a otp to reset password.',
              style: TextStyle(
                  color: Color(0xff343434),
                  fontSize: 16.sp,
                  fontFamily: 'DMSans36pt',
                  letterSpacing: 0),
            ),
          ),
          SizedBox(
            height: 22.h,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 21.w),
            alignment: Alignment.centerLeft,
            child: Text(
              'Email address',
              style: TextStyle(
                color: Color(0xff523d5f),
                fontSize: 16.sp,
                fontFamily: 'DMSans36pt',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(
            height: 6.h,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 21.w),
            height: 48.h, // Set the height of the TextField
            child: TextField(
              controller: controller.emailCTRL,
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(
                color: Color(0xff344054),
                fontSize: 16.sp,
                fontFamily: 'DMSans36pt',
                fontWeight: FontWeight.w500,
              ),
              // Customize the text style
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.sp)),
                hintText: 'Enter email address',
                hintStyle: TextStyle(
                  color: Color(0xff344054),
                  fontSize: 16.sp,
                  fontFamily: 'DMSans36pt',
                  fontWeight: FontWeight.w500,
                ), // Customize the label text style
                contentPadding: EdgeInsets.symmetric(
                    vertical: 12.h, horizontal: 16.w), // Adjust the padding
              ),
            ),
          ),
          SizedBox(
            height: 22.h,
          ),
          GestureDetector(
            onTap: () {
              controller.onTapSubmit();
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 21.w),
              child: Container(
                height: 42.h,
                width: 1.sw,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: ColorConst.primary,
                  borderRadius: BorderRadius.circular(8.sp),
                ),
                child: Text(
                  'Submit',
                  style: TextStyle(
                    color: Color(0xfff9fafb),
                    fontSize: 20.sp,
                    fontFamily: 'DMSans36pt',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
