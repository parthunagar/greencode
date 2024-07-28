import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greencode/api/api_url.dart';
import 'package:greencode/constant/app_constant.dart';
import 'package:greencode/screen/change_password/chage_password_provider.dart';
import 'package:greencode/screen/change_password/change_password_model.dart';
import 'package:greencode/utils/preference.dart';
import 'package:greencode/widget/customDialog.dart';
import 'package:greencode/widget/progress_dialog_utils.dart';
import 'package:url_launcher/url_launcher.dart';


class ChangePasswordLogic extends GetxController with StateMixin<dynamic>  {


  GlobalKey<ScaffoldState> scaffoldKeyChangePassword = GlobalKey<ScaffoldState>(debugLabel: 'scaffoldKeyChangePassword');


  TextEditingController cNewPass = TextEditingController();
  TextEditingController cConPass = TextEditingController();

  void openDrawer() {
    scaffoldKeyChangePassword.currentState?.openEndDrawer();
  }

  var userId ,apiToken,oldPasswrod;

  Rx<ChangePassword> changePasswordList = ChangePassword().obs;


  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    oldPasswrod = await Preference().read(Const.prefPass);
    debugPrint('onInit => oldPasswrod : $oldPasswrod');
  }

  Future<ChangePassword?> callChangePassword() async {
    userId = await Preference().readInt(Const.prefUserId);
    apiToken = await Preference().read(Const.prefAPIToken);
    oldPasswrod = await Preference().read(Const.prefPass);
    debugPrint('callChangePassword => userId : $userId');
    debugPrint('callChangePassword => apiToken : $apiToken');
    debugPrint('callChangePassword => oldPasswrod : $oldPasswrod');
    WidgetsBinding.instance?.addPostFrameCallback((_) {  ProgressDialogUtils.showProgressDialog(Get.context);  });
    Map<String, dynamic> queryRequest = {'user_id':'$userId','old_password': oldPasswrod,'new_password':cConPass.text.toString()};
    Map<String, String> headers = {"authorization": "Bearer $apiToken"};
    ChangePasswordProvider().callChangePassword(queryRequest: queryRequest, headers: headers).then((changePasswordValue) async {
      changePasswordList.value =  ChangePassword.fromJson(changePasswordValue);
      if(changePasswordList.value.status == 0) {
        ProgressDialogUtils.hideProgressDialog();
        Const().toast(changePasswordList.value.message);
      }
      else {
        ProgressDialogUtils.hideProgressDialog();
        await Preference().save(Const.prefPass,cConPass.text.toString());
        dialogCancelSuccessfully(
          Get.context!,
          'password_changed'.tr,
          'back_dialog'.tr,
          () {Get.back();Get.back();
          // cConPass.clear();cNewPass.clear();
          },
        );
      }

    }).onError((error, stackTrace) {
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        ProgressDialogUtils.hideProgressDialog();
      });
      Const().toast(error.toString());
    });


  }

  void closeDrawer() {
    Get.back();
    FocusScope.of(Get.context!).unfocus();
  }




}
