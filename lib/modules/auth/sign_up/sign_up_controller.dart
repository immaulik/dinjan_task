import 'package:dinjan_task/utils/app_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:dinjan_task/auth_repo/auth_service.dart';
import 'package:dinjan_task/backend/user_query.dart';
import 'package:dinjan_task/models/user_model.dart';
import 'package:dinjan_task/utils/dialog_utils/dialog_utils.dart';
import 'package:dinjan_task/utils/router_utils.dart';
import 'package:dinjan_task/widgets/custom_snackbar.dart';

class SignUpController extends GetxController {
  TextEditingController emailCTRL = TextEditingController();
  TextEditingController nameCTRL = TextEditingController();
  TextEditingController phoneCTRL = TextEditingController();
  TextEditingController passwordCTRL = TextEditingController();
  TextEditingController conformPasswordCTRL = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final AuthService _authService = AuthService();

  void onTapAccount() {
    Get.back();
  }

  Future<void> onTapSignUp() async {
    if (formKey.currentState!.validate()) {
      try {
        DialogUtils.showProgress();
        print("EMAIL ==> ${emailCTRL.text} password==> ${passwordCTRL.text}");
        var user = await _authService.createUserWithEmailAndLinkGoogle(
            emailCTRL.text, passwordCTRL.text);
        await addUser(user);
        DialogUtils.dismissProgress();
      } on FirebaseException catch (e) {
        DialogUtils.dismissProgress();
        showCustomSnackBar(
          title: "Error",
          subTitle: e.message!,
          type: SnackBarType.error,
        );
      }
    }
  }

  Future<void> addUser(UserCredential? user) async {
    UserModel model = UserModel(
        email: emailCTRL.text,
        name: nameCTRL.text,
        phone: phoneCTRL.text,
        profile: "",
        userId: user!.user!.uid);
    await UserQuery().addUser(user: model);
    AppUtils.userModel = model;
    Get.offAllNamed(RouterUtils.home);
  }
}
