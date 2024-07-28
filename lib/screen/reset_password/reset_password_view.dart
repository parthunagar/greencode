
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:greencode/constant/app_constant.dart';
import 'package:greencode/constant/app_image.dart';
import 'package:greencode/constant/appstyle.dart';
import 'package:greencode/constant/colors.dart';
import 'package:greencode/widget/custom_appbar.dart';
import 'package:greencode/widget/custom_button.dart';
import 'package:greencode/widget/text_form_field_output.dart';

import 'reset_password_controller.dart';


class ResetPasswordWidget extends GetView<ResetPasswordController> {
  @override
  Widget build(BuildContext context) {
    final logic = Get.find<ResetPasswordController>();
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
              onTap: (){
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
          padding: EdgeInsets.only(top: h * 0.03,right: w * 0.13),
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
                height: h * 0.12,
                width: w,
              ),
              Text(
                'reset_password'.tr,
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
                    child: SvgPicture.asset(
                      Assets.lock,
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
              SizedBox(
                height: h * 0.012,
              ),
              TextFormFieldOutput(
                  label: 'enter_new_password'.tr,
                  controller: controller.cPassword,
                  textInputType: TextInputType.visiblePassword,
                textCapitalization: TextCapitalization.none,),
              SizedBox(
                height: h * 0.04,
              ),
              Row(
                children: [
                  Container(
                    color: cTransparent,
                    child: SvgPicture.asset(
                      Assets.lock,
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
              SizedBox(
                height: h * 0.012,
              ),
              TextFormFieldOutput(
                  label: 'enter_reconfirm_password'.tr,
                  controller: controller.cConfirmPassword,
                  textInputType: TextInputType.visiblePassword,
                  textCapitalization: TextCapitalization.none,),
              SizedBox(
                height: h * 0.07,
              ),
              CustomButton(
                backgroundColor: cRed,
                title: 'confirm'.tr,
                onPressed: () async {
                  RegExp regex = RegExp(Const.emailPattern);
                  if (controller.cPassword!.text.isEmpty) {
                    Const().toast('please_enter_new_password'.tr);
                  } else if (controller.cPassword!.text.length < 6 ) {
                    Const().toast('please_enter_new_valid_password'.tr);
                  }else if (controller.cConfirmPassword!.text.isEmpty) {
                    Const().toast('please_enter_reconfim_password'.tr);
                  } else if (controller.cConfirmPassword!.text.length < 6 ) {
                    Const().toast('please_enter_reconfirm_valid_password'.tr);
                  } else if(controller.cPassword!.text.trim() != controller.cConfirmPassword!.text.trim()){
                    Const().toast("password_not_match".tr);
                  }else {
                    controller.callResetPasswordApi();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
