import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:greencode/app_route/app_route.dart';
import 'package:greencode/constant/app_constant.dart';
import 'package:greencode/utils/preference.dart';
import 'package:greencode/widget/localization_service.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Utils {

  static bool flagBackGround = false;

  static Future<String> getDateFormat(DateTime dateMain, String outPutFormat) async {
    final DateFormat formatter = DateFormat(outPutFormat);
    final String formatted = formatter.format(dateMain);
    return formatted;
  }

  static clearSession() async {
    var userDefaultLanguage =  await Preference().read(Const.prefLangName);
    debugPrint('Lanaguage Change ${userDefaultLanguage}');
    await Preference().clear();
    await Preference().saveBool(Const.prefIsLoggedIn, false);
    if(userDefaultLanguage == LocalLanguages.langChinese) {
      await Preference().save(Const.prefLanguage, Const.prefLangCodeChinese);
    }else if(userDefaultLanguage == LocalLanguages.langSimplified){
      await Preference().save(Const.prefLanguage, Const.prefLangCodeSimplified);
    }
    else{
      await Preference().save(Const.prefLanguage, Const.prefLangCodeEnglish);
    }

    Get.updateLocale(LocalizationService.fallbackLocale);
    Get.offAllNamed(AppRoute.registerScreen);
  }
}