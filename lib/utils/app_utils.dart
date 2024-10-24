import 'package:dinjan_task/auth_repo/auth_service.dart';
import 'package:dinjan_task/backend/user_query.dart';
import 'package:dinjan_task/firebase_options.dart';
import 'package:dinjan_task/models/user_model.dart';
import 'package:dinjan_task/utils/router_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

class AppUtils {
  AppUtils._();

  static String initialRout = RouterUtils.splash;

  static UserModel userModel = UserModel();

  static Future<void> initDependency() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        var model = await UserQuery().getSingleUserByUserId(user.uid);
        AppUtils.userModel = model.first;
      } else {}
    } on FirebaseException catch (e) {
      print("ERRORR ===> ${e.toString()}");
    }
  }
}
