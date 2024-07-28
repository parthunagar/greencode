import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:greencode/constant/app_image.dart';
import 'package:greencode/constant/appstyle.dart';
import 'package:greencode/constant/colors.dart';
import 'package:greencode/screen/easy_living_details/category_mtr_details/category_mtr_details_controller.dart';
import 'package:greencode/widget/customDialog.dart';
import 'package:greencode/widget/custom_appbar_text.dart';
import 'package:greencode/widget/custom_drawer.dart';
import 'package:greencode/widget/data_not_found_widget.dart';

class CategoryMtrDetailsWidget extends GetView<CategoryMtrDetailsController> {
  @override
  Widget build(BuildContext context) {
    final logic = Get.find<CategoryMtrDetailsController>();
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Obx(() {
      return Scaffold(
        key: controller.scaffoldKeyMTR,
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
        body: Stack(
          children: [
            controller.isMtrDetailsLoad.value
                ? DataNotFoundWidget(title: 'data_not_found'.tr)
                : controller.mtrDetailsMutableList.value.isEmpty
                    ? Container()
                    : SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: w * 0.04, horizontal: h * 0.013),
                          child: Obx(() {
                            return Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        controller
                                            .mtrDetailsMutableList
                                            .value[0]
                                            .stationList![
                                                controller.isDefault!.value]
                                            .stationName
                                            .toString(),
                                        // controller.clubDetailsMutableDetails.value[0]
                                        //     .clubTitle
                                        //     .toString(),
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
                                    // controller.isPreviousVisible.value ?
                                    // Container()
                                    // :
                                    Opacity(
                                      opacity:
                                          controller.isPreviousVisible.value ==
                                                  true
                                              ? 0.0
                                              : 0.9,
                                      child: Padding(
                                        padding:
                                            EdgeInsets.only(right: w * 0.017),
                                        child: GestureDetector(
                                            onTap: () {
                                              controller.isPreviousVisible
                                                  .value = true;
                                              if (controller.isDefault!.value >
                                                  1) {
                                                controller.isDefault!.value--;
                                                controller.isNextVisible.value =
                                                    false;
                                                controller.isPreviousVisible
                                                    .value = false;
                                              } else if (controller
                                                      .isDefault!.value ==
                                                  1) {
                                                controller.isDefault!.value--;
                                                controller.isPreviousVisible
                                                    .value = true;
                                              } else {
                                                controller.isPreviousVisible
                                                    .value = true;
                                              }
                                              debugPrint(
                                                  "the default value is ${controller.isDefault!.value}");
                                            },
                                            child: SvgPicture.asset(
                                                Assets.previous)),
                                      ),
                                    ),
                                    Container(
                                      height: h * 0.24,
                                      width: w * 0.74,
                                      // alignment: Alignment.center,

                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                                            .mtrDetailsMutableList
                                            .value[0]
                                            .stationList![
                                                controller.isDefault!.value]
                                            .stationImage
                                            .toString(),
                                        // imageUrl: controller.clubMutableList
                                        //     .value[index].clubImage![0].clubImage,
                                        imageBuilder:
                                            (context, imageProvider) =>
                                                Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(10)),
                                            image: DecorationImage(
                                                image: imageProvider,
                                                fit: BoxFit.fill),
                                          ),
                                        ),
                                        errorWidget: (context, url, error) =>
                                            Container(
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(10),
                                                bottomLeft:
                                                    Radius.circular(10)),
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
                                    Opacity(
                                      opacity: ((controller.isDefault!.value >=
                                                  controller.totalLength.value -
                                                      1)
                                              ? controller.isNextVisible.value =
                                                  true
                                              : controller.isNextVisible.value =
                                                  false)
                                          ? 0.0
                                          : 0.9,
                                      child: Padding(
                                        padding:
                                            EdgeInsets.only(left: w * 0.017),
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          child: GestureDetector(
                                              onTap: () {
                                                controller.isNextVisible.value =
                                                    true;
                                                if (controller
                                                        .isDefault!.value <
                                                    controller
                                                            .totalLength.value -
                                                        1) {
                                                  controller.isDefault!.value++;
                                                  controller.isPreviousVisible
                                                      .value = false;
                                                  controller.isNextVisible
                                                      .value = false;
                                                } else {
                                                  controller.isNextVisible
                                                      .value = true;
                                                }

                                                debugPrint(
                                                    "the default value is ${controller.isDefault!.value}");

                                                debugPrint(
                                                    "the stationname is ${controller.mtrDetailsMutableList.value[0].stationList![controller.isDefault!.value].stationName.toString()}");

                                                // controller.carouselController
                                                //     .nextPage();
                                              },
                                              child: SvgPicture.asset(
                                                  Assets.next)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: h * 0.025,
                                ),
                                ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: controller
                                      .mtrDetailsMutableList
                                      .value[0]
                                      .stationList![controller.isDefault!.value]
                                      .categoryDetails!
                                      .length,
                                  padding: EdgeInsets.only(bottom: h * 0.06),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: w * 0.01,
                                          horizontal: h * 0.041),
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
                                                            .mtrDetailsMutableList
                                                            .value[0]
                                                            .stationList![
                                                                controller
                                                                    .isDefault!
                                                                    .value]
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
                                                    "\$ " +
                                                        controller
                                                            .mtrDetailsMutableList
                                                            .value[0]
                                                            .stationList![
                                                                controller
                                                                    .isDefault!
                                                                    .value]
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
                                                            .mtrDetailsMutableList
                                                            .value[0]
                                                            .stationList![
                                                                controller
                                                                    .isDefault!
                                                                    .value]
                                                            .categoryDetails![
                                                                index]
                                                            .description
                                                            .toString(),
                                                    textAlign: TextAlign.start,
                                                    style: AppStyle
                                                        .textStyleLabelColorLightGrey14,
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
                                                        " : " +
                                                        controller
                                                            .mtrDetailsMutableList
                                                            .value[0]
                                                            .stationList![
                                                                controller
                                                                    .isDefault!
                                                                    .value]
                                                            .categoryDetails![
                                                                index]
                                                            .time
                                                            .toString(),
                                                    style: AppStyle
                                                        .textStyleLabelColorLightGrey14,
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
                            );
                          }),
                        ),
                      ),
            controller.isMtrDetailsLoad.value
                ? Container()
                : Align(
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
                                  controller.launchUrl(controller
                                      .mtrDetailsMutableList
                                      .value[0]
                                      .stationList![0]
                                      .categoryDetails![0]
                                      .webLink
                                      .toString());
                                },
                                child: SvgPicture.asset(Assets.browserIcon)),
                            GestureDetector(
                                onTap: () {
                                  controller.launchUrl(controller
                                      .mtrDetailsMutableList
                                      .value[0]
                                      .stationList![0]
                                      .categoryDetails![0]
                                      .locationLink
                                      .toString());
                                },
                                child: SvgPicture.asset(Assets.locationIcon)),
                            GestureDetector(
                                onTap: () {
                                  customBottomSheet(
                                      context,
                                      controller
                                          .mtrDetailsMutableList
                                          .value[0]
                                          .stationList![0]
                                          .categoryDetails![0]
                                          .callUs
                                          .toString(), () {
                                    debugPrint('on tap launchUrl');
                                    Get.back();
                                    controller.launchUrl(
                                        'tel:${controller.mtrDetailsMutableList.value[0].stationList![0].categoryDetails![0].callUs.toString()}');
                                  });

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
