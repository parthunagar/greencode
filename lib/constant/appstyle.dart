
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'colors.dart';

double getHorizontalSize(double px) {
  return px * ((MediaQuery.of(Get.context!).size.width) / 375);
}

double getFontSize(double px) {
  return px * ((MediaQuery.of(Get.context!).size.width) / 375);
}

double getVerticalSize(double px) {
  return px * ((MediaQuery.of(Get.context!).size.height) / 890);
}

class AppStyle {
  static String familyRobotoRegular = 'Roboto-Regular';
  static String familyAbelPro = 'Abel-Pro';
  static String familyAbelProBold= 'Abel-Pro-Bold';

  // static TextStyle textStyleMontserratBold30 = TextStyle(color: vpnGrey, fontSize: getFontSize(40),fontFamily: familyMontserratBold);

  static TextStyle textStyleFamilyRobotoRegular = TextStyle(color: cBlack, fontSize: 15,fontStyle: FontStyle.normal, fontFamily: familyRobotoRegular);
  static TextStyle textStyleFamilyAbelPro = TextStyle(color: cWhite, fontSize: 18,fontFamily: familyAbelPro);
  static TextStyle textStyleFamilyAbelProBold = TextStyle(color: cWhite, fontSize: 18,fontFamily: familyAbelProBold);
  // static TextStyle textStyleRobotoRegular11 = TextStyle(color: cWhite, fontSize: getFontSize(11),fontFamily: familyAbelPro);

  /// DEFINE FONT FAMILY
  static TextStyle textStyleFamilyAbelProCustomBtn = TextStyle(color: cWhite, fontSize: 18,fontFamily: familyAbelPro);

  static TextStyle textStyleFamilyAbelProCustomBtn20 = TextStyle(color: cWhite, fontSize: 20,fontFamily: familyAbelPro);
  // static TextStyle textStyleFamilyAbelProCustom = const TextStyle(fontFamily: textStyleFamilyAbelPro);
  // static TextStyle textStyleFamilyAbelProBold = const TextStyle(fontFamily: familyAbelProBold);



  /// DEFINE FONT COLOR AND FONT SIZE
  static TextStyle textStyleLoginUnderline = textStyleFamilyAbelProBold.copyWith(color: cWhite, fontSize: 18,decoration: TextDecoration.underline);
  static TextStyle textStyleLoginUnderlineBlack = textStyleFamilyAbelProBold.copyWith(color: cBlack, fontSize: 18,decoration: TextDecoration.underline);
  static TextStyle textStyleLoginUnderlineBrown = TextStyle(color: cBrown, fontSize: 17,fontFamily: familyAbelPro,decoration: TextDecoration.underline);
  static TextStyle textStyleLabelColorBlack = textStyleFamilyAbelPro.copyWith(color: cBlack, fontSize: 18);
  static TextStyle textStyleLabelColorBlackMain = textStyleFamilyAbelProBold.copyWith(color: cBlack, fontSize: 18);
  static TextStyle textStyleLabelColorMediumBlack = textStyleFamilyAbelPro.copyWith(color: Colors.black, fontSize: 25);
  static TextStyle textStyleLabelColorMediumGrey = textStyleFamilyAbelPro.copyWith(color: cGreyLight, fontSize: 15);
  static TextStyle textStyleLabelColorTitleWhite = textStyleFamilyAbelPro.copyWith(color: cWhite, fontSize: 23);
  static TextStyle textStyleLabelColorTitleWhiteBold20 = textStyleFamilyAbelProBold.copyWith(color: cWhite, fontSize: 20);
  static TextStyle textStyleLabelColorTitleWhiteBold22 = textStyleFamilyAbelProBold.copyWith(color: cWhite, fontSize: 22);
  static TextStyle textStyleLabelColorTitleBlueBold22 = textStyleFamilyAbelProBold.copyWith(color: cBlue, fontSize: 22);
  static TextStyle textStyleLabelColorTitleBlue18 = textStyleFamilyAbelPro.copyWith(color: cBlue, fontSize: 18);
  static TextStyle textStyleLabelColorTitleWhiteBold = textStyleFamilyAbelPro.copyWith(color: cWhite, fontSize: 25);

  //Main Page
  static TextStyle textStyleLabelColorBlackSmall = textStyleFamilyAbelPro.copyWith(color: Colors.black, fontSize: getFontSize(13));
  static TextStyle textStyleLabelColorUnSelected = textStyleFamilyAbelPro.copyWith(color: cGreyLight, fontSize: getFontSize(13));
  static TextStyle textStyleLabelColorBlackHome = textStyleFamilyAbelPro.copyWith(color: cBlack, fontSize: 17);
  static TextStyle textStyleLabelColorBlackHome16 = textStyleFamilyAbelPro.copyWith(color: cBlack, fontSize: 16);
  static TextStyle textStyleLabelColorBlackDrawer = textStyleFamilyAbelPro.copyWith(color: cBlack, fontSize: 15);
  static TextStyle textStyleLabelColorBrownDrawer = textStyleFamilyAbelPro.copyWith(color: cBrown, fontSize: 15);
  static TextStyle textStyleLabelColorWhiteDrawer = textStyleFamilyAbelPro.copyWith(color: cWhite, fontSize: 15);
  static TextStyle textStyleLabelColorWhiteHome = textStyleFamilyAbelPro.copyWith(color: cWhite, fontSize: 17);
  static TextStyle textStyleLabelColorWhiteHome16 = textStyleFamilyAbelPro.copyWith(color: cWhite, fontSize: 16);

  //Estate Info List
  static TextStyle textStyleLabelColorBlackInfoList = textStyleFamilyAbelPro.copyWith(color: cBlack, fontSize: 16);
  static TextStyle textStyleLabelColorRedInfoList = textStyleFamilyAbelPro.copyWith(color: cRedLight, fontSize: 12);
  static TextStyle textStyleLabelColorWhiteInfoList = textStyleFamilyAbelPro.copyWith(color: cWhite, fontSize: 16);
  static TextStyle textStyleLabelColorLightGreyInfoList = textStyleFamilyAbelPro.copyWith(color: cTextColor, fontSize: 16);
  static TextStyle textStyleLabelColorLightWhiteInfoList = textStyleFamilyAbelPro.copyWith(color: cWhite, fontSize: 16);
  static TextStyle textStyleLabelColorLightGreyFundList = textStyleFamilyAbelPro.copyWith(color: cTextColor, fontSize: 13);
  static TextStyle textStyleLabelColorLightGrey14 = textStyleFamilyAbelPro.copyWith(color: cTextColor, fontSize: 14);
  static TextStyle textStyleRobotoMediumGrey15 = textStyleFamilyAbelPro.copyWith(fontSize: 17,color: cGrey);
  static TextStyle textStyleLabelColorBlackTitle = textStyleFamilyAbelPro.copyWith(color: Colors.black, fontSize: 22);

  //Booking
  static TextStyle textStyleLabelColorBlackClubTitle = textStyleFamilyAbelPro.copyWith(color: cBlack, fontSize: 17,decoration: TextDecoration.underline);
  static TextStyle textStyleLabelColorBrown17 = textStyleFamilyAbelPro.copyWith(color: cBrown, fontSize: 17,decoration: TextDecoration.underline);

  static TextStyle textStyleLabelColorBlackReservationTitle = textStyleFamilyAbelPro.copyWith(color: cBlack, fontSize: 17,);
  static TextStyle textStyleLabelColorBlackBoldReservationTitle = textStyleFamilyAbelProBold.copyWith(color: cBlack, fontSize: 17,);
  static TextStyle textStyleLabelColorBlackBoldDrawer = textStyleFamilyAbelProBold.copyWith(color: cBlack, fontSize: 15);
  static TextStyle textStyleLabelColorBlackTabTitle = textStyleFamilyAbelPro.copyWith(color: cBlack, fontSize: 17,);
  static TextStyle textStyleLabelColorBrownTabTitle = textStyleFamilyAbelPro.copyWith(color: cBlack, fontSize: 17,);
  static TextStyle textStyleLabelColorRedLight11 = textStyleFamilyAbelPro.copyWith(color: cRedLight, fontSize: 11,);
  static TextStyle textStyleLabelColorGreyLight11 = textStyleFamilyAbelPro.copyWith(color: cGreyLight, fontSize: 11,);
  static TextStyle textStyleLabelColorBlackLight14 = textStyleFamilyAbelPro.copyWith(color: cBlack, fontSize: 14,);

  //Booking Details
  static TextStyle textStyleLabelColorGreyLight14 = textStyleFamilyAbelPro.copyWith(color: cGreyLight, fontSize: 14,);
  static TextStyle textStyleLabelColorBlackClubTitle18 = textStyleFamilyAbelPro.copyWith(color: cBlack, fontSize: 18,);
  static TextStyle textStyleLabelColorGreyInfoList = textStyleFamilyAbelPro.copyWith(color: cGreyText, fontSize: 12);
  static TextStyle textStyleLabelColorBlack20 = textStyleFamilyAbelPro.copyWith(color: Colors.black, fontSize: 20);


  static TextStyle textStyleAbelProGrey16 = textStyleFamilyAbelPro.copyWith(color: cGreyText, fontSize: 16);
  static TextStyle textStyleAbelProGrey18 = textStyleFamilyAbelPro.copyWith(color: cGreyText, fontSize: 18);
  static TextStyle textStyleAbelProGrey17 = textStyleFamilyAbelPro.copyWith(color: cGreyText, fontSize: 17);
  static TextStyle textStyleAbelProGrey12 = textStyleFamilyAbelPro.copyWith(color: cGreyText, fontSize: 12);
  static TextStyle textStyleAbelProGrey15 = textStyleFamilyAbelPro.copyWith(color: cGreyText, fontSize: 15);
  static TextStyle textStyleAbelProGrey13 = textStyleFamilyAbelPro.copyWith(color: cGreyText, fontSize: 13);
  static TextStyle textStyleAbelProWhite17 = textStyleFamilyAbelPro.copyWith(color: cWhite, fontSize: 17);


  static TextStyle textStyleAbelProBoldBlack15 = textStyleFamilyAbelProBold.copyWith(color: cBlack, fontSize: 15);
  static TextStyle textStyleAbelProTextColor15 = textStyleFamilyAbelPro.copyWith(color: cNotificationText, fontSize: 15);

  static TextStyle textStyleLabelColorBlackHome14 = textStyleFamilyAbelPro.copyWith(color: cBlack, fontSize: 14);
  static TextStyle textStyleLabelColorBlueLightHome18 = textStyleFamilyAbelPro.copyWith(color: cBlueLight, fontSize: 20);
  static TextStyle textStyleLabelColorGreyTextLightHome18 = textStyleFamilyAbelPro.copyWith(color: cGreyText, fontSize: 20);


}

