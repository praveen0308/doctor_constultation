import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UtilMethods {
  static showToast(String msg, ToastType type) {
    var bgColor = Colors.grey;
    var txtColor = Colors.black;

    switch (type) {
      case ToastType.success:
        bgColor = Colors.green;
        txtColor = Colors.white;
        break;
      case ToastType.error:
        bgColor = Colors.red;
        txtColor = Colors.white;
        break;
      case ToastType.warning:
        bgColor = Colors.orange;
        txtColor = Colors.white;
        break;
      case ToastType.info:
        bgColor = Colors.grey;
        txtColor = Colors.black;
        break;
    }

    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: bgColor,
        textColor: txtColor,
        fontSize: 16.0);
  }
}

extension ExtMethos on State {
  showToast(String msg, ToastType type) {
    var bgColor = Colors.white12;
    var txtColor = Colors.black;

    switch (type) {
      case ToastType.success:
        bgColor = Colors.green;
        txtColor = Colors.white;
        break;
      case ToastType.error:
        bgColor = Colors.red;
        txtColor = Colors.white;
        break;
      case ToastType.warning:
        bgColor = Colors.orange;
        txtColor = Colors.white;
        break;
      case ToastType.info:
        bgColor = Colors.white;
        txtColor = Colors.black;
        break;
    }

    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: bgColor,
        textColor: txtColor,
        fontSize: 16.0);
  }
}

enum ToastType { success, error, warning, info }
