import 'package:get/get.dart';

abstract class ValidationUtils {
  static String? name(String? value) {
    if (value != null && value.isEmpty) {
      return "Please enter name";
    } else {
      return null;
    }
  }

  static String? phone(String? value) {
    if (value != null && value.isEmpty) {
      return "Please enter phone number";
    } else if (value != null && !GetUtils.isPhoneNumber(value)) {
      return "Please enter valid phone number";
    } else {
      return null;
    }
  }

  static String? email(String? value) {
    if (value != null && value.isEmpty) {
      return "Please enter email";
    } else {
      return null;
    }
  }

  static String? password(String? value) {
    if (value != null && value.isEmpty) {
      return "Please enter email";
    } else {
      return null;
    }
  }

  static String? conformPassword(String? value, String password) {
    if (value != null && value.isEmpty) {
      return "Please enter password";
    } else if (value != password) {
      return "Password and Confirm password should be same";
    } else {
      return null;
    }
  }
}
