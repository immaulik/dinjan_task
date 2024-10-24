import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:dinjan_task/const/color_const.dart';
import 'package:dinjan_task/modules/auth/login/login_controller.dart';
import 'package:dinjan_task/utils/validation_utils.dart';
import 'package:dinjan_task/widgets/my_textfield.dart';

class Login extends StatelessWidget {
  Login({super.key});

  final controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 18.w),
        child: SafeArea(
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 150.h,
                ),
                Text(
                  'Login',
                  style: TextStyle(
                    color: ColorConst.primary,
                    fontSize: 30.sp,
                    fontFamily: 'DMSans36pt',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 6.h,
                ),
                Text(
                  'It is quick and easy to log in. Enter your email and password below.',
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
                  'Email',
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
                  controller: controller.emailCTRL,
                  hint: "Enter email",
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.emailAddress,
                  validatorFunction: ValidationUtils.email,
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
                  hint: "Enter password",
                  isPass: true,
                  textInputType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.done,
                  validatorFunction: ValidationUtils.email,
                ),
                SizedBox(
                  height: 4.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () => controller.onTapForgetPassword(),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 21.w),
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Forgot Password ?',
                          style: TextStyle(
                            letterSpacing: 0,
                            color: Color(0xffff5347),
                            fontFamily: 'DMSans36pt',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 34.h,
                ),
                ElevatedButton(
                    onPressed: () => controller.onTapLogin(),
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: Color(0xfff9fafb),
                        fontSize: 20.sp,
                        fontFamily: 'DMSans36pt',
                        fontWeight: FontWeight.w700,
                      ),
                    )),
                SizedBox(
                  height: 5.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 21.w),
                  child: Align(
                    alignment: Alignment.center,
                    child: InkWell(
                      onTap: () => controller.onTapCreateAccount(),
                      child: Text(
                        "Create a new Account?",
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
