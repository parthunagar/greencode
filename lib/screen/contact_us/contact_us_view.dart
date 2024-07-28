import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:greencode/constant/app_image.dart';
import 'package:greencode/constant/appstyle.dart';
import 'package:greencode/constant/colors.dart';
import 'package:greencode/widget/customDialog.dart';
import 'package:greencode/widget/custom_appbar_text.dart';
import 'package:greencode/widget/custom_drawer.dart';
import 'package:greencode/widget/data_not_found_widget.dart';

import 'contact_us_controller.dart';

class ContactUsWidget extends GetView<ContactUsController> {

  GlobalKey<ScaffoldState> scaffoldKeyContactUs = GlobalKey<ScaffoldState>(debugLabel: 'scaffoldKeyContactUs');

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<ContactUsController>();

    
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;


    return Scaffold(
      key: scaffoldKeyContactUs,
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
        title: 'contact_us'.tr,
        action: [
          Padding(
            padding: EdgeInsets.only(top: h * 0.05, right: 10.0),
            child: GestureDetector(
              child: SvgPicture.asset(Assets.menu),
              onTap: () {
                // controller.openDrawer();
                scaffoldKeyContactUs.currentState?.openEndDrawer();
              },
            ),
          )
        ],
      ),
      body: Obx(() {
        // debugPrint('controller.estateInfoMutableList.value.length  :${controller.estateInfoMutableList.value.length}');
        return controller.contactMutableDetailsList.value.isEmpty
            ? Container()
            : controller.isContactDetailsLoad.value
            ? DataNotFoundWidget(title: controller.messageValue.value.toString())
            : SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: h * 0.03),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: w * 0.04),
                child: Text(
                  'green_code_management_title'.tr,
                  style: AppStyle.textStyleAbelProGrey17,),
              ),
              SizedBox(height: h * 0.02),
              GestureDetector(
                onTap: () {
                  customBottomSheet(context,
                      controller.contactMutableDetailsList.value[0]
                          .managementContactNumber.toString(),
                          () {
                        debugPrint('on tap launchUrl');
                        Get.back();
                        controller.launchUrl('tel:${controller.contactMutableDetailsList.value[0]
                            .managementContactNumber.toString()}');

                      });
                  // controller.launchUrl(
                  //     'tel:${}');
                },
                child: Container(
                  // color: Colors.red,
                  color: cWhite,
                  padding: EdgeInsets.symmetric(
                      vertical: h * 0.02, horizontal: w * 0.04),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            Assets.callDrawer, color: cBrown,),
                          SizedBox(width: w * 0.02,),
                          Expanded(
                            child: Text(
                              controller.contactMutableDetailsList.value[0]
                                  .managementContactNumber.toString(),
                              style: AppStyle.textStyleLabelColorBlack,),
                          ),
                          SvgPicture.asset(
                            Assets.rightArrow, color: cBrown,),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Divider(height: h * 0.003, color: cDivider,),
              // GestureDetector(
              //   onTap: () {
              //     controller.launchUrl(
              //         controller.contactMutableDetailsList.value[0]
              //             .managementLink.toString());
              //   },
              //   child: Container(
              //     // color: Colors.red,
              //     color: cWhite,
              //     padding: EdgeInsets.symmetric(
              //         vertical: h * 0.02, horizontal: w * 0.04),
              //     child: Column(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         Row(
              //           children: [
              //             SvgPicture.asset(
              //               Assets.browserContactUs, color: cBrown,),
              //             SizedBox(width: w * 0.02,),
              //             Expanded(
              //               child: Text(
              //                 controller.contactMutableDetailsList.value[0]
              //                     .managementLink.toString(),
              //                 style: AppStyle.textStyleLabelColorBlack,),
              //             ),
              //             SvgPicture.asset(
              //               Assets.rightArrow, color: cBrown,),
              //           ],
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              // Divider(height: h * 0.003, color: cDivider,),
              // SizedBox(height: h * 0.03),
              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: w * 0.04),
              //   child: Text(
              //     'app_technical_title'.tr,
              //     style: AppStyle.textStyleAbelProGrey17,),
              // ),
              // SizedBox(height: h * 0.02),
              // GestureDetector(
              //   onTap: () {
              //     customBottomSheet(context,
              //         controller.contactMutableDetailsList.value[0]
              //             .technicalContactNumber.toString(),
              //             () {
              //           debugPrint('on tap launchUrl');
              //           Get.back();
              //           controller.launchUrl('tel:${controller.contactMutableDetailsList.value[0]
              //               .technicalContactNumber.toString()}');
              //
              //         });
              //     // controller.launchUrl(
              //     //     'tel:${controller.contactMutableDetailsList.value[0]
              //     //         .technicalContactNumber.toString()}');
              //   },
              //   child: Container(
              //     // color: Colors.red,
              //     color: cWhite,
              //     padding: EdgeInsets.symmetric(
              //         vertical: h * 0.02, horizontal: w * 0.04),
              //     child: Column(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         Row(
              //           children: [
              //             SvgPicture.asset(
              //               Assets.callDrawer, color: cBrown,),
              //             SizedBox(width: w * 0.02,),
              //             Expanded(
              //               child: Text(
              //                 controller.contactMutableDetailsList.value[0]
              //                     .technicalContactNumber.toString(),
              //                 style: AppStyle.textStyleLabelColorBlack,),
              //             ),
              //             SvgPicture.asset(
              //               Assets.rightArrow, color: cBrown,),
              //           ],
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              // Divider(height: h * 0.003, color: cDivider,),
              GestureDetector(
                onTap: () {
                  controller.launchUrl('mailto:${controller.contactMutableDetailsList.value[0]
                          .technicalEmail.toString()}');
                },
                child: Container(
                  // color: Colors.red,
                  color: cWhite,
                  padding: EdgeInsets.symmetric(
                      vertical: h * 0.02, horizontal: w * 0.04),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            Assets.emailContactUs, color: cBrown,),
                          SizedBox(width: w * 0.02,),
                          Expanded(
                            child: Text(
                              controller.contactMutableDetailsList.value[0]
                                  .technicalEmail.toString(),
                              style: AppStyle.textStyleLabelColorBlack,),
                          ),
                          SvgPicture.asset(
                            Assets.rightArrow, color: cBrown,),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Divider(height: h * 0.003, color: cDivider,),
              GestureDetector(
                onTap: () {
                  controller.launchUrl(
                      controller.contactMutableDetailsList.value[0].webLink
                          .toString());
                },
                child: Container(
                  // color: Colors.red,
                  color: cWhite,
                  padding: EdgeInsets.symmetric(
                      vertical: h * 0.02, horizontal: w * 0.04),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            Assets.browserContactUs, color: cBrown,),
                          SizedBox(width: w * 0.02,),
                          Expanded(
                            child: Text(
                              controller.contactMutableDetailsList.value[0]
                                  .webLink.toString(),
                              style: AppStyle.textStyleLabelColorBlack,),
                          ),
                          SvgPicture.asset(
                            Assets.rightArrow, color: cBrown,),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              // Divider(height: h * 0.003, color: cDivider,),
              // GestureDetector(
              //   onTap: () {
              //     controller.launchUrl(
              //         controller.contactMutableDetailsList.value[0].locationLink
              //             .toString());
              //   },
              //   child: Container(
              //     // color: Colors.red,
              //     color: cWhite,
              //     padding: EdgeInsets.symmetric(
              //         vertical: h * 0.02, horizontal: w * 0.04),
              //     child: Column(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         Row(
              //           children: [
              //             SvgPicture.asset(
              //               Assets.locationContactUs, color: cBrown,),
              //             SizedBox(width: w * 0.03,),
              //             Expanded(
              //               child: Text(
              //                 controller.contactMutableDetailsList.value[0]
              //                     .technicalLocation.toString(),
              //                 style: AppStyle.textStyleLabelColorBlack,),
              //             ),
              //             SvgPicture.asset(
              //               Assets.rightArrow, color: cBrown,),
              //           ],
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              Divider(height: h * 0.003, color: cDivider,),
            ],
          ),
        );
      }
    ),
    );
  }
}
