import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:greencode/app_route/NavigationArgs.dart';
import 'package:greencode/app_route/app_route.dart';
import 'package:greencode/constant/app_constant.dart';
import 'package:greencode/screen/forgot_password/forgot_password_provider.dart';
import 'package:greencode/utils/preference.dart';
import 'package:greencode/widget/customDialog.dart';
import 'package:greencode/widget/progress_dialog_utils.dart';

import 'forgot_password_model.dart';

class ForgotPasswordController extends GetxController with StateMixin<dynamic>{

  TextEditingController? cEmail = TextEditingController();
  TextEditingController? cResidentId = TextEditingController();

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

  Future<ForgotPasswordModel?> callForgotPasswordApi() async{
    ProgressDialogUtils.showProgressDialog(Get.context);
    String language =await Preference().read(Const.prefLanguage);
    ForgotPasswordProvider().callForgotPassword(cResidentId!.text.trim().toString(),
        cEmail!.text.trim().toString(),language
    ).then((value) async {
      final forgotPassword = ForgotPasswordModel.fromJson(value);
      change(value, status: RxStatus.success());
      if(forgotPassword.status == 1){
        await Preference().save(Const.forgotPasswordEmail, cEmail!.text.trim());
        ProgressDialogUtils.hideProgressDialog();
        // Const().toast(forgotPassword.message);
        dialogForgotPassWord(
          Get.context!,
          'pass_code_sent'.tr,
          'pass_code_content'.tr,
          // 'booking_cancel'.tr,
          'confirm'.tr,
          // 'back_dialog'.tr,
              () {
            Get.back();
            Get.toNamed(AppRoute.otpVerificationScreen,arguments: {
              NavigationArgs.navigationForgotResidentID: cResidentId!.text.trim().toString(),
            });
            // Const().toast(reservationClubListResponse.message);
          },
        );


      }else{
        ProgressDialogUtils.hideProgressDialog();
        Const().toast(forgotPassword.message);
        FocusManager.instance.primaryFocus?.unfocus();
      }
    },onError: (error){
      ProgressDialogUtils.hideProgressDialog();
      debugPrint("Forgot Password Api => error : $error");
      change(null, status: RxStatus.error(error.toString()));
    });
  }
}
