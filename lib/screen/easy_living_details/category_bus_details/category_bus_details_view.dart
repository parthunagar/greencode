import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
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

import 'category_bus_details_controller.dart';
import 'category_bus_details_model.dart';

class CategoryBusDetailsWidget extends GetView<CategoryBusDetailsController> {
  @override
  Widget build(BuildContext context) {
    final logic = Get.find<CategoryBusDetailsController>();
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    var featureList = [
      'https://picsum.photos/250?image=9',
      'https://picsum.photos/250?image=9',
      'https://picsum.photos/250?image=9',
      'https://picsum.photos/250?image=9',
    ];

    return Obx(() {
      return Scaffold(
        key: controller.scaffoldKeyBus,
        backgroundColor: cBackground,
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
          title: controller.easyLivingTitle.value,
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
        body: controller.isEasyLivingDetailsLoad.value == false
            ? Container()
            : controller.isDataLoad.value == true
                ? DataNotFoundWidget(title: 'data_not_found'.tr)
                : Stack(
                    children: [
                      SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: w * 0.04, horizontal: h * 0.013),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      controller
                                          .busDetailsData.value.stationName
                                          .toString(),
                                      textAlign: TextAlign.center,
                                      style: AppStyle
                                          .textStyleLabelColorBlackClubTitle18,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: h * 0.02,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: h * 0.24,
                                    width: w * 0.75,
                                    // alignment: Alignment.center,

                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                            color: cLightGrey,
                                            spreadRadius: 0.5,
                                            blurRadius: 2,
                                            offset: const Offset(0, 3),
                                          )
                                        ]),
                                    child: CachedNetworkImage(
                                      imageUrl: controller
                                          .busDetailsData.value.stationImage
                                          .toString(),
                                      // imageUrl: controller.clubMutableList
                                      //     .value[index].clubImage![0].clubImage,
                                      imageBuilder: (context, imageProvider) =>
                                          Container(
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10)),
                                          image: DecorationImage(
                                              image: imageProvider,
                                              fit: BoxFit.fill),
                                        ),
                                      ),
                                      // placeholder: (context, url) =>
                                      //     const CircularProgressIndicator(),
                                      errorWidget: (context, url, error) =>
                                          Container(
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              bottomLeft: Radius.circular(10)),
                                          // image: DecorationImage(
                                          //     image: AssetImage(Assets.placeHolderBanner),
                                          //     fit: BoxFit.fill),
                                        ),
                                        child: SvgPicture.asset(
                                          Assets.placeHolderBanner,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ),
                                  // Padding(
                                  //   padding: EdgeInsets.only(left: w * 0.017),
                                  //   child: Align(
                                  //     alignment: Alignment.centerRight,
                                  //     child: GestureDetector(
                                  //         onTap: () {
                                  //           controller.carouselController
                                  //               .nextPage();
                                  //         },
                                  //         child: SvgPicture.asset(Assets.next)),
                                  //   ),
                                  // ),
                                ],
                              ),
                              SizedBox(
                                height: h * 0.025,
                              ),
                              ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: controller.busDetailsData.value
                                    .categoryDetails!.length,
                                padding: EdgeInsets.only(bottom: h * 0.06),
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: w * 0.01,
                                        horizontal: h * 0.04),
                                    child: Card(
                                      color: cWhite,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: w * 0.03,
                                            horizontal: h * 0.022),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                SvgPicture.asset(
                                                    Assets.essentialOval),
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 8.0,
                                                            right: 8.0),
                                                    child: Text(
                                                      controller
                                                          .busDetailsData
                                                          .value
                                                          .categoryDetails![
                                                              index]
                                                          .title
                                                          .toString(),
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: AppStyle
                                                          .textStyleLabelColorBlackInfoList,
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  String.fromCharCodes(
                                                          Runes('\u0024')) +
                                                      " " +
                                                      controller
                                                          .busDetailsData
                                                          .value
                                                          .categoryDetails![
                                                              index]
                                                          .charges
                                                          .toString(),
                                                  style: AppStyle
                                                      .textStyleLabelColorLightGreyInfoList,
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: h * 0.022,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: w * 0.05),
                                              child: Align(
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  'interchange'.tr +
                                                      " : " +
                                                      controller
                                                          .busDetailsData
                                                          .value
                                                          .categoryDetails![
                                                              index]
                                                          .description
                                                          .toString(),
                                                  textAlign: TextAlign.start,
                                                  style: AppStyle
                                                      .textStyleLabelColorLightGreyFundList,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: h * 0.015,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: w * 0.05),
                                              child: Align(
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  'service_hours'.tr +
                                                      " :" +
                                                      controller
                                                          .busDetailsData
                                                          .value
                                                          .categoryDetails![
                                                              index]
                                                          .time
                                                          .toString(),
                                                  style: AppStyle
                                                      .textStyleLabelColorLightGreyFundList,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          decoration: BoxDecoration(
                            color: cBottomLayout,
                            border: Border(top: BorderSide(color: cDivider)),
                          ),
                          width: w,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      customDialogBottomSheet(context, 'visit_website'.tr,true,controller.linkList,(){
                                        Get.back();
                                      });
                                      // controller.launchUrl(controller
                                      //     .busDetailsData
                                      //     .value
                                      //     .categoryDetails![0]
                                      //     .webLink
                                      //     .toString());
                                    },
                                    child:
                                        SvgPicture.asset(Assets.browserIcon)),
                                GestureDetector(
                                    onTap: () {
                                      controller.launchUrl(controller
                                          .busDetailsData
                                          .value
                                          .categoryDetails![0]
                                          .locationLink
                                          .toString());
                                    },
                                    child:
                                        SvgPicture.asset(Assets.locationIcon)),
                                GestureDetector(
                                    onTap: () {
                                      customDialogBottomSheet(context, 'call_now'.tr,false,controller.phoneList,(){
                                        Get.back();
                                      });
                                      // customBottomSheet(
                                      //     context,
                                      //     controller.busDetailsData.value
                                      //         .categoryDetails![0].callUs
                                      //         .toString(), () {
                                      //   debugPrint('on tap launchUrl');
                                      //
                                      // });

                                      // controller.launchUrl('tel:${controller.mtrDetailsMutableList.value[0].stationList![0].categoryDetails![0].callUs.toString()}');
                                    },
                                    child: SvgPicture.asset(Assets.phoneIcon)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
      );
    });
  }
}
