import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dinjan_task/backend/user_query.dart';
import 'package:dinjan_task/models/user_model.dart';
import 'package:dinjan_task/widgets/custom_snackbar.dart';
import 'package:get/get.dart';
import 'package:dinjan_task/utils/router_utils.dart';

class HomeController extends GetxController {
  RxList<UserModel> userList = <UserModel>[].obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    _getAllUser();
    super.onInit();
  }

  void onTapEdit() {
    Get.toNamed(RouterUtils.updateProfile)!.then(
      (value) {
        _getAllUser();
      },
    );
  }

  void onTapCatGenerate() {
    Get.toNamed(RouterUtils.catGenerator);
  }

  Future<void> _getAllUser() async {
    try {
      isLoading(true);
      userList.value = await UserQuery().getAllUsers();
      isLoading(false);
    } on FirebaseException catch (e) {
      isLoading(false);
      showCustomSnackBar(
          title: "Error",
          subTitle: e.message.toString(),
          type: SnackBarType.error);
    }
  }
}
