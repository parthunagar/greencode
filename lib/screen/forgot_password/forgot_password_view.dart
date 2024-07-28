
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:greencode/app_route/app_route.dart';
import 'package:greencode/constant/app_constant.dart';
import 'package:greencode/constant/app_image.dart';
import 'package:greencode/constant/appstyle.dart';
import 'package:greencode/widget/custom_appbar.dart';
import 'package:greencode/widget/custom_button.dart';
import 'package:greencode/widget/text_form_field_output.dart';

import 'forgot_password_controller.dart';

class ForgotPasswordWidget extends GetView<ForgotPasswordController> {
  @override
  Widget build(BuildContext context) {
    final logic = Get.find<ForgotPasswordController>();

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
                'forgot_password_title'.tr,
                style: AppStyle.textStyleLabelColorMediumBlack,
              ),
              SizedBox(
                height: h * 0.1,
                width: w,
              ),
              Row(
                children: [
                  Container(
                    child: SvgPicture.asset(
                      Assets.myAccountHome,
                    ),
                  ),
                  SizedBox(
                    width: getHorizontalSize(5),
                  ),
                  Text(
                    'resident_id_upper'.tr.toUpperCase(),
                    textAlign: TextAlign.left,
                    style: AppStyle.textStyleLabelColorMediumGrey,
                  ),
                ],
              ),
              SizedBox(
                height: h * 0.02,
              ),
              TextFormFieldOutput(
                label: 'enter_resident_id'.tr,
                controller: controller.cResidentId,
                textInputType: TextInputType.emailAddress,
                textCapitalization: TextCapitalization.none,),
              SizedBox(
                height: h * 0.04,
              ),
              Row(
                children: [
                  Container(
                    child: SvgPicture.asset(
                      Assets.email,
                    ),
                  ),
                  SizedBox(
                    width: getHorizontalSize(5),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text(
                      'email_address'.tr,
                      textAlign: TextAlign.left,
                      style: AppStyle.textStyleLabelColorMediumGrey,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: h * 0.02,
              ),
              TextFormFieldOutput(
                  label: 'enter_email_forgot'.tr,
                  controller: controller.cEmail,
                  textInputType: TextInputType.emailAddress,
                textCapitalization: TextCapitalization.none,),
              SizedBox(
                height: h * 0.07,
              ),
              CustomButton(
                title: 'send_new_pass_code'.tr,
                onPressed: () async {

                  RegExp regex = RegExp(Const.emailPattern);
                  if (controller.cResidentId!.text.isEmpty) {
                    Const().toast('enter_resident_id'.tr);
                  }else if (controller.cEmail!.text.isEmpty) {
                    Const().toast('enter_email'.tr);
                  } else {
                    controller.callForgotPasswordApi();
                   // Get.toNamed(AppRoute.otpVerificationScreen);
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
