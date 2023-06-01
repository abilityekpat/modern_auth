import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Toast {
  static errorToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        // toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 5,
        backgroundColor: Color.fromARGB(255, 60, 53, 203),
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
