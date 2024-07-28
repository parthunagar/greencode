import 'package:app_settings/app_settings.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:greencode/app_route/app_route.dart';
import 'package:greencode/constant/app_constant.dart';
import 'package:greencode/constant/app_image.dart';
import 'package:greencode/constant/appstyle.dart';
import 'package:greencode/constant/colors.dart';
import 'package:greencode/screen/dashboard/dashboard_controller.dart';
import 'package:greencode/screen/setting/setting_controller.dart';
import 'package:greencode/utils/preference.dart';
import 'package:greencode/widget/custom_appbar_text.dart';
import 'package:greencode/widget/custom_button.dart';
import 'package:greencode/widget/custom_drawer.dart';
import 'package:greencode/widget/localization_service.dart';

class SettingPage extends GetView<SettingLogic>  {
   SettingPage({Key? key}) : super(key: key);


  GlobalKey<ScaffoldState> scaffoldKeySetting = GlobalKey<ScaffoldState>(debugLabel: 'scaffoldKeySetting');
  @override
  Widget build(BuildContext context) {
    // final logic = Get.find<SettingLogic>();
    final dashboardController = Get.put(DashboardController());
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return WillPopScope(

      onWillPop: () async {
        Get.offAllNamed(AppRoute.dashboardScreen);
        return true;
      },
      child: Scaffold(

        key: scaffoldKeySetting,
        backgroundColor: cBottomLayout,
        endDrawer: CustomDrawer(),
        appBar: CustomAppBarText(
          padding: EdgeInsets.zero,
          leading: Container(
            padding: EdgeInsets.only(top: h * 0.04),
            width: w * 0.15,
            height: h / 10,
            // color: Colors.white,
            alignment: Alignment.center,
            child: Center(
              child: GestureDetector(
                onTap: () {
                  Get.offAllNamed(AppRoute.dashboardScreen);
                  // Get.back();
                },
                child: SvgPicture.asset(
                  Assets.back,
                ),
              ),
            ),
          ),
          title: 'setting'.tr,
          action: [
            Padding(
              padding: EdgeInsets.only(top: h * 0.05, right: 10.0),
              child: GestureDetector(
                child: SvgPicture.asset(Assets.menu),
                onTap: () {
                  // controller.openDrawer();
                  scaffoldKeySetting.currentState?.openEndDrawer();
                },
              ),
            )
          ],
        ),
        body: Obx(() {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: h * 0.02),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: w * 0.04),
                  child: Text('settings'.tr, style: AppStyle.textStyleAbelProGrey18,),
                ),
                SizedBox(height: h * 0.02),
                GestureDetector(
                  onTap: ()  {
                    // controller.callStatus().then((value)  {
                    //   debugPrint(' ====> 1 <==== ');
                    //   controller.setNotificationStatus();
                    //   debugPrint(' ====> 2 <==== ');
                    // });
                    AppSettings.openAppSettings();

                  },
                  child: Container(
                    // color: Colors.red,
                    color: cWhite,
                    padding: EdgeInsets.symmetric(vertical: h * 0.02, horizontal: w * 0.04),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(Assets.icPushNotification, color: cBrown,),
                            SizedBox(width: w * 0.02,),
                            Text('push_notification'.tr, style: AppStyle.textStyleLabelColorBlack,)
                          ],
                        ),
                        Row(
                          children: [
                            Text(controller.notificationStatus!.value == true ? 'on'.tr : 'off'.tr, style: AppStyle.textStyleAbelProGrey13,),
                            SizedBox(width: w * 0.04,),
                            // SvgPicture.asset(Assets.icArrowPath,)
                            SvgPicture.asset(Assets.rightArrow, color: cBrown)
                            // Icon(Icons.arrow_forward_ios, color: cGrey,
                            //   size: h * 0.03,),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(height: h * 0.003, color: cDivider,),

                GestureDetector(
                  onTap: () {
                    //TODO : M9
                    showModalBottomSheet(
                      context: context,
                      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20.0))),
                      builder: (BuildContext context) {
                        return RadioGroup(selectedLanguage: controller.setDefaultLang!.value);
                      });
                  },
                  child: Container(
                    color: cWhite,
                    padding: EdgeInsets.symmetric(vertical: h * 0.02, horizontal: w * 0.04),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(Assets.icChangeLanguage, color: cBrown,),
                            SizedBox(width: w * 0.02,),
                            Text('change_language'.tr, style: AppStyle.textStyleLabelColorBlack,)
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              controller.setDefaultLang!.value == LocalLanguages.langChinese ? LocalLanguages.langChinese
                              :
                              controller.setDefaultLang!.value == LocalLanguages.langSimplified ?
                                  LocalLanguages.langSimplified
                                  :  LocalLanguages.langEnglish, style: AppStyle.textStyleAbelProGrey13,),
                            SizedBox(width: w * 0.04,),
                            SvgPicture.asset(Assets.rightArrow, color: cBrown)
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(height: h * 0.003, color: cDivider,),

                GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoute.changePasswordScreen);
                  },
                  child: Container(
                    color: cWhite,
                    padding: EdgeInsets.symmetric(vertical: h * 0.02, horizontal: w * 0.04),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(Assets.icChangePassword, color: cBrown,),
                            SizedBox(width: w * 0.02,),
                            Text('change_password'.tr, style: AppStyle.textStyleLabelColorBlack,)
                          ],
                        ),
                        SvgPicture.asset(Assets.rightArrow, color: cBrown)
                      ],
                    ),
                  ),
                ),
                Divider(height: h * 0.003, color: cDivider,),

                // GestureDetector(
                //   onTap: () {
                //     controller.getFileSize(2);
                //   },
                //   child: Container(
                //     color: cWhite,
                //     padding: EdgeInsets.symmetric(vertical: h * 0.02, horizontal: w * 0.04),
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       children: [
                //         Row(
                //           children: [
                //             SvgPicture.asset(Assets.icClearCachedData, color: cBrown,),
                //             SizedBox(width: w * 0.02,),
                //             Text('clear_cached_data'.tr, style: AppStyle.textStyleLabelColorBlack,)
                //           ],
                //         ),
                //         Row(
                //           children: [
                //             //TODO : clear cache data
                //             // Text( controller.totalConvertedSize!.value.toString(), style: AppStyle.textStyleAbelProGrey13,),
                //             SizedBox(width: w * 0.04,),
                //             SvgPicture.asset(Assets.rightArrow, color: cBrown)
                //           ],
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                // Divider(height: h * 0.003, color: cDivider,),

                SizedBox(height: h * 0.02),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: w * 0.04),
                  child: Text('about'.tr, style: AppStyle.textStyleAbelProGrey18,),
                ),

                SizedBox(height: h * 0.02),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    color: cWhite,
                    padding: EdgeInsets.symmetric(vertical: h * 0.02, horizontal: w * 0.04),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('version'.tr, style: AppStyle.textStyleLabelColorBlack,),
                        Text( controller.version!.value.toString(), style: AppStyle.textStyleAbelProGrey13,),
                      ],
                    ),
                  ),
                ),
                Divider(height: h * 0.003, color: cDivider,),

                GestureDetector(
                  onTap: () {
                    controller.launchUrl();
                  },
                  child: Container(
                    color: cWhite,
                    padding: EdgeInsets.symmetric(vertical: h * 0.02, horizontal: w * 0.04),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('disclaimer_privacy_policy'.tr, style: AppStyle.textStyleLabelColorBlack,),
                        SvgPicture.asset(Assets.rightArrow, color: cBrown)
                      ],
                    ),
                  ),
                ),
                Divider(height: h * 0.003, color: cDivider,),

                // GestureDetector(
                //   onTap: () {},
                //   child: Container(
                //     color: cWhite,
                //     padding: EdgeInsets.symmetric(vertical: h * 0.02, horizontal: w * 0.04),
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       children: [
                //         Text('feedback'.tr, style: AppStyle.textStyleLabelColorBlack,),
                //         SvgPicture.asset(Assets.rightArrow, color: cBrown)
                //       ],
                //     ),
                //   ),
                // ),
                // Divider(height: h * 0.003, color: cDivider,),
                //
                // GestureDetector(
                //   onTap: () {},
                //   child: Container(
                //     color: cWhite,
                //     padding: EdgeInsets.symmetric(vertical: h * 0.02, horizontal: w * 0.04),
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       children: [
                //         Text('about_cic'.tr, style: AppStyle.textStyleLabelColorBlack,),
                //         SvgPicture.asset(Assets.rightArrow, color: cBrown)
                //       ],
                //     ),
                //   ),
                // ),
                // Divider(height: h * 0.003, color: cDivider,),
                //
                // GestureDetector(
                //   onTap: () {},
                //   child: Container(
                //     color: cWhite,
                //     padding: EdgeInsets.symmetric(vertical: h * 0.02, horizontal: w * 0.04),
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       children: [
                //         Text('rating_reviews'.tr, style: AppStyle.textStyleLabelColorBlack,),
                //         SvgPicture.asset(Assets.rightArrow, color: cBrown)
                //       ],
                //     ),
                //   ),
                // ),
                // Divider(height: h * 0.003, color: cDivider,),
                SizedBox(height: h * 0.02)
              ],
            ),
          );
        }),
      ),
    );
  }
}


// var settingCon = Get.find<SettingLogic>();



class RadioGroup extends StatefulWidget {
  String? selectedLanguage;
   RadioGroup({Key? key, required this.selectedLanguage}) : super(key: key);

  @override
  RadioGroupWidget createState() => RadioGroupWidget();
}

class RadioGroupWidget extends State<RadioGroup> {

  String selectedLang = '';
  final dashboardController = Get.put(DashboardController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedLang = widget.selectedLanguage!;
  }

  // String selectedLang = widget.selectedLanguage!;//settingCon.setDefaultLang!.value;//  setDefaultLang!.value;//LocalLanguages.langChinese;

  @override
  Widget build(BuildContext context) {
    // debugPrint('selectedLang : $selectedLang');
    // debugPrint('selectedLanguage : ${widget.selectedLanguage.toString()}');
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Container(
      height: h * 0.32,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: LocalizationService.langs.map((data) => RadioListTile<dynamic>(
              title: Padding(
                padding: EdgeInsets.only(left: w * 0.04),
                child: Text(data),
              ),
              // contentPadding: EdgeInsets.only(left: w * 0.02),
              // secondary: Icon(Icons.sd_storage),
              groupValue: selectedLang,
              // visualDensity: VisualDensity(horizontal: 3, vertical: 0),
              activeColor: cBrown,
              controlAffinity: ListTileControlAffinity.trailing,
              value: data,
              onChanged: (val) {
                debugPrint('onChanged => val : $val');
                setState(() {selectedLang = val;});
              },
            )).toList(),
          ),
          CustomButton(
            title: 'confirm'.tr,
            backgroundColor: cBlack,
            style: AppStyle.textStyleFamilyAbelProCustomBtn20,
            borderRadius: 0.0,
            onPressed: () {

              changeLanguage(selectedLang);

              final logic = Get.find<SettingLogic>();
              logic.getPref();
              Get.back();

            },
          )

        ],
      ),
    );
  }

  changeLanguage(String lang) async{
    switch (lang)  {
      case LocalLanguages.langChinese:
         Get.updateLocale(LocalizationService.fallbackLocale);
         await Preference().save(Const.prefLangName, LocalLanguages.langChinese);
         await Preference().save(Const.prefLanguage, Const.prefLangCodeChinese);
         dashboardController.callChangeLanguageApi();
         break;
      case LocalLanguages.langSimplified:
        Get.updateLocale(LocalizationService.simplifiedLocale);
        await Preference().save(Const.prefLangName, LocalLanguages.langSimplified);
        await Preference().save(Const.prefLanguage, Const.prefLangCodeSimplified);
        dashboardController.callChangeLanguageApi();
        break;
      case LocalLanguages.langEnglish:
        Get.updateLocale(LocalizationService.locale);
        await Preference().save(Const.prefLangName, LocalLanguages.langEnglish);
        await Preference().save(Const.prefLanguage, Const.prefLangCodeEnglish);
        dashboardController.callChangeLanguageApi();
        break;
      default:
        return null;
    }
  }
}