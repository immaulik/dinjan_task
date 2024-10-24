import 'package:dinjan_task/backend/user_query.dart';
import 'package:dinjan_task/models/user_model.dart';
import 'package:dinjan_task/utils/app_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:dinjan_task/auth_repo/auth_service.dart';
import 'package:dinjan_task/utils/dialog_utils/dialog_utils.dart';
import 'package:dinjan_task/utils/router_utils.dart';
import 'package:dinjan_task/widgets/custom_snackbar.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController extends GetxController {
  TextEditingController emailCTRL = TextEditingController();
  TextEditingController passwordCTRL = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final AuthService _authService = AuthService();

  Future<void> onTapLogin() async {
    if (formKey.currentState!.validate()) {
      try {
        DialogUtils.showProgress();
        var user = await _authService.signInWithEmailAndPassword(
            emailCTRL.text, passwordCTRL.text);
        if (user != null) {
          var model = await UserQuery().getSingleUserByUserId(user.user!.uid);
          AppUtils.userModel = model.first;
          Get.offAllNamed(RouterUtils.home);
        }
        DialogUtils.dismissProgress();
      } on FirebaseException catch (e) {
        DialogUtils.dismissProgress();
        print("ERROR ===> ${e.toString()}");
        showCustomSnackBar(
            title: "Error", subTitle: e.message!, type: SnackBarType.error);
      }
    }
  }

  void onTapForgetPassword() {
    Get.toNamed(RouterUtils.forgetPassword);
  }

  void onTapCreateAccount() {
    Get.toNamed(RouterUtils.signUp);
  }
}
