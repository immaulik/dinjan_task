import 'dart:io';

import 'package:dinjan_task/backend/user_query.dart';
import 'package:dinjan_task/models/user_model.dart';
import 'package:dinjan_task/utils/app_utils.dart';
import 'package:dinjan_task/widgets/custom_snackbar.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dinjan_task/auth_repo/auth_service.dart';
import 'package:dinjan_task/utils/dialog_utils/dialog_utils.dart';
import 'package:dinjan_task/utils/router_utils.dart';

class UpdateController extends GetxController {
  AuthService _authService = AuthService();
  final formKey = GlobalKey<FormState>();
  TextEditingController nameCTRL = TextEditingController();
  TextEditingController emailCTRL = TextEditingController();
  TextEditingController phoneCTRL = TextEditingController();
  var profile = Rx<File?>(null);

  @override
  void onInit() {
    setValue();
    super.onInit();
  }

  void onTapLogout() {
    DialogUtils.showAlertBottomSheet(title: "Are you sure you want to Logout?")
        .then(
      (value) {
        if (value != null && value) {
          DialogUtils.showProgress();
          _authService.signOut();
          DialogUtils.dismissProgress();
          Get.offAllNamed(RouterUtils.login);
        }
      },
    );
  }

  Future<void> onTapUpdate() async {
    if (profile.value != null) {
      await uploadImage();
    } else {
      _editProfile("");
    }
  }

  Future<void> pickFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowCompression: true,
        type: FileType.custom, // Use custom file type
        allowedExtensions: ['png', 'jpg'],
      );
      if (result != null) {
        profile.value = File(result.files.single.path!);
      }
    } catch (e) {
      print('Error picking file: $e');
    }
  }

  void setValue() {
    nameCTRL.text = AppUtils.userModel.name;
    phoneCTRL.text = AppUtils.userModel.phone;
    emailCTRL.text = AppUtils.userModel.email;
  }

  Future<void> uploadImage() async {
    if (profile.value != null && await profile.value!.exists()) {
      try {
        DialogUtils.showProgress();
        final storageRef = FirebaseStorage.instance.ref();
        String fileName =
            DateTime.now().millisecondsSinceEpoch.toString() + '.jpg';
        print('Uploading file: $fileName'); // Debugging line

        UploadTask uploadTask =
            storageRef.child('images/$fileName').putFile(profile.value!);

        // Await for the upload to complete
        await uploadTask.whenComplete(() => null); // Force the task to complete

        String downloadUrl =
            await storageRef.child('images/$fileName').getDownloadURL();
        print('Download URL: $downloadUrl'); // Debugging line

        await _editProfile(downloadUrl);
        DialogUtils.dismissProgress();
      } on FirebaseException catch (e) {
        DialogUtils.dismissProgress();
        print('Error uploading image: $e');
        showCustomSnackBar(
            title: "Error", subTitle: e.message!, type: SnackBarType.error);
      }
    }
  }

  Future<void> _editProfile(String imageUrl) async {
    try {
      UserModel model = UserModel(
          name: nameCTRL.text,
          userId: AppUtils.userModel.userId,
          profile: imageUrl,
          phone: phoneCTRL.text,
          email: emailCTRL.text,
          id: AppUtils.userModel.id);
      await UserQuery().editUser(model);
      AppUtils.userModel = model;
      showCustomSnackBar(
          title: "Success",
          subTitle: "Profile Updated Successfully",
          type: SnackBarType.success);
    } on FirebaseException catch (e) {
      DialogUtils.dismissProgress();
      showCustomSnackBar(
          title: "Error", subTitle: e.message!, type: SnackBarType.error);
    }
  }
}
