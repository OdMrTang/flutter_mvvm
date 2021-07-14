import 'package:oktoast/oktoast.dart';
import 'package:flutter/material.dart';

class ToastUtils {
  static showToastText(String str) {
    showToast(str,
        radius: 5,
        position: ToastPosition.bottom,backgroundColor: Colors.grey);
  }
}
