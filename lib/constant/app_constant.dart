

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:developer' as logger;

class Const {


  /// SAVE PREFERENCE KEY ///
  static const prefEmail = 'email';
  static const prefPass = 'password';
  static const forgotPasswordEmail = 'forgotPasswordEmail';
  static const residentID = 'residentId';
  static const prefFCMToken = 'fcmToken';

  static const prefName = 'name';
  static const prefPhone = 'phone';
  static const prefPhoneCode = 'phonecode';
  static const prefAddress = 'address';
  static const prefRememberMe = 'rememberMe';
  static const prefUserRoleId = 'userroleid';
  static const prefUserId = 'userid';
  static const prefClubId = 'clubid';
  static const prefUserRoleName = 'userrolename';
  static const prefNotificationRoutesSet = 'prefNotificationRoutesSet';


  static const prefAPIToken = 'apiToken';
  static const prefLanguage = 'language';
  static const prefEstateNoticeListID = 'estateNoticeId';
  static const prefIsLoggedIn = 'isLogin';


  static const prefLangName = 'languageName';

  static const prefLangCodeChinese = 'cn';
  static const prefLangCodeEnglish = 'en';
  static const prefLangCodeSimplified = 'zh';


  static const firstTabMain = 0;
  static const secondTabQr = 1;
  static const thirdTabBooking = 2;
  static const fourthTabNotification = 3;

  static const catMtr = 0;
  static const catBus = 1;
  static const catTaxi = 2;
  static const catLibrary = 3;
  static const catPostOffice = 4;
  static const catWetMarket = 5;
  static const catSportCenter = 6;




  List bookingDetails = [
    ['Monday','Mon'],
    ['Tuesday','Mon'],
    ['Wednesday','Mon'],
    ['Thursday','Mon'],
    ['Friday','Mon'],
    ['Saturday','Mon'],
    ['Sunday','Mon'],
  ];






  /// REGULAR EXPRESSION VALIDATION PATTERN ///
  static const emailPattern =  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  static const nameWithSpecialCharacterPattern = r"^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$";
  static const nameWithNumericPattern = r'[0-9]+';
  static const nameWithPattern = r'^[a-zA-Z0-9._-]{3,}$';



  /// Toast for default time
  void toast(
      String? value, {
        ToastGravity? gravity,
        length = Toast.LENGTH_SHORT,
        Color? bgColor,
        Color? textColor,
        bool print = false,
      }) {
    if (value!.isEmpty) {
      logger.log(value);
    } else {
      Fluttertoast.showToast(
        msg: value.toString(),
        gravity: gravity,
        toastLength: length,
        backgroundColor: bgColor,
        textColor: textColor,
      );
      if (print) logger.log(value);
    }
  }

}

///App Roles
class UserRoles {
  static const int comapany = 3;
  static const int driver = 4;
  static const int customer = 5;
}

///PERMISSION STATUS
class NotificationStatus{
  static const String permGranted = "granted";
  static const String permDenied = "denied";
  static const String permUnknown = "unknown";
  static const String permProvisional = "provisional";
}


///LOCALISATION
class LocalLanguages {
  static const langChinese = '繁體中文';
  static const langSimplified = '简体中文';
  static const langEnglish = 'English';

}