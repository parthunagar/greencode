import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:greencode/app_route/app_route.dart';
import 'package:greencode/constant/app_constant.dart';
import 'package:greencode/screen/reset_password/reset_password_model.dart';
import 'package:greencode/screen/reset_password/reset_password_provider.dart';
import 'package:greencode/utils/preference.dart';
import 'package:greencode/widget/progress_dialog_utils.dart';

class ResetPasswordController extends GetxController with StateMixin<dynamic> {
  TextEditingController? cPassword = TextEditingController();
  TextEditingController? cConfirmPassword = TextEditingController();


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

  Future<ResetPasswordModel?> callResetPasswordApi() async {
    ProgressDialogUtils.showProgressDialog(Get.context);
    var emailForgotPassword = await Preference().read(Const.forgotPasswordEmail);
    String language =await Preference().read(Const.prefLanguage);
    ResetPasswordProvider()
        .callResetPassword(cPassword!.text.trim(), cConfirmPassword!.text.trim(), emailForgotPassword,language)
        .then((callLoginValue) async {
      final resetPassword = ResetPasswordModel.fromJson(callLoginValue);
      change(value, status: RxStatus.success());
      if (resetPassword.status == 1) {
        ProgressDialogUtils.hideProgressDialog();
        Const().toast(resetPassword.message);
        // await Preference().saveBool(Const.prefIsLoggedIn, true);
        // if(resetPassword.data.isRegister == 1){
          Get.offAllNamed(AppRoute.signInScreen);
        // }else{
        //   Get.toNamed(AppRoute.signInScreen);
        // }
        // Get.offAllNamed(AppRoute.signInScreen);
      } else {
        ProgressDialogUtils.hideProgressDialog();
        Const().toast(resetPassword.message);
        FocusManager.instance.primaryFocus?.unfocus();
      }
    }, onError: (error) {
      ProgressDialogUtils.hideProgressDialog();
      debugPrint('LoginApi => Error : $error');
      change(null, status: RxStatus.error(error.toString()));
    });
  }
}
