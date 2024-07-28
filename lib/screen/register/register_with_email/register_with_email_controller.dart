import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:greencode/app_route/app_route.dart';
import 'package:greencode/constant/app_constant.dart';
import 'package:greencode/screen/register/register_with_email/register_with_email_model.dart';
import 'package:greencode/screen/register/register_with_email/register_with_email_provider.dart';
import 'package:greencode/screen/sign_in/sign_in_model.dart';
import 'package:greencode/screen/sign_in/sign_in_provider.dart';
import 'package:greencode/utils/preference.dart';
import 'package:greencode/widget/progress_dialog_utils.dart';

class RegisterWithEmailController extends GetxController
    with StateMixin<dynamic> {
  RxBool? rememberMe = false.obs;

  ///SIGNIN

  TextEditingController? cEmail = TextEditingController();
  TextEditingController? cPassword = TextEditingController();
  TextEditingController? cConfirmPassword = TextEditingController();
  TextEditingController? cPassCode = TextEditingController();

  setDefaultLocale() async {
    String userDefaultLanguage = await Preference().read(Const.prefLangName);
    debugPrint('userDefaultLanguage : $userDefaultLanguage');
    if(userDefaultLanguage == LocalLanguages.langChinese) {
      await Preference().save(Const.prefLanguage, Const.prefLangCodeChinese);
    }else if(userDefaultLanguage == LocalLanguages.langSimplified){
      await Preference().save(Const.prefLanguage, Const.prefLangCodeSimplified);
    }
    else{
      await Preference().save(Const.prefLanguage, Const.prefLangCodeEnglish);
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit

    super.onInit();
    setDefaultLocale();
    // getPrefData();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    setDefaultLocale();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  // getPrefData() async{
  //   cUserName!.text = ema
  // }

  Future<RegisterWithEmailModel?> callRegisterEmailApi() async {
    ProgressDialogUtils.showProgressDialog(Get.context);
    var token = await FirebaseMessaging.instance.getToken();
    String language =await Preference().read(Const.prefLanguage);
    var residentId = await Preference().read(Const.residentID);
    debugPrint('SaveSignInDate => token : $token');
    RegisterWithEmailProvider()
        .callRegisterWithEmail(residentId, cEmail!.text.trim(),cPassCode!.text.trim(),
            cPassword!.text.trim(), token!,language)
        .then((callLoginValue) async {
      final registerEmail = RegisterWithEmailModel.fromJson(callLoginValue);
      change(value, status: RxStatus.success());
      if (registerEmail.status == 1) {
        ProgressDialogUtils.hideProgressDialog();
        // Const().toast(signIn.message);
        // await Preference().save(Const.prefFCMToken, token);
        // await Preference().saveInt(Const.prefUserId, signIn.signInData!.id);
        // await Preference()
        //     .save(Const.prefAPIToken, signIn.signInData!.bearerToken);
        String userDefaultLanguage =
            await Preference().read(Const.prefLangName);
        debugPrint('userDefaultLanguage : $userDefaultLanguage');
        if (userDefaultLanguage == LocalLanguages.langChinese) {
          await Preference()
              .save(Const.prefLanguage, Const.prefLangCodeChinese);
        } else {
          await Preference()
              .save(Const.prefLanguage, Const.prefLangCodeEnglish);
        }
        await Preference().save(Const.forgotPasswordEmail, cEmail!.text.trim());
        if(registerEmail.registerData!.isRegister == 1){
          Get.offNamed(AppRoute.signInScreen);
        }


        // await Preference().save(Const.prefPass, cPassword!.text.toString());
        // var a = await Preference().readBool(Const.prefIsLoggedIn);
        // debugPrint('saveData => a : $a');
        //
        // await Preference().saveBool(Const.prefIsLoggedIn, true);
      } else {
        ProgressDialogUtils.hideProgressDialog();
        Const().toast(registerEmail.message);
        FocusManager.instance.primaryFocus?.unfocus();
      }
    }, onError: (error) {
      ProgressDialogUtils.hideProgressDialog();
      debugPrint('LoginApi => Error : $error');
      change(null, status: RxStatus.error(error.toString()));
    });
  }
}
