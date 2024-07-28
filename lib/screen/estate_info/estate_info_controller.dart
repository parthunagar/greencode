import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:greencode/app_route/NavigationArgs.dart';
import 'package:greencode/app_route/app_route.dart';
import 'package:greencode/constant/app_constant.dart';
import 'package:greencode/constant/app_image.dart';
import 'package:greencode/constant/colors.dart';
import 'package:greencode/screen/dashboard/dashboard_controller.dart';
import 'package:greencode/screen/estate_info/estate_info_model.dart';
import 'package:greencode/screen/estate_info/estate_info_provider.dart';
import 'package:greencode/utils/preference.dart';
import 'package:greencode/widget/progress_dialog_utils.dart';

class EstateInfoController extends GetxController with StateMixin<dynamic> {
  final dashboardController = Get.find<DashboardController>();
  Rx<Color> background = Colors.white.obs;
  RxBool iconColor = false.obs;
  RxString message = ''.obs;
  Rx<RxList<EstateInfoData>> estateInfoMutableList =
      RxList<EstateInfoData>.empty().obs;

  // var scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<ScaffoldState> scaffoldKeyOne = GlobalKey<ScaffoldState>(debugLabel: 'scaffoldKeyOne');

  void openDrawer() {
    scaffoldKeyOne.currentState?.openEndDrawer();
  }

  void closeDrawer() {
    Get.back();
    FocusScope.of(Get.context!).unfocus();
  }

  RxInt tabIndex = 0.obs;
  RxInt currantIndex = 0.obs;

  RxBool isEstateInfoListLoad = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    debugPrint('onInit');
    callGetEstateInfoListApi();

  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    debugPrint('Onready');
    // callGetEstateInfoListApi();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  Future<EstateInfoModel?> callGetEstateInfoListApi() async {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      ProgressDialogUtils.showProgressDialog(Get.context);
    });
    String token = await Preference().read(Const.prefAPIToken);
    String language =await Preference().read(Const.prefLanguage);
    debugPrint('language => value  :${language}');
    EstateInfoListProvider().callNoticeCategoryList(token, language).then((value) async {

      final estateInfoList = EstateInfoModel.fromJson(value);
      change(value, status: RxStatus.success());
      if (estateInfoList.status == 1) {
        WidgetsBinding.instance?.addPostFrameCallback((_) {
          ProgressDialogUtils.hideProgressDialog();
        });
        estateInfoMutableList.value.clear();
        estateInfoMutableList.value.addAll(estateInfoList.data!);
        if(estateInfoMutableList.value.isEmpty){
          isEstateInfoListLoad.value = true;
        }

      } else {
        isEstateInfoListLoad.value = true;
        WidgetsBinding.instance?.addPostFrameCallback((_) {
          ProgressDialogUtils.hideProgressDialog();
        });
        message.value = estateInfoList.message.toString();
        // Const().toast(estateInfoList.message);
      }
    }, onError: (error) {
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        ProgressDialogUtils.hideProgressDialog();
      });
      debugPrint("Get Advertisement Api => error : $error");
      change(null, status: RxStatus.error(error.toString()));
    });
  }
}
