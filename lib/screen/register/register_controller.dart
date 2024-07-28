import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:greencode/app_route/app_route.dart';
import 'package:greencode/constant/app_constant.dart';
import 'package:greencode/screen/register/register_model.dart';
import 'package:greencode/screen/register/register_provider.dart';
import 'package:greencode/screen/sign_in/sign_in_model.dart';
import 'package:greencode/screen/sign_in/sign_in_provider.dart';
import 'package:greencode/utils/preference.dart';
import 'package:greencode/widget/progress_dialog_utils.dart';

class RegisterController extends GetxController with StateMixin<dynamic> {
  RxBool? rememberMe = false.obs;

  RxString? lngSelection = LocalLanguages.langChinese.obs;
  ///SIGNIN
  TextEditingController? cResidentId = TextEditingController();
  // TextEditingController? cPassword = TextEditingController();

  setDefaultLocale() async {
    String userDefaultLanguage = await Preference().read(Const.prefLangName);
    debugPrint('userDefaultLanguage : $userDefaultLanguage');
    if(userDefaultLanguage == LocalLanguages.langChinese) {
      lngSelection!.value = LocalLanguages.langChinese;
      await Preference().save(Const.prefLanguage, Const.prefLangCodeChinese);
    }else if(userDefaultLanguage == LocalLanguages.langSimplified){
      lngSelection!.value = LocalLanguages.langSimplified;
      await Preference().save(Const.prefLanguage, Const.prefLangCodeSimplified);
    }
    else{
      lngSelection!.value = LocalLanguages.langEnglish;
      await Preference().save(Const.prefLanguage, Const.prefLangCodeEnglish);
    }
  }


  @override
  Future<void> onInit() async {
    // TODO: implement onInit

    super.onInit();
    debugPrint('onInit register');
    // lngSelection!.value = await Preference().read(Const.prefLangName);
    debugPrint('onInit register ${await Preference().read(Const.prefLangName)}');
    setDefaultLocale();
    // getPrefData();
  }

  @override
  Future<void> onReady() async {
    // TODO: implement onReady
    debugPrint('onReady register');
    super.onReady();
    // lngSelection!.value = await Preference().read(Const.prefLangName);
    debugPrint('onReady register ${await Preference().read(Const.prefLangName)}');
    setDefaultLocale();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    debugPrint('onClose register');
    super.onClose();
  }

  // getPrefData() async{
  //   cUserName!.text = ema
  // }



  Future<RegisterModel?> callRegisterApi() async {
    ProgressDialogUtils.showProgressDialog(Get.context);
    String language =await Preference().read(Const.prefLanguage);
    var token = await FirebaseMessaging.instance.getToken();
    debugPrint('SaveSignInDate => token : $token');
    RegisterProvider()
        .callRegisterApi(cResidentId!.text.trim(),token!,language)
        .then((callLoginValue) async {
      final register = RegisterModel.fromJson(callLoginValue);
      change(value, status: RxStatus.success());
      if (register.status == 1) {
        ProgressDialogUtils.hideProgressDialog();
        // Const().toast(register.message);
        await Preference().save(Const.residentID, cResidentId!.text.trim());

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
        if(register.registerData!.isRegister == 1){
          Get.offNamed(AppRoute.signInScreen);
        }else{
          Get.toNamed(AppRoute.registerEmailScreen);
        }
      } else {
        ProgressDialogUtils.hideProgressDialog();
        Const().toast(register.message);
        FocusManager.instance.primaryFocus?.unfocus();
      }
    }, onError: (error) {
      ProgressDialogUtils.hideProgressDialog();
      debugPrint('LoginApi => Error : $error');
      change(null, status: RxStatus.error(error.toString()));
    });
  }
}
