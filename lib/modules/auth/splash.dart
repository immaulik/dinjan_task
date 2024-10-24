import 'package:dinjan_task/backend/user_query.dart';
import 'package:dinjan_task/const/color_const.dart';
import 'package:dinjan_task/utils/app_utils.dart';
import 'package:dinjan_task/utils/router_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    _checkLogin();
    super.initState();
  }

  Future<void> _checkLogin() async {
    Future.delayed(Duration(seconds: 2), () async {
      try {
        User? user = FirebaseAuth.instance.currentUser;
        if (user != null) {
          var model = await UserQuery().getSingleUserByUserId(user.uid);
          if (model.isNotEmpty) {
            AppUtils.userModel = model.first;
            Get.offAllNamed(RouterUtils.home);
          } else {
            Get.offAllNamed(RouterUtils.login);
          }
        } else {
          Get.offAllNamed(RouterUtils.login);
        }
      } on FirebaseException catch (e) {
        print("ERRORR ===> ${e.toString()}");
        Get.offAllNamed(RouterUtils.login);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade200,
      body: Center(
        child: Text(
          "Practical-Task",
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 26.sp,
              color: ColorConst.primary),
        ),
      ),
    );
  }
}
