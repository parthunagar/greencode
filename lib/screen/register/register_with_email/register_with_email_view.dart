import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:greencode/app_route/app_route.dart';
import 'package:greencode/constant/app_constant.dart';
import 'package:greencode/constant/app_image.dart';
import 'package:greencode/constant/appstyle.dart';
import 'package:greencode/constant/colors.dart';
import 'package:greencode/widget/custom_appbar.dart';
import 'package:greencode/widget/custom_button.dart';
import 'package:greencode/widget/text_form_field_output.dart';
import 'package:greencode/widget/text_input_filed.dart';

import 'register_with_email_controller.dart';

class RegisterWithEmailWidget extends GetView<RegisterWithEmailController> {
  @override
  Widget build(BuildContext context) {
    final logic = Get.find<RegisterWithEmailController>();
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: CustomAppBar(
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
                print("onBackPressed");
                Get.back();
              },
              child: SvgPicture.asset(
                Assets.back,
              ),
            ),
          ),
        ),
        imageCenter: Container(
          // color: Colors.red,
          padding: EdgeInsets.only(top: h * 0.03, right: w * 0.13),
          child: Image.asset(Assets.greenCodeTitle),
        ),

        // leading: Container(
        //   child: Image.asset(
        //     Assets.greenCodeTitleBg,
        //     fit: BoxFit.contain,
        //     width: w,
        //   ),
        //   color: cBrownTitle,
        //   width: w,
        // ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          child: Column(
            children: [
              SizedBox(
                height: h * 0.09,
                width: w,
              ),
              Text(
                'sign_up'.tr,
                style: AppStyle.textStyleLabelColorMediumBlack,
              ),
              SizedBox(
                height: h * 0.05,
                width: w,
              ),
              Row(
                children: [
                  Container(
                    color: cTransparent,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: SvgPicture.asset(
                        Assets.lock,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: getHorizontalSize(5),
                  ),
                  Text(
                    'pass_code'.tr,
                    textAlign: TextAlign.left,
                    style: AppStyle.textStyleLabelColorMediumGrey,
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormFieldOutput(
                  label: 'enter_verification_code'.tr,
                  controller: controller.cPassCode,
                  textInputType: TextInputType.visiblePassword,
                  textCapitalization: TextCapitalization.none,),
              ),
              SizedBox(
                height: h * 0.03,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: cTransparent,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 5.0),
                        child: SvgPicture.asset(
                          Assets.email,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: getHorizontalSize(5),
                  ),
                  Text(
                    'email_address'.tr.toUpperCase(),
                    textAlign: TextAlign.left,
                    style: AppStyle.textStyleLabelColorMediumGrey,
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormFieldOutput(
                  label: 'enter_email_forgot'.tr,
                  controller: controller.cEmail,
                  textInputType: TextInputType.emailAddress,
                  textCapitalization: TextCapitalization.none,),
              ),
              SizedBox(
                height: h * 0.04,
              ),
              Row(
                children: [
                  Container(
                    color: cTransparent,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: SvgPicture.asset(
                        Assets.lock,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: getHorizontalSize(5),
                  ),
                  Text(
                    'enter_new_password'.tr,
                    textAlign: TextAlign.left,
                    style: AppStyle.textStyleLabelColorMediumGrey,
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormFieldOutput(
                    label: 'enter_new_password'.tr,
                    controller: controller.cPassword,
                    textInputType: TextInputType.visiblePassword,
                  textCapitalization: TextCapitalization.none,),
              ),
              SizedBox(
                height: h * 0.04,
              ),
              Row(
                children: [
                  Container(
                    color: cTransparent,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: SvgPicture.asset(
                        Assets.lock,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: getHorizontalSize(5),
                  ),
                  Text(
                    'reconfirm_password'.tr,
                    textAlign: TextAlign.left,
                    style: AppStyle.textStyleLabelColorMediumGrey,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormFieldOutput(
                    label: 'enter_reconfirm_password'.tr,
                    controller: controller.cConfirmPassword,
                    textInputType: TextInputType.visiblePassword,
                  textCapitalization: TextCapitalization.none,),
              ),
              SizedBox(
                height: h * 0.05,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomButton(
                  title: 'sign_up'.tr,
                  onPressed: () async {
                    // RegExp regex = RegExp(Const.emailPattern);
                    // Get.toNamed(AppRoute.resetPasswordScreen);
                    if (controller.cPassCode!.text.isEmpty) {
                      Const().toast('enter_verification_code'.tr);
                    } else if (controller.cEmail!.text.isEmpty) {
                      Const().toast('enter_email'.tr);
                    } else if (controller.cPassword!.text.isEmpty) {
                      Const().toast('please_enter_new_password'.tr);
                    } else if (controller.cPassword!.text.length < 6) {
                      Const().toast('please_enter_new_valid_password'.tr);
                    } else if (controller.cConfirmPassword!.text.isEmpty) {
                      Const().toast('please_enter_reconfim_password'.tr);
                    } else if (controller.cConfirmPassword!.text.length < 6) {
                      Const().toast('please_enter_reconfirm_valid_password'.tr);
                    } else if (controller.cPassword!.text.trim() !=
                        controller.cConfirmPassword!.text.trim()) {
                      Const().toast("password_not_match".tr);
                    } else {
                      // Get.toNamed(AppRoute.dashboardScreen);
                      controller.callRegisterEmailApi();
                    }
                  },
                ),
              ),
              SizedBox(
                height: h * 0.07,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
