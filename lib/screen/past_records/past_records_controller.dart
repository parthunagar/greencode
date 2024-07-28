import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:greencode/app_route/app_route.dart';
import 'package:greencode/constant/app_image.dart';

class PastRecordsStatusController extends GetxController with StateMixin<dynamic> {

  // RxInt tabIndex = 0.obs;
  RxBool isPastStatusLoad = false.obs;


  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

}
