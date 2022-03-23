import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast(String msg, [type = ToastType.success]) {
  Color? textColor;
  switch (type) {
    case ToastType.fail:
      textColor = Colors.red;
      break;
    case ToastType.success:
      textColor = Colors.green;
      break;
    default:
      textColor = Colors.white;
  }

  Fluttertoast.showToast(
      msg: msg, textColor: textColor, backgroundColor: Colors.white);
}

enum ToastType { success, fail, normal }
