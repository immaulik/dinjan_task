import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dinjan_task/auth_repo/auth_service.dart';
import 'package:dinjan_task/utils/dialog_utils/dialog_utils.dart';
import 'package:dinjan_task/widgets/custom_snackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:dinjan_task/utils/router_utils.dart';

class ForgetPasswordController extends GetxController {
  TextEditingController emailCTRL = TextEditingController();
  AuthService _authService = AuthService();

  Future<void> onTapSubmit() async {
    try {
      DialogUtils.showProgress();
      _authService.sendPasswordResetEmail(emailCTRL.text);
      DialogUtils.dismissProgress();
      showCustomSnackBar(
          title: "Send mail",
          subTitle: "Check your mail to reset password",
          type: SnackBarType.general);
    } on FirebaseException catch (e) {
      DialogUtils.dismissProgress();
      showCustomSnackBar(
          title: "Error", subTitle: e.message!, type: SnackBarType.error);
    }
  }
}
