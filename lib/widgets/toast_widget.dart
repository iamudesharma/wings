import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:get/get_utils/get_utils.dart';

class ToastWidget {
  static showSuccessToast(String msg) {
    return Get.snackbar(
      "",
      msg,
      backgroundColor: Colors.green,
      colorText: Colors.white,
      isDismissible: true,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  static showErrorToast(String msg) {
    return Get.snackbar(
      "",
      msg,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      isDismissible: true,
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
