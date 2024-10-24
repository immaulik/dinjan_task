import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:dinjan_task/const/color_const.dart';
import 'package:dinjan_task/modules/auth/sign_up/sign_up_controller.dart';
import 'package:dinjan_task/utils/validation_utils.dart';
import 'package:dinjan_task/widgets/my_textfield.dart';

class SignUp extends GetView<SignUpController> {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 18.w),
        child: SafeArea(
          child: Form(
            key: controller.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50.h,
                ),
                Text(
                  'Create an account',
                  style: TextStyle(
                    color: ColorConst.primary,
                    fontSize: 30.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 6.h,
                ),
                Text(
                  'Welcome! Please enter your details',
                  style: TextStyle(
                      color: Color(0xff343434),
                      fontSize: 16.sp,
                      fontFamily: 'DMSans36pt',
                      letterSpacing: 0),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Text(
                  'Name',
                  style: TextStyle(
                    color: Color(0xff523d5f),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 6.h,
                ),
                MyTextField(
                  controller: controller.nameCTRL,
                  hint: "Enter name",
                  textInputAction: TextInputAction.next,
                  validatorFunction: ValidationUtils.name,
                ),
                SizedBox(
                  height: 12.h,
                ),
                Text(
                  'Email',
                  style: TextStyle(
                    color: Color(0xff523d5f),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 6.h,
                ),
                MyTextField(
                  controller: controller.emailCTRL,
                  hint: "Enter Email",
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.emailAddress,
                  validatorFunction: ValidationUtils.email,
                ),
                SizedBox(
                  height: 12.h,
                ),
                Text(
                  'Phone Number',
                  style: TextStyle(
                    color: Color(0xff523d5f),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 6.h,
                ),
                MyTextField(
                  controller: controller.phoneCTRL,
                  hint: "Enter Phone Number",
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.number,
                  validatorFunction: ValidationUtils.phone,
                ),
                SizedBox(
                  height: 12.h,
                ),
                Text(
                  'Password',
                  style: TextStyle(
                    color: Color(0xff523d5f),
                    fontSize: 16.sp,
                    fontFamily: 'DMSans36pt',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 6.h,
                ),
                MyTextField(
                  controller: controller.passwordCTRL,
                  hint: "Enter Password",
                  isPass: true,
                  textInputAction: TextInputAction.next,
                  validatorFunction: ValidationUtils.password,
                ),
                SizedBox(
                  height: 12.h,
                ),
                Text(
                  'Confirm Password',
                  style: TextStyle(
                    color: Color(0xff523d5f),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 6.h,
                ),
                MyTextField(
                  controller: controller.conformPasswordCTRL,
                  hint: "Enter Confirm Password",
                  isPass: true,
                  validatorFunction: (value) => ValidationUtils.conformPassword(
                      value, controller.passwordCTRL.text),
                  textInputAction: TextInputAction.done,
                ),
                SizedBox(
                  height: 40.h,
                ),
                GestureDetector(
                  onTap: () {
                    controller.onTapSignUp();
                  },
                  child: Container(
                    height: 42.h,
                    width: 1.sw,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: ColorConst.primary,
                      borderRadius: BorderRadius.circular(8.sp),
                    ),
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Color(0xfff9fafb),
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 21.w),
                  child: Align(
                    alignment: Alignment.center,
                    child: InkWell(
                      onTap: () => controller.onTapAccount(),
                      child: Text(
                        "Already have an account?",
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
