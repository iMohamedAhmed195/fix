import 'package:fluttertoast/fluttertoast.dart';

import 'package:flutter/material.dart';

void showToast({
  required String? text,
  required ToastState state,
}) =>
    Fluttertoast.showToast(
        msg: text!,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: choseToasterColor(state),
        textColor: Colors.white,
        fontSize: 16.0);

enum ToastState { success, error, warning }

Color choseToasterColor(ToastState state) {
  Color color;
  switch (state) {
    case ToastState.success:
      color = const Color(0xff4377ec);
      break;
    case ToastState.error:
      color = Colors.red;
      break;
    case ToastState.warning:
      color = Colors.amber;
      break;
  }
  return color;
}