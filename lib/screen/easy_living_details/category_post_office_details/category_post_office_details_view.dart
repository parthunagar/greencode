import 'package:cached_network_image/cached_network_image.dart';
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

import 'category_post_office_details_contoller.dart';

class CategoryPostOfficeDetailsWidget
    extends GetView<CategoryPostOfficeDetailsController> {
  @override
  Widget build(BuildContext context) {
    final logic = Get.find<CategoryPostOfficeDetailsController>();
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Obx(() {
      return Scaffold(
        key: controller.scaffoldKeyPostOfficeDetails,
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
            controller.isPostOfficeData.value
                ? DataNotFoundWidget(title: 'data_not_found'.tr)
                : controller.postOfficeDetailsMutableList.value.isEmpty
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
                                            .postOfficeDetailsMutableList
                                            .value[0]
                                            .postOfficeList![
                                                controller.isDefault!.value]
                                            .stationName
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
                                    // controller.isPreviousVisible.value ?
                                    // Container()
                                    // :
                                    // Opacity(
                                    //   opacity:
                                    //       controller.isPreviousVisible.value ==
                                    //               true
                                    //           ? 0.0
                                    //           : 0.9,
                                    //   child: Padding(
                                    //     padding:
                                    //         EdgeInsets.only(right: w * 0.017),
                                    //     child: GestureDetector(
                                    //         onTap: () {
                                    //           controller.isPreviousVisible
                                    //               .value = true;
                                    //           if (controller.isDefault!.value >
                                    //               1) {
                                    //             controller.isDefault!.value--;
                                    //             controller.isNextVisible.value =
                                    //                 false;
                                    //             controller.isPreviousVisible
                                    //                 .value = false;
                                    //           } else if (controller
                                    //                   .isDefault!.value ==
                                    //               1) {
                                    //             controller.isDefault!.value--;
                                    //             controller.isPreviousVisible
                                    //                 .value = true;
                                    //           } else {
                                    //             controller.isPreviousVisible
                                    //                 .value = true;
                                    //           }
                                    //           debugPrint(
                                    //               "the default value is ${controller.isDefault!.value}");
                                    //         },
                                    //         child: SvgPicture.asset(
                                    //             Assets.previous)),
                                    //   ),
                                    // ),
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
                                            .postOfficeDetailsMutableList
                                            .value[0]
                                            .postOfficeList![
                                                controller.isDefault!.value]
                                            .stationImage
                                            .toString(),
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
                                    // Opacity(
                                    //   opacity: ((controller.isDefault!.value >=
                                    //               controller.totalLength.value -
                                    //                   1)
                                    //           ? controller.isNextVisible.value =
                                    //               true
                                    //           : controller.isNextVisible.value =
                                    //               false)
                                    //       ? 0.0
                                    //       : 0.9,
                                    //   child: Padding(
                                    //     padding:
                                    //         EdgeInsets.only(left: w * 0.017),
                                    //     child: Align(
                                    //       alignment: Alignment.centerRight,
                                    //       child: GestureDetector(
                                    //           onTap: () {
                                    //             controller.isNextVisible.value =
                                    //                 true;
                                    //             if (controller
                                    //                     .isDefault!.value <
                                    //                 controller
                                    //                         .totalLength.value -
                                    //                     1) {
                                    //               controller.isDefault!.value++;
                                    //               controller.isPreviousVisible
                                    //                   .value = false;
                                    //               controller.isNextVisible
                                    //                   .value = false;
                                    //             } else {
                                    //               controller.isNextVisible
                                    //                   .value = true;
                                    //             }
                                    //
                                    //             debugPrint(
                                    //                 "the default value is ${controller.isDefault!.value}");
                                    //
                                    //             // controller.carouselController
                                    //             //     .nextPage();
                                    //           },
                                    //           child: SvgPicture.asset(
                                    //               Assets.next)),
                                    //     ),
                                    //   ),
                                    // ),
                                  ],
                                ),
                                SizedBox(
                                  height: h * 0.018,
                                ),
                                controller
                                        .postOfficeDetailsMutableList
                                        .value[0]
                                        .postOfficeList![
                                            controller.isDefault!.value]
                                        .postOfficeDetails!
                                        .isEmpty
                                    ? const SizedBox()
                                    : Container(
                                        margin: const EdgeInsets.all(12),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: cLightGreyBorder),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        width: double.infinity,
                                        child: SizedBox(
                                          width: double.infinity,
                                          child: Column(
                                            children: [
                                              IntrinsicWidth(
                                                  child: SizedBox(
                                                      height: h * 0.06,
                                                      child: Center(
                                                          child: Text(
                                                        "service_hours".tr,
                                                        style: AppStyle
                                                            .textStyleLabelColorBlackReservationTitle,
                                                      )))),
                                              Divider(
                                                thickness: 1,
                                                color: cLightGreyBorder,
                                                height: 0,
                                              ),
                                              controller
                                                      .postOfficeDetailsMutableList
                                                      .value[0]
                                                      .postOfficeList![
                                                          controller
                                                              .isDefault!.value]
                                                      .postOfficeDetails!
                                                      .isEmpty
                                                  ? const SizedBox()
                                                  : SizedBox(
                                                      width: double.infinity,
                                                      child: DataTable(
                                                        headingRowHeight:
                                                            h * 0.05,
                                                        dataRowHeight: h * 0.05,
                                                        border: TableBorder.symmetric(
                                                            outside:
                                                                BorderSide.none,
                                                            inside: BorderSide(
                                                                color:
                                                                    cLightGreyBorder)),
                                                        columns: <DataColumn>[
                                                          DataColumn(
                                                            label: Flexible(
                                                              child: Center(
                                                                child: Text(
                                                                    controller
                                                                        .postOfficeDetailsMutableList
                                                                        .value[
                                                                            0]
                                                                        .postOfficeList![controller
                                                                            .isDefault!
                                                                            .value]
                                                                        .postOfficeDetails![
                                                                            0]
                                                                        .days
                                                                        .toString(),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: AppStyle
                                                                        .textStyleFamilyRobotoRegular
                                                                    // style: TextStyle(
                                                                    //     fontStyle: FontStyle.italic,
                                                                    //     fontWeight: FontWeight.normal),

                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                          DataColumn(
                                                            label: Flexible(
                                                              child: Center(
                                                                child: Text(
                                                                    controller
                                                                        .postOfficeDetailsMutableList
                                                                        .value[
                                                                            0]
                                                                        .postOfficeList![controller
                                                                            .isDefault!
                                                                            .value]
                                                                        .postOfficeDetails![
                                                                            0]
                                                                        .time
                                                                        .toString(),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: AppStyle
                                                                        .textStyleFamilyRobotoRegular),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                        rows: <DataRow>[
                                                          for (int i = 1;
                                                              i <
                                                                  controller
                                                                      .postOfficeDetailsMutableList
                                                                      .value[0]
                                                                      .postOfficeList![controller
                                                                          .isDefault!
                                                                          .value]
                                                                      .postOfficeDetails!
                                                                      .length;
                                                              i++)
                                                            DataRow(
                                                              cells: <DataCell>[
                                                                DataCell(Center(
                                                                  child: Text(
                                                                      controller
                                                                          .postOfficeDetailsMutableList
                                                                          .value[
                                                                              0]
                                                                          .postOfficeList![controller
                                                                              .isDefault!
                                                                              .value]
                                                                          .postOfficeDetails![
                                                                              i]
                                                                          .days
                                                                          .toString(),
                                                                      style: AppStyle
                                                                          .textStyleFamilyRobotoRegular),
                                                                )),
                                                                DataCell(Center(
                                                                    child: Text(
                                                                        controller
                                                                            .postOfficeDetailsMutableList
                                                                            .value[
                                                                                0]
                                                                            .postOfficeList![controller
                                                                                .isDefault!.value]
                                                                            .postOfficeDetails![
                                                                                i]
                                                                            .time
                                                                            .toString(),
                                                                        style: AppStyle
                                                                            .textStyleFamilyRobotoRegular))),
                                                              ],
                                                            ),
                                                        ],
                                                      ),
                                                    )
                                            ],
                                          ),
                                        ),
                                      ),
                                SizedBox(
                                  height: h * 0.05,
                                ),
                              ],
                            );
                          }),
                        ),
                      ),
            controller.isPostOfficeData.value
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
                                .postOfficeDetailsMutableList
                                .value[0]
                                .postOfficeList![0]
                                .postOfficeDetails![0]
                                .webLink
                                .toString());
                            // controller
                            //     .launchUrl("https://www.vpninfotech.com/");
                          },
                          child: SvgPicture.asset(Assets.browserIcon)),
                      GestureDetector(
                          onTap: () {
                            controller.launchUrl(controller
                                .postOfficeDetailsMutableList
                                .value[0]
                                .postOfficeList![0]
                                .postOfficeDetails![0]
                                .locationLink
                                .toString());
                            // controller
                            //     .launchUrl("https://www.vpninfotech.com/");
                          },
                          child: SvgPicture.asset(Assets.locationIcon)),
                      GestureDetector(
                          onTap: () {
                            customBottomSheet(
                                context,
                                // "5252525252",
                                controller
                                    .postOfficeDetailsMutableList
                                    .value[0]
                                    .postOfficeList![0]
                                    .postOfficeDetails![0]
                                    .callUs
                                    .toString(), () {
                              // debugPrint('on tap launchUrl');
                              Get.back();
                              controller.launchUrl(
                                  'tel:${controller.postOfficeDetailsMutableList.value[0].postOfficeList![0].postOfficeDetails![0].callUs.toString()}');
                            });

                            //
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
