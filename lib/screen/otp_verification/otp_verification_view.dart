
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:greencode/app_route/app_route.dart';
import 'package:greencode/constant/app_constant.dart';
import 'package:greencode/constant/app_image.dart';
import 'package:greencode/constant/appstyle.dart';
import 'package:greencode/constant/colors.dart';
import 'package:greencode/screen/forgot_password/forgot_password_controller.dart';
import 'package:greencode/widget/custom_appbar.dart';
import 'package:greencode/widget/custom_button.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

import 'otp_verification_controller.dart';

class OtpVerificationWidget extends GetView<OtpVerificationController> {
  get otpFieldStyle => null;

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<OtpVerificationController>();
    final forgotPasswordLogic = Get.find<ForgotPasswordController>();

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
        imageCenter: Padding(
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
                height: h * 0.15,
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
                  Text(
                    'enter_verify_code'.tr,
                    textAlign: TextAlign.left,
                    style: AppStyle.textStyleLabelColorMediumGrey,
                  ),
                ],
              ),
              SizedBox(
                height: h * 0.02,
              ),
              OTPTextField(
                length: 6,
                width: MediaQuery.of(context).size.width,
                fieldWidth: w / 8,
                obscureText: false,
                  otpFieldStyle :  OtpFieldStyle(
                    backgroundColor: cWhite,
                    borderColor: cBackgroundFormField,
                    focusBorderColor: cBrown,
                    disabledBorderColor: cBackgroundFormField,
                    enabledBorderColor: cBackgroundFormField,
                    errorBorderColor: cBackgroundFormField
                  ),
                style: const TextStyle(fontSize: 17),
                textFieldAlignment: MainAxisAlignment.spaceEvenly,
                fieldStyle: FieldStyle.box,
                onCompleted: (pin) {
                  print("Completed: " + pin);
                  controller.cOtp.value = pin;
                },

              ),
              SizedBox(
                height: h * 0.07,
              ),
              CustomButton(
                title: 'confirm'.tr,
                onPressed: () async {
                  // RegExp regex = RegExp(Const.emailPattern);
                    controller.callOtpVerificationApi();
                },

              ),
              SizedBox(height: h * 0.15,),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: RichText(text: TextSpan(
                    children: [
                      TextSpan(text: 'otp_span1'.tr, style: AppStyle.textStyleLabelColorMediumGrey),
                      TextSpan(
                          recognizer: TapGestureRecognizer()..onTap = (){
                            forgotPasswordLogic.callForgotPasswordApi();
                          },
                          text: 'resend'.tr,  style: AppStyle.textStyleLoginUnderlineBrown)
                    ]
                )),
              )
              
            ],
          ),
        ),
      ),
    );
  }
}
