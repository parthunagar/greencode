import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greencode/constant/app_constant.dart';
import 'package:greencode/constant/app_image.dart';
import 'package:greencode/constant/appstyle.dart';
import 'package:greencode/constant/colors.dart';
import 'package:get/get.dart';
import 'package:greencode/screen/change_password/change_password_logic.dart';
import 'package:greencode/widget/custom_appbar_text.dart';
import 'package:greencode/widget/custom_button.dart';
import 'package:greencode/widget/custom_drawer.dart';
import 'package:greencode/widget/text_form_field_output.dart';

class ChangePasswordPage extends GetView<ChangePasswordLogic> {
  const ChangePasswordPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    // final logic = Get.find<SettingLogic>();
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      key: controller.scaffoldKeyChangePassword,
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
                Get.back();
              },
              child: SvgPicture.asset(
                Assets.back,
              ),
            ),
          ),
        ),
        title: 'change_password'.tr,
        action: [
          Padding(
            padding: EdgeInsets.only(top: h * 0.05, right: 10.0),
            child: GestureDetector(
              child: SvgPicture.asset(Assets.menu),
              onTap: () {
                controller.openDrawer();
              },
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: w * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: h * 0.07),
                  Center(
                    child: Column(
                      children: [
                        SvgPicture.asset(Assets.icResetPasswordLogo),
                        SizedBox(height: h * 0.02),
                        Text('reset_password'.tr,style: AppStyle.textStyleLabelColorMediumGrey,)
                      ],
                    ),
                  ),
                  SizedBox(height: h * 0.07),
                  Row(
                    children: [
                      SvgPicture.asset(Assets.lock),
                      SizedBox(width: w * 0.02),
                      Text('enter_new_password'.tr,style: AppStyle.textStyleLabelColorMediumGrey,),
                    ],
                  ),
                  TextFormFieldOutput(
                      label: 'enter_new_password'.tr,
                      controller: controller.cNewPass,
                      textInputType: TextInputType.visiblePassword,
                    textCapitalization: TextCapitalization.none,),

                  SizedBox(height: h * 0.03),
                  Row(
                    children: [
                      SvgPicture.asset(Assets.lock),
                      SizedBox(width: w * 0.02),
                      Text('reconfirm_password'.tr,style: AppStyle.textStyleLabelColorMediumGrey,),
                    ],
                  ),
                  TextFormFieldOutput(
                      label: 'reconfirm_password'.tr,
                      controller: controller.cConPass,
                      textInputAction: TextInputAction.done,
                      textInputType: TextInputType.visiblePassword,
                    textCapitalization: TextCapitalization.none,),
                  SizedBox(height: h * 0.12),
                ],
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,

            children: [
              CustomButton(
                padding: EdgeInsets.symmetric(horizontal: w * 0.04),
                backgroundColor: cRed,
                title: 'confirm_new_password'.tr,
                onPressed: (){
                  if (controller.cNewPass.text.isEmpty) {
                    Const().toast('please_enter_new_password'.tr);
                  } else if (controller.cNewPass.text.length < 6 ) {
                    Const().toast('please_enter_new_valid_password'.tr);
                  }
                  else if(controller.cConPass.text.isEmpty){
                    Const().toast('please_enter_the_confirm_password'.tr);
                  }
                  else if (controller.cConPass.text.length < 6 ) {
                    Const().toast('confirm_Password_validation'.tr);
                  }
                  else if (controller.cNewPass.text.toString() != controller.cConPass.text.toString() ) {
                    Const().toast('password_same'.tr);
                  }
                  else {
                    controller.callChangePassword();
                  }
                },
              ),
              SizedBox(height: h * 0.02,)
            ],
          )
        ],
      ),
    );

  }
}
