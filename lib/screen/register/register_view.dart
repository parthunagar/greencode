import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:greencode/app_route/app_route.dart';
import 'package:greencode/constant/app_constant.dart';
import 'package:greencode/constant/app_image.dart';
import 'package:greencode/constant/appstyle.dart';
import 'package:greencode/constant/colors.dart';
import 'package:greencode/utils/preference.dart';
import 'package:greencode/widget/customDialog.dart';
import 'package:greencode/widget/custom_button.dart';
import 'package:greencode/widget/localization_service.dart';
import 'package:greencode/widget/text_input_filed.dart';

import 'register_controller.dart';

class RegisterWidget extends GetView<RegisterController> {
  @override
  Widget build(BuildContext context) {
    final logic = Get.find<RegisterController>();
    var h = MediaQuery
        .of(context)
        .size
        .height;
    var w = MediaQuery
        .of(context)
        .size
        .width;

    return Scaffold(
      body: Obx(() {
        return SingleChildScrollView(
          child: Container(
            width: w,
            child: Stack(
              children: [
                Image.asset(
                  Assets.signInBg,
                  fit: BoxFit.cover,
                  width: w,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Column(
                    children: [
                      // Container (
                      //   height: 50.0,
                      //   child: DropdownButton(
                      //       items:  List.generate(3, (int index){
                      //         return DropdownMenuItem(
                      //             child: new Container(
                      //               padding: const EdgeInsets.only(bottom: 5.0),
                      //               height: 100.0,
                      //               child: Row(
                      //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //                 children: <Widget>[
                      //                   SvgPicture.asset(Assets.back),
                      //                   Text("Under 10")
                      //                 ],
                      //               ),
                      //         ));
                      //       })
                      //       , onChanged: null),),
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          width: w * 0.48,
                          alignment: Alignment.topRight,
                          margin: EdgeInsets.only(top: h * 0.09),
                          padding: EdgeInsets.only(left:  w * 0.07),
                          decoration: BoxDecoration(
                              color: cWhiteOpacity,

                              // border: Border.all(color: cBlack),
                              borderRadius: BorderRadius.circular(8)),
                          height: h * 0.05,

                          child: DropdownButton(
                            // alignment: AlignmentDirectional.centerStart,
                            iconEnabledColor: cBlue,
                            iconDisabledColor: cBlue,
                            isExpanded: true,
                            // isDense: true,-`
                            dropdownColor: cWhite,
                            value: controller.lngSelection!.value,
                            //'Traditional Chinese',
                            underline: Container(),
                            // focusColor: cWhite,
                            // isDense: true,
                            onChanged: (String? newValue) async {
                              debugPrint('newValue : $newValue');
                              controller.lngSelection!.value = newValue!;

                              if (controller.lngSelection!.value
                                  .toLowerCase() == LocalLanguages.langChinese) {
                                Get.updateLocale(
                                    LocalizationService.fallbackLocale);
                                await Preference().save(Const.prefLangName,
                                    LocalLanguages.langChinese);
                                await Preference().save(Const.prefLanguage,
                                    Const.prefLangCodeChinese);
                              } else if (controller.lngSelection!.value
                                  .toLowerCase() == LocalLanguages.langSimplified) {
                                Get.updateLocale(
                                    LocalizationService.simplifiedLocale);
                                await Preference().save(Const.prefLangName,
                                    LocalLanguages.langSimplified);
                                await Preference().save(Const.prefLanguage,
                                    Const.prefLangCodeSimplified);
                              } else {
                                Get.updateLocale(LocalizationService.locale);
                                await Preference().save(Const.prefLangName,
                                    LocalLanguages.langEnglish);
                                await Preference().save(Const.prefLanguage,
                                    Const.prefLangCodeEnglish);
                              }
                              // somehow set here selected 'value' above whith
                              // newValue
                              // via setState or reactive.
                            },
                            items: [
                              LocalLanguages.langChinese,
                              LocalLanguages.langSimplified,
                              LocalLanguages.langEnglish
                            ].map((String? value) {
                              return DropdownMenuItem(
                                value: value,
                                child: Row(
                                  // mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  // crossAxisAlignment,
                                  children: [
                                    // SvgPicture.asset(
                                    //   value == 'English'
                                    //       ? Assets.iconEngFlag
                                    //       : Assets.iconChineFlag,
                                    //   height: h * 0.02,
                                    // ),
                                    // SizedBox(
                                    //   width: w * 0.02,
                                    // ),
                                    Text(
                                      value.toString(),
                                      style:
                                      AppStyle.textStyleLabelColorBlack20,
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: h * 0.1,
                      ),
                      Image.asset(Assets.greenCode),
                      SizedBox(
                        height: h * 0.1,
                      ),
                      TextInputFindOut(
                          controller: controller.cResidentId,
                          label: 'resident_id'.tr,
                          textInputType: TextInputType.text,
                          textCapitalization: TextCapitalization.characters),
                      SizedBox(
                        height: h * 0.07,
                      ),
                      CustomButton(
                        title: 'sign_in'.tr.toUpperCase(),
                        onPressed: () async {
                          // Get.toNamed(AppRoute.registerEmailScreen);
                          if (controller.cResidentId!.text.isEmpty) {
                            Const().toast('enter_resident_id'.tr);
                          } else {
                            debugPrint('SAVE LOGIN DATA');
                            controller.callRegisterApi();
                          }
                        },
                      ),
                      SizedBox(
                        height: h * 0.15,
                      ),
                      GestureDetector(
                        onTap: () {
                          dialogForgotPassWord(
                            Get.context!,
                            'forgot_your_id'.tr,
                            'forgot_id_content'.tr,
                            // 'booking_cancel'.tr,
                            'confirm'.tr,
                            // 'back_dialog'.tr,
                                () {
                              Get.back();
                              // Const().toast(reservationClubListResponse.message);
                            },
                          );
                        },
                        child: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text: 'forgot_id'.tr,
                                  style: AppStyle.textStyleLoginUnderline),
                            ])),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
