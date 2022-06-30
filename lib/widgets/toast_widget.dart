import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_toastr/flutter_toastr.dart';

import '../main.dart';
// import 'package:fluttertoast/fluttertoast.dart';

class ToastWidget {
  static showSuccessToast(
    String msg,
  ) {
    return FlutterToastr.show(
      msg,
      navigatorKey.currentState!.context,

      backgroundColor: Colors.red,

      // toastLength: Toast.LENGTH_SHORT,
      // gravity: ToastGravity.BOTTOM,
    );
  }

  static showErrorToast(
    String msg,
  ) {
    // AutoRouterX.
    return FlutterToastr.show(
      msg,
      navigatorKey.currentState!.context,
      backgroundColor: Colors.red,

      //  position:
    );
  }
}
