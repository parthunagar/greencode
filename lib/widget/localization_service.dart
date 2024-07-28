import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greencode/constant/app_constant.dart';
import 'package:greencode/lang/en_US.dart';
import 'package:greencode/lang/zh_SC.dart';
import 'package:greencode/lang/zh_TW.dart';

class LocalizationService extends Translations {
  static final locale = Locale('en', 'US');
  static final fallbackLocale = Locale('zh', 'TW');
  static final simplifiedLocale = Locale('zh', 'SC');
  // static final langs = [LocalLanguages.langEnglish, LocalLanguages.langChinese];
  static final langs = [LocalLanguages.langChinese,LocalLanguages.langSimplified,LocalLanguages.langEnglish];

  static final locales = [ Locale('en', 'US'),  Locale('zh', 'TW'),Locale('zh', 'SC')];

  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': enUS, // lang/en_us.dart
    'zh_TW': zhTW, // lang/tr_tr.dart
    'zh_SC': zhSC, // lang/tr_tr.dart
  };

  void changeLocale(String lang) {
    final locale = _getLocaleFromLanguage(lang);
    Get.updateLocale(locale!);
  }

  Locale? _getLocaleFromLanguage(String lang) {
    for (int i = 0; i < langs.length; i++) {
      if (lang == langs[i]) return locales[i];
    }
    return Get.locale;
  }
}