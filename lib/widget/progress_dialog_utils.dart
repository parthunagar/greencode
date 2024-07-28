
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greencode/constant/colors.dart';

class ProgressDialogUtils {
  static bool isVisible = false;

  static void showProgressDialog(BuildContext? context,
      {isCancellable = false}) async {
    if (!isVisible) {
      Get.dialog(
           Center(
            child: CircularProgressIndicator.adaptive(
              strokeWidth: 4,
              valueColor: AlwaysStoppedAnimation<Color>(
                cBrown,
              ),
            ),
          ),
          barrierDismissible: false);
      isVisible = true;
    }
  }

  static void hideProgressDialog() {
    if (isVisible) Get.back();
    isVisible = false;
  }
}
