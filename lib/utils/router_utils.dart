import 'dart:math';

import 'package:dinjan_task/modules/auth/splash.dart';
import 'package:dinjan_task/modules/cat_generator/cat_generator.dart';
import 'package:dinjan_task/modules/cat_generator/cat_generator_controller.dart';
import 'package:get/get.dart';
import 'package:dinjan_task/modules/auth/forgot_password/forget_password.dart';
import 'package:dinjan_task/modules/auth/forgot_password/forget_password_controller.dart';
import 'package:dinjan_task/modules/auth/login/login.dart';
import 'package:dinjan_task/modules/auth/sign_up/sign_up.dart';
import 'package:dinjan_task/modules/auth/sign_up/sign_up_controller.dart';
import 'package:dinjan_task/modules/home/home.dart';
import 'package:dinjan_task/modules/home/home_controller.dart';
import 'package:dinjan_task/modules/update/update.dart';
import 'package:dinjan_task/modules/update/update_controller.dart';

class RouterUtils {
  RouterUtils._();

  static const String login = "/login";
  static const String signUp = "/singUp";
  static const String home = "/home";
  static const String updateProfile = "/update_profile";
  static const String forgetPassword = "/forget_password";
  static const String splash = "/splash";
  static const String catGenerator = "/cat_generator";

  static List<GetPage> pages = [
    GetPage(
      name: login,
      page: () => Login(),
    ),
    GetPage(
      name: splash,
      page: () => Splash(),
    ),
    GetPage(
      name: forgetPassword,
      page: () => const ForgetPassword(),
      binding: BindingsBuilder(() => Get.lazyPut(
            () => ForgetPasswordController(),
          )),
    ),
    GetPage(
      name: signUp,
      page: () => SignUp(),
      binding: BindingsBuilder(() => Get.lazyPut(
            () => SignUpController(),
          )),
    ),
    GetPage(
      name: home,
      page: () => Home(),
      binding: BindingsBuilder(() => Get.lazyPut(
            () => HomeController(),
          )),
    ),
    GetPage(
      name: updateProfile,
      page: () => Update(),
      binding: BindingsBuilder(() => Get.lazyPut(
            () => UpdateController(),
          )),
    ),
    GetPage(
      name: catGenerator,
      page: () => CatGenerator(),
      binding: BindingsBuilder(() => Get.lazyPut(
            () => CatGeneratorController(),
      )),
    ),
  ];
}
