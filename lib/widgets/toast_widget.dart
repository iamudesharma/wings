import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:get/get_utils/get_utils.dart';

class ToastWidget {
  static SnackbarController showSuccessToast(String msg) {
    return Get.snackbar(
      "Success",
      msg,
      backgroundColor: Colors.green,
      colorText: Colors.white,
      isDismissible: true,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  static SnackbarController showErrorToast(String msg) {
    return Get.snackbar(
      "Error",
      msg,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      // isDismissible: true,
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
