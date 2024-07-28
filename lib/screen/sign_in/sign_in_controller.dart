import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:greencode/app_route/app_route.dart';
import 'package:greencode/constant/app_constant.dart';
import 'package:greencode/screen/sign_in/sign_in_model.dart';
import 'package:greencode/screen/sign_in/sign_in_provider.dart';
import 'package:greencode/utils/preference.dart';
import 'package:greencode/widget/progress_dialog_utils.dart';

class SignInController extends GetxController with StateMixin<dynamic> {
  RxBool? rememberMe = false.obs;

  ///SIGNIN
  TextEditingController? cPassword = TextEditingController();


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

  Future<SignInModel?> callSignInApi() async {
    ProgressDialogUtils.showProgressDialog(Get.context);
    var token = await FirebaseMessaging.instance.getToken();
    String language =await Preference().read(Const.prefLanguage);
    var residentId = await Preference().read(Const.residentID);
    debugPrint('SaveSignInDate => token : $token');
    SignInProvider()
        .callLogin(residentId, cPassword!.text.trim(),token!,language)
        .then((callLoginValue) async {
      final signIn = SignInModel.fromJson(callLoginValue);
      change(value, status: RxStatus.success());
      if (signIn.status == 1) {
        ProgressDialogUtils.hideProgressDialog();
        Const().toast(signIn.message);
        await Preference().save(Const.prefFCMToken, token);
        await Preference().saveInt(Const.prefUserId, signIn.signInData!.id);
        await Preference().save(Const.prefAPIToken, signIn.signInData!.bearerToken);
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
        await Preference().saveBool(Const.prefNotificationRoutesSet, false);
        var aa = await Preference().readBool(Const.prefNotificationRoutesSet);
        debugPrint('saveData => aa : $aa');
        await Preference().save(Const.prefPass, cPassword!.text.toString());
        var a = await Preference().readBool(Const.prefIsLoggedIn);
        debugPrint('saveData => a : $a');

        await Preference().saveBool(Const.prefIsLoggedIn, true);
        Get.offNamed(AppRoute.dashboardScreen);
      } else {
        ProgressDialogUtils.hideProgressDialog();
        Const().toast(signIn.message);
        FocusManager.instance.primaryFocus?.unfocus();
      }
    }, onError: (error) {
      ProgressDialogUtils.hideProgressDialog();
      debugPrint('LoginApi => Error : $error');
      change(null, status: RxStatus.error(error.toString()));
    });
  }

// Future<Signin?> saveSignInData() async {
//   ProgressDialogUtils.showProgressDialog(Get.context);
//   var token = await FirebaseMessaging.instance.getToken();
//   debugPrint('saveSignInData => token : $token');
//   await SiginProvider().callLogin(cEmail!.text.trim(),cPassword!.text.trim(),token!).then((callLoginValue) async {
//     final singIn = Signin.fromJson(callLoginValue);
//     change(value, status: RxStatus.success());
//     if(singIn.status == 0) {
//       ProgressDialogUtils.hideProgressDialog();
//       Const().toast(singIn.message);
//       // return Signin.fromJson(callLoginValue);
//     }
//     else {
//       debugPrint('email : ${cEmail!.text.trim()}');
//       debugPrint('password : ${cPassword!.text.trim()}');
//       debugPrint('loginApi => singIn.signinData.id : ${singIn.signinData.id}');
//       debugPrint('loginApi => singIn.signinData.username : ${singIn.signinData.username}');
//       debugPrint('loginApi => singIn.signinData.email : ${singIn.signinData.email}');
//       debugPrint('loginApi => singIn.signinData.role : ${singIn.signinData.role}');
//       debugPrint('loginApi => singIn.signinData.address : ${singIn.signinData.address}');
//       debugPrint('loginApi => singIn.signinData.currentLatitude : ${singIn.signinData.currentLatitude}');
//       debugPrint('loginApi => singIn.signinData.currentLongitude : ${singIn.signinData.currentLongitude}');
//       debugPrint('loginApi => singIn.signinData.verificationCode : ${singIn.signinData.verificationCode}');
//       debugPrint('loginApi => singIn.signinData.token : ${singIn.signinData.token}');
//       debugPrint('loginApi => singIn.signinData.getRole.id : ${singIn.signinData.getRole.id}');
//       debugPrint('loginApi => singIn.signinData.getRole.name : ${singIn.signinData.getRole.name}');
//       await Preference().save(Const.prefRememberMe, rememberMe!.value.toString());
//       await Preference().save(Const.prefEmail, cEmail!.text.trim());
//       await Preference().save(Const.prefPass, cPassword!.text.trim());
//       await Preference().save(Const.prefFCMToken, token);
//       await Preference().saveInt(Const.prefUserId, singIn.signinData.id);
//       await Preference().saveInt(Const.prefUserRoleId, singIn.signinData.getRole.id);
//       await Preference().save(Const.prefUserRoleName, singIn.signinData.getRole.name);
//       await Preference().save(Const.prefAPIToken, singIn.signinData.token);
//       await Preference().saveBool(Const.prefIsLoggedIn, true);
//       var a = await Preference().readBool(Const.prefIsLoggedIn);
//       debugPrint('saveData => a : $a');
//       ProgressDialogUtils.hideProgressDialog();
//       Get.offNamed(AppRoutes.homeScreen);
//
//       // var a = await Preference().read(Const.prefRememberMe);
//       // var b = await Preference().read(Const.prefEmail);
//       // var c = await Preference().read(Const.prefPass);
//       // var d = await Preference().read(Const.prefFCMToken);
//       // var e = await Preference().readInt(Const.prefUserId);
//       // var f = await Preference().readInt(Const.prefUserRoleId);
//       // var h = await Preference().read(Const.prefUserRoleName);
//       // var i = await Preference().read(Const.prefAPIToken);
//       // debugPrint('saveData => a : $a');
//       // debugPrint('saveData => b : $b');
//       // debugPrint('saveData => c : $c');
//       // debugPrint('saveData => d : $d');
//       // debugPrint('saveData => e : $e');
//       // debugPrint('saveData => f : $f');
//       // debugPrint('saveData => h : $h');
//       // debugPrint('saveData => i : $i');
//       // return Signin.fromJson(callLoginValue);
//     }
//   },onError: (error) {
//     // debugPrint('loginApi => ERROR : $error');
//     change(null,status: RxStatus.error(error.toString()));
//   });
// }
}
