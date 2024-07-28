import 'dart:convert';

import 'package:get/get.dart';
import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greencode/api/api_url.dart';
import 'package:greencode/constant/app_constant.dart';
import 'package:greencode/screen/dashboard/dashboard_controller.dart';
import 'package:greencode/screen/e_resident_card/e_resident_card_model.dart';
import 'package:greencode/screen/e_resident_card/e_resident_card_provider.dart';
import 'package:greencode/utils/preference.dart';
import 'package:greencode/widget/progress_dialog_utils.dart';
import 'package:notification_permissions/notification_permissions.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';

class EResidentCardLogic extends GetxController with StateMixin<dynamic> {


  // GlobalKey<ScaffoldState>? scaffoldKeyEResidenceCard ;
  var userId ,apiToken,languageKey,userDetail;

  void openDrawer() {
    // final logic = Get.put(DashboardController());
   // logic.scaffoldKeyEResidenceCard.currentState?.openEndDrawer();
  }


  @override
  void onInit() {
    // TODO: implement onInit

    super.onInit();
    // scaffoldKeyEResidenceCard = GlobalKey<ScaffoldState>(debugLabel: 'scaffoldKeyEResidenceCard');
    callUserDetailById();
    // getPrefData();
  }


  @override
  void dispose() {
    // TODO: implement dispose
    // final logic = Get.put(DashboardController());
    // logic.scaffoldKeyEResidenceCard.currentState!.dispose();
    // context!.read<MenuController>().scaffoldKey.currentState!.dispose();
    super.dispose();

    // scaffoldKeyEResidenceCard = null;

    debugPrint(' =====> EResidentCardLogic dispose <===== ');
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    // scaffoldKeyEResidenceCard = null;
    debugPrint(' =====> EResidentCardLogic onClose <===== ');
  }


  // Rx<UserDetail> changePasswordList = UserDetail().obs;
  RxString message = ''.obs;
  Rx<RxList<UserDetail>> userDataList = RxList<UserDetail>.empty().obs;
  RxBool? isUserDetailLoaded = false.obs;

  Future<UserDetail?> callUserDetailById() async {
    userId = await Preference().readInt(Const.prefUserId);
    debugPrint('callUserDetailById => userId : $userId');
    apiToken = await Preference().read(Const.prefAPIToken);
    languageKey = await Preference().read(Const.prefLanguage);
    debugPrint('callUserDetailById => languageKey : $languageKey');
    // WidgetsBinding.instance?.addPostFrameCallback((_) {  ProgressDialogUtils.showProgressDialog(Get.context);  });
    Map<String, dynamic> queryRequest = {
      'user_id':'$userId',
      // 'user_id':'9',
      // 'language_key': 'en'
      'language_key': languageKey
    };
    // Map<String, dynamic> queryRequest = {'user_id':'9','language_key': 'en'};
    Map<String, String> headers = {"authorization": "Bearer $apiToken"};
    EResidentCardProvider().getUserDetailByIdList(queryRequest: queryRequest, headers: headers).then((userDetailValue) async {
      var userData =  UserDetail.fromJson(userDetailValue);
      if(userData.status == 1) {
        userDetail = jsonEncode(userDetailValue);
        userDataList.value.clear();
        userDataList.value.add(userData);
        if (userDataList.value.isEmpty) {
          isUserDetailLoaded!.value = true;
        }
        // WidgetsBinding.instance?.addPostFrameCallback((_) {ProgressDialogUtils.hideProgressDialog();});
      }
      else{
        isUserDetailLoaded!.value = true;
        message.value = userData.message.toString();
        // WidgetsBinding.instance?.addPostFrameCallback((_) {ProgressDialogUtils.hideProgressDialog();});
        // Const().toast(userData. message);
      }
      if(userDataList.value.isEmpty)
      {   isUserDetailLoaded!.value = true;
      }


    //   changePasswordList.value =  UserDetail.fromJson(userDetailValue);
    //   if(changePasswordList.value.status == 0) {
    //     ProgressDialogUtils.hideProgressDialog();
    //     debugPrint('callUserDetailById => error 1 : ${changePasswordList.value.message}');
    //     Const().toast(changePasswordList.value.message);
    //   }
    //   else {
    //     ProgressDialogUtils.hideProgressDialog();
    //     debugPrint('callUserDetailById => error 2 : ${changePasswordList.value.message}');
    //     // await Preference().save(Const.prefPass,cConPass.text.toString());
    //     dialogCancelSuccessfully(
    //       Get.context!,
    //       'password_changed'.tr,
    //       'back_dialog'.tr,
    //           () {Get.back();
    //         // cConPass.clear();cNewPass.clear();
    //       },
    //     );
    //   }
    }).onError((error, stackTrace) {
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        ProgressDialogUtils.hideProgressDialog();
      });
      debugPrint('callUserDetailById => error : $error');
      Const().toast(error.toString());
    });
  }


  void closeDrawer() {
    Get.back();
    FocusScope.of(Get.context!).unfocus();
  }

}
