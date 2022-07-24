import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:get/get.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:get/get_utils/get_utils.dart';

class ToastWidget {
  static showSuccessToast(String msg) {
    return Fluttertoast.showToast(
      msg: msg,
      backgroundColor: Colors.greenAccent,
      textColor: Colors.white,
    );
  }

  static showErrorToast(String msg) {
    return Fluttertoast.showToast(
        msg: msg, backgroundColor: Colors.red, textColor: Colors.white
        // colorText: Colors.white,
        // isDismissible: true,
        // snackPosition: SnackPosition.BOTTOM,
        );
  }
}
