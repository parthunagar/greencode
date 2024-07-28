
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
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

import 'sign_in_controller.dart';

class SignInWidget extends GetView<SignInController> {
  const SignInWidget({Key? key}) : super(key: key);


  Future<bool> _willPopCallback() async {
    // await showDialog or Show add banners or whatever
    // then
    Get.offAllNamed(AppRoute.registerScreen);
    return true; // return true if the route to be popped
  }


  @override
  Widget build(BuildContext context) {
    final logic = Get.find<SignInController>();
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;


    return WillPopScope(
      onWillPop: _willPopCallback,
      child: Scaffold(
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
                  Get.offAllNamed(AppRoute.registerScreen);
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
          child:
                Padding(
                  padding: const EdgeInsets.only(left: 15.0,right: 15.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: h * 0.15,
                        width: w,
                      ),
                      Text(
                        'sign_in'.tr,
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
                            'password_upper'.tr.toUpperCase(),
                            textAlign: TextAlign.left,
                            style: AppStyle.textStyleLabelColorMediumGrey,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: h * 0.012,
                      ),
                      TextFormFieldOutput(
                        label: 'password_upper'.tr,
                        controller: controller.cPassword,
                        textInputType: TextInputType.visiblePassword,
                        textCapitalization: TextCapitalization.none,),
                      SizedBox(
                        height: h * 0.07,
                      ),
                      CustomButton(
                        title: 'sign_in'.tr,
                        onPressed: () async {
                          RegExp regex = RegExp(Const.emailPattern);
                           if(controller.cPassword!.text.isEmpty) {
                            Const().toast('enter_password'.tr);
                          }
                          else if(controller.cPassword!.text.length < 6 ) {
                            Const().toast('valid_password'.tr);
                          }
                          else {
                            controller.callSignInApi();
                          }
                        },
                      ),
                      SizedBox(height: h * 0.15,),
                      GestureDetector(
                        onTap: (){
                          Get.toNamed(AppRoute.forgotPasswordScreen);
                        },
                        child: RichText(text: TextSpan(
                            children: [
                              TextSpan(
                                  text: 'forgot_password'.tr, style: AppStyle.textStyleLoginUnderlineBlack),
                            ]
                        )),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
