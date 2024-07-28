import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:greencode/app_route/NavigationArgs.dart';
import 'package:greencode/app_route/app_route.dart';
import 'package:greencode/constant/app_constant.dart';
import 'package:greencode/screen/forgot_password/forgot_password_model.dart';
import 'package:greencode/screen/home/home_model.dart';
import 'package:greencode/screen/otp_verification/otp_verification_provider.dart';
import 'package:greencode/utils/preference.dart';
import 'package:greencode/widget/progress_dialog_utils.dart';

class OtpVerificationController extends  GetxController with StateMixin<dynamic>{
  RxString cOtp = ''.obs;
  String residentId = '';

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    residentId = Get.arguments[NavigationArgs.navigationForgotResidentID];
  }

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

  Future<SignOutModel?> callOtpVerificationApi() async{
    if (cOtp.value != '') {
      String language =await Preference().read(Const.prefLanguage);
      ProgressDialogUtils.showProgressDialog(Get.context);
      OtpVerificationProvider().callOtpVerification(residentId,cOtp.value.trim().toString(),language).then((
          otpValue) async {
        final otpVerify = SignOutModel.fromJson(otpValue);
        change(otpValue, status: RxStatus.success());
        if (otpVerify.status == 1) {
          ProgressDialogUtils.hideProgressDialog();
          Const().toast(otpVerify.message);
          Get.toNamed(AppRoute.resetPasswordScreen);
        } else {
          ProgressDialogUtils.hideProgressDialog();
          Const().toast(otpVerify.message);
        }
      }, onError: (error) {
        debugPrint('call Otp Verification => error : $error');
        ProgressDialogUtils.hideProgressDialog();
        change(null, status: RxStatus.error(error.toString()));
      });
    }else{
      Const().toast('valid_otp'.tr);
    }
    // await
  }
}
