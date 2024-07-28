import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:greencode/constant/app_constant.dart';
import 'package:greencode/constant/app_image.dart';
import 'package:greencode/constant/appstyle.dart';
import 'package:greencode/constant/colors.dart';
import 'package:greencode/screen/booking_details/booking_details_controller.dart';
import 'package:greencode/screen/booking_details/booking_details_model.dart';
import 'package:greencode/widget/customDialog.dart';
import 'package:greencode/widget/custom_appbar_text.dart';
import 'package:greencode/widget/custom_button.dart';
import 'package:greencode/widget/custom_drawer.dart';
import 'package:greencode/widget/data_not_found_widget.dart';
import 'package:greencode/widget/text_form_field_boooking.dart';
import 'package:intl/intl.dart';

class BookingDetailsWidget extends GetView<BookingDetailsController> {
  @override
  Widget build(BuildContext context) {
    final logic = Get.find<BookingDetailsController>();
    // final dashboardController = Get.find<DashboardController>();
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Scaffold(
      key: controller.scaffoldKeyBookingMain,
      // backgroundColor: cBackground,
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
        title: 'booking'.tr,
        action: [
          Padding(
            padding: EdgeInsets.only(top: h * 0.05, right: 10.0),
            child: GestureDetector(
              child: SvgPicture.asset(Assets.menu),
              onTap: () {
                controller.openDrawer();
                // controller.openDrawer();
              },
            ),
          )
        ],
      ),
      body: Obx(() {
        // debugPrint('controller.estateInfoMutableList.value.length  :${controller.estateInfoMutableList.value.length}');
        return controller.isBookingDetailsLoad.value
            ? DataNotFoundWidget(title: controller.message.value.toString())
            : controller.clubDetailsMutableDetails.value.isEmpty
                ? Container()
                : SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: w * 0.04, horizontal: h * 0.017),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  // controller.clubMutableList.value[index]
                                  //   .clubTitle,
                                  controller.clubDetailsMutableDetails.value[0]
                                      .clubTitle
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
                              Padding(
                                padding: EdgeInsets.only(right: w * 0.017),
                                child: GestureDetector(
                                    onTap: () {
                                      controller.carouselController
                                          .previousPage();
                                    },
                                    child: SvgPicture.asset(Assets.previous)),
                              ),
                              Expanded(
                                child: Container(
                                  height: h * 0.24,
                                  // width: w * 0.3,
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
                                  child: controller.clubDetailsMutableDetails
                                          .value[0].clubImageInfo!.isNotEmpty
                                      ? CarouselSlider(
                                          carouselController:
                                              controller.carouselController,
                                          // Give the controller
                                          options: CarouselOptions(
                                            autoPlay: false,
                                            viewportFraction: 1.0,
                                            // aspectRatio: h
                                          ),
                                          items: controller
                                              .clubDetailsMutableDetails
                                              .value[0]
                                              .clubImageInfo!
                                              .map((featuredImage) {
                                            return CachedNetworkImage(
                                              imageUrl:
                                                  featuredImage.clubImage!,
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
                                              // placeholder: (context, url) =>
                                              //     const CircularProgressIndicator(),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      Container(
                                                decoration: const BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  10),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  10)),
                                                  // image: DecorationImage(
                                                  //     image: AssetImage(Assets.placeHolderBanner),
                                                  //     fit: BoxFit.fill),
                                                ),
                                                child: SvgPicture.asset(
                                                  Assets.placeHolderBanner,
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            );
                                          }).toList(),
                                        )
                                      : Container(
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
                              Padding(
                                padding: EdgeInsets.only(left: w * 0.017),
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: GestureDetector(
                                      onTap: () {
                                        controller.carouselController
                                            .nextPage();
                                      },
                                      child: SvgPicture.asset(Assets.next)),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: h * 0.025,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        SvgPicture.asset(Assets.selectDate),
                                        SizedBox(
                                          width: w * 0.01,
                                        ),
                                        Text(
                                          'select_date'.tr,
                                          style: AppStyle
                                              .textStyleLabelColorGreyLight14,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: h * 0.01,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(right: w * 0.02),
                                      child: TextFormFieldBooking(
                                          readOnly: true,
                                          controller: controller.cDate,
                                          onTap: () {
                                            dialogSelectDate(
                                                context, 'select'.tr, () {
                                              debugPrint(
                                                  'controller.cDate ${controller.cDate.value}');
                                              // controller.cDate.text = DateFormat('dd/MM/yyyy').format(DateTime.parse(controller.cDate.text)).toString();
                                              controller.times.value.clear();
                                              controller.timesMainList.value
                                                  .clear();
                                              controller.selected = false;
                                              debugPrint(
                                                  'value is ${controller.clubDetailsMutableDetails.value[0].sectionTime}');
                                              if (controller
                                                      .clubDetailsMutableDetails
                                                      .value[0]
                                                      .sectionTime ==
                                                  1) {
                                                for (var i = 0;
                                                    i <
                                                        controller
                                                            .clubDetailsMutableDetails
                                                            .value[0]
                                                            .clubHours!
                                                            .length;
                                                    i++) {
                                                  if (controller.day.value ==
                                                      controller
                                                          .clubDetailsMutableDetails
                                                          .value[0]
                                                          .clubHours![i]
                                                          .days![0]) {
                                                    for (var j = 0;
                                                        j <
                                                            controller
                                                                .clubDetailsMutableDetails
                                                                .value[0]
                                                                .clubHours![i]
                                                                .time!
                                                                .length;
                                                        j++) {
                                                      // if (j == 0) {
                                                      //   controller.times.value.add(TimeModel(selected: false.obs, title: controller.clubDetailsMutableDetails.value[0].clubHours![i].time![j].obs,
                                                      //       maintanance:controller.clubDetailsMutableDetails.value[0].clubHours![i].maintenance![j].maintenance!.obs ));
                                                      // } else {
                                                      controller.times.value
                                                          .addAll({
                                                        TimeModel(
                                                            selected: false.obs,
                                                            title: controller
                                                                .clubDetailsMutableDetails
                                                                .value[0]
                                                                .clubHours![i]
                                                                .time![j]
                                                                .obs,
                                                            maintanance: controller
                                                                .clubDetailsMutableDetails
                                                                .value[0]
                                                                .clubHours![i]
                                                                .maintenance![j]
                                                                .maintenance!
                                                                .obs)
                                                      });
                                                      controller
                                                          .timesMainList.value
                                                          .addAll({
                                                        TimeModel(
                                                            selected: false.obs,
                                                            title: controller
                                                                .clubDetailsMutableDetails
                                                                .value[0]
                                                                .clubHours![i]
                                                                .time![j]
                                                                .obs,
                                                            maintanance: controller
                                                                .clubDetailsMutableDetails
                                                                .value[0]
                                                                .clubHours![i]
                                                                .maintenance![j]
                                                                .maintenance!
                                                                .obs)
                                                      });
                                                      // }
                                                      // var splitted = controller
                                                      //     .clubDetailsMutableDetails
                                                      //     .value[0]
                                                      //     .clubHours![i]
                                                      //     .time![j].split('-');
                                                      // var splittedMaintenance = controller
                                                      //     .clubDetailsMutableDetails
                                                      //     .value[0]
                                                      //     .clubHours![i]
                                                      //     .maintenance![j]
                                                      //     .maintenance;
                                                      // var splittedOne = splitted[0]
                                                      //     .split(":");
                                                      // var splittedTwo = splitted[1]
                                                      //     .split(":");
                                                      // debugPrint(
                                                      //     "end value is ${splittedTwo[0]}");
                                                      // if (int.parse(
                                                      //     splittedTwo[0]) ==
                                                      //     00) {
                                                      //   splittedTwo[0] = "24";
                                                      //   debugPrint(
                                                      //       "end value is ${splittedTwo[0]}");
                                                      // }
                                                      // var difference = int
                                                      //     .parse(
                                                      //     splittedTwo[0]) -
                                                      //     int.parse(
                                                      //         splittedOne[0]);
                                                      //
                                                      // debugPrint(
                                                      //     'timePeriod  $splitted - ${splittedOne[0]} - ${splittedTwo[0]} - $difference');
                                                      // int startTime = int.parse(
                                                      //     splittedOne[0]);
                                                      // for (int k = 0; k <
                                                      //     difference; k++) {
                                                      //   controller.timesMainList
                                                      //       .value.add(
                                                      //       TimeModel(
                                                      //           selected: controller
                                                      //               .selected
                                                      //               .obs,
                                                      //           title: '$startTime:00 - ${startTime +
                                                      //               1}:00'.obs,
                                                      //           maintanance: splittedMaintenance!
                                                      //               .obs));
                                                      //   controller.selected =
                                                      //   false;
                                                      //   startTime =
                                                      //       startTime + 1;
                                                      // }
                                                    }
                                                  }
                                                }
                                              } else {
                                                for (var i = 0;
                                                    i <
                                                        controller
                                                            .clubDetailsMutableDetails
                                                            .value[0]
                                                            .clubHours!
                                                            .length;
                                                    i++) {
                                                  debugPrint(
                                                      "the day is ${controller.day.value} and clubday is ${controller.clubDetailsMutableDetails.value[0].clubHours![i].days![0]}");
                                                  if (controller.day.value ==
                                                      controller
                                                          .clubDetailsMutableDetails
                                                          .value[0]
                                                          .clubHours![i]
                                                          .days![0]) {
                                                    for (var j = 0;
                                                        j <
                                                            controller
                                                                .clubDetailsMutableDetails
                                                                .value[0]
                                                                .clubHours![i]
                                                                .time!
                                                                .length;
                                                        j++) {
                                                      // if (j == 0) {
                                                      //   controller.times.value.add(TimeModel(selected: false.obs, title: controller.clubDetailsMutableDetails.value[0].clubHours![i].time![j].obs,
                                                      //       maintanance:controller.clubDetailsMutableDetails.value[0].clubHours![i].maintenance![j].maintenance!.obs ));
                                                      // } else {
                                                      controller.times.value
                                                          .addAll({
                                                        TimeModel(
                                                            selected: false.obs,
                                                            title: controller
                                                                .clubDetailsMutableDetails
                                                                .value[0]
                                                                .clubHours![i]
                                                                .time![j]
                                                                .obs,
                                                            maintanance: controller
                                                                .clubDetailsMutableDetails
                                                                .value[0]
                                                                .clubHours![i]
                                                                .maintenance![j]
                                                                .maintenance!
                                                                .obs)
                                                      });
                                                      // }
                                                      var splitted = controller
                                                          .clubDetailsMutableDetails
                                                          .value[0]
                                                          .clubHours![i]
                                                          .time![j]
                                                          .split('-');
                                                      var splittedMaintenance =
                                                          controller
                                                              .clubDetailsMutableDetails
                                                              .value[0]
                                                              .clubHours![i]
                                                              .maintenance![j]
                                                              .maintenance;
                                                      var splittedOne =
                                                          splitted[0]
                                                              .split(":");
                                                      var splittedTwo =
                                                          splitted[1]
                                                              .split(":");
                                                      debugPrint(
                                                          "end value is ${splittedTwo[0]}");
                                                      if (int.parse(
                                                              splittedTwo[0]) ==
                                                          00) {
                                                        splittedTwo[0] = "24";
                                                        debugPrint(
                                                            "end value is ${splittedTwo[0]}");
                                                      }
                                                      var difference = int
                                                              .parse(
                                                                  splittedTwo[
                                                                      0]) -
                                                          int.parse(
                                                              splittedOne[0]);

                                                      debugPrint(
                                                          'timePeriod  $splitted - ${splittedOne[0]} - ${splittedTwo[0]} - $difference');
                                                      int startTime = int.parse(
                                                          splittedOne[0]);
                                                      for (int k = 0;
                                                          k < difference;
                                                          k++) {
                                                        controller
                                                            .timesMainList.value
                                                            .add(TimeModel(
                                                                selected:
                                                                    controller
                                                                        .selected
                                                                        .obs,
                                                                title:
                                                                    '$startTime:00 - ${startTime + 1}:00'
                                                                        .obs,
                                                                maintanance:
                                                                    splittedMaintenance!
                                                                        .obs));
                                                        controller.selected =
                                                            false;
                                                        startTime =
                                                            startTime + 1;
                                                      }
                                                    }
                                                  }
                                                }
                                              }
                                              debugPrint(
                                                  'controller.times.value.isEmpty ${controller.times.value.isEmpty}');
                                              if (controller
                                                  .times.value.isEmpty) {
                                                controller.timeVisible.value =
                                                    true;
                                              } else {
                                                controller.timeVisible.value =
                                                    false;
                                              }
                                              // debugPrint(
                                              //     'value is ${controller.times.value[j].title}');
                                              Get.back();
                                              debugPrint(
                                                  'controller.date.value : ${controller.date.value}');
                                              controller.cDate.text = controller
                                                  .date.value
                                                  .toString();
                                              controller.cTime.text = '';
                                              controller.adultValue!.value = 0;
                                              controller.childrenValue!.value =
                                                  0;
                                              controller.babiesValue!.value = 0;
                                              debugPrint(
                                                  'controller.timeVisible.value ${controller.timeVisible.value}');
                                            });
                                          },
                                          // controller: controller.cPassword,
                                          textInputType: TextInputType.number),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: w * 0.01,
                              ),
                              controller.timeVisible.value == true
                                  ? SizedBox()
                                  : Expanded(
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              SizedBox(
                                                width: w * 0.01,
                                              ),
                                              SvgPicture.asset(
                                                  Assets.selectTime),
                                              SizedBox(
                                                width: w * 0.02,
                                              ),
                                              Text(
                                                'select_time'.tr,
                                                style: AppStyle
                                                    .textStyleLabelColorGreyLight14,
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: h * 0.01,
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.only(left: w * 0.02),
                                            child: TextFormFieldBooking(
                                                readOnly: true,
                                                controller: controller.cTime,
                                                onTap: () {
                                                  dialogSelectTime(
                                                    controller.timesMainList
                                                                .value.length >
                                                            3
                                                        ? h * 0.55
                                                        : h * 0.22,
                                                    context, //Get.context!,
                                                    Obx(() {
                                                      return ListView.separated(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                top: 10.0,
                                                                bottom: 10.0),
                                                        separatorBuilder:
                                                            (context, index) =>
                                                                const Divider(
                                                                    color: Colors
                                                                        .grey),
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        shrinkWrap: true,
                                                        itemCount: controller
                                                            .timesMainList
                                                            .value
                                                            .length,
                                                        itemBuilder:
                                                            (BuildContext
                                                                    context,
                                                                int index) {
                                                          return Obx(() {
                                                            return GestureDetector(
                                                              //highlightColor: Colors.red,
                                                              //splashColor: Colors.blueAccent,
                                                              onTap: controller
                                                                          .timesMainList
                                                                          .value[
                                                                              index]
                                                                          .maintanance
                                                                          .value ==
                                                                      1
                                                                  ? () {
                                                                      Const().toast(
                                                                          'club_maintanace_toast'
                                                                              .tr);
                                                                    }
                                                                  : () {
                                                                      controller
                                                                          .listIndex!
                                                                          .value = index;
                                                                      controller
                                                                          .timesMainList
                                                                          .value
                                                                          .forEach((element) => element
                                                                              .selected!
                                                                              .value = false);
                                                                      // if(controller.times.value[index].selected.value == true){
                                                                      //   controller.times.value[index].selected.value = false;
                                                                      // }
                                                                      // else {
                                                                      controller
                                                                          .timesMainList
                                                                          .value[
                                                                              index]
                                                                          .selected!
                                                                          .value = true;
                                                                      // }

                                                                      // controller.times.value[index].selected.value = !controller.times.value[index].selected.value;
                                                                    },
                                                              // child: CustomRow(controller.times[index]),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            8.0,
                                                                        right:
                                                                            8.0,
                                                                        top:
                                                                            8.0,
                                                                        bottom:
                                                                            3.0),
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: <
                                                                      Widget>[
                                                                    Text(
                                                                      controller
                                                                          .timesMainList
                                                                          .value[
                                                                              index]
                                                                          .title!
                                                                          .value
                                                                          .toString(),
                                                                      style: controller.timesMainList.value[index].maintanance.value == 1
                                                                          ? AppStyle
                                                                              .textStyleRobotoMediumGrey15
                                                                          : AppStyle
                                                                              .textStyleLabelColorBlackReservationTitle,
                                                                    ),
                                                                    controller.timesMainList.value[index].maintanance.value ==
                                                                            1
                                                                        ? Opacity(
                                                                            opacity:
                                                                                0.4,
                                                                            child:
                                                                                SvgPicture.asset(Assets.unSelected),
                                                                          )
                                                                        : controller.timesMainList.value[index].selected!.value
                                                                            ? SvgPicture.asset(Assets.selected)
                                                                            : SvgPicture.asset(Assets.unSelected)
                                                                  ],
                                                                ),
                                                              ),
                                                            );
                                                          });
                                                        },
                                                      );
                                                    }),
                                                    'select'.tr,
                                                    () {
                                                      Get.back();
                                                      if (controller
                                                              .timesMainList
                                                              .value[controller
                                                                  .listIndex!
                                                                  .value]
                                                              .selected ==
                                                          true) {
                                                        controller.cTime.text =
                                                            controller
                                                                .timesMainList
                                                                .value[controller
                                                                    .listIndex!
                                                                    .value]
                                                                .title
                                                                .toString();
                                                        for (var element
                                                            in controller
                                                                .timesMainList
                                                                .value) {
                                                          element.selected!
                                                              .value = false;
                                                        }
                                                        controller
                                                            .timesMainList
                                                            .value[controller
                                                                .listIndex!
                                                                .value]
                                                            .selected!
                                                            .value = true;
                                                        debugPrint(
                                                            'Selected Valus is 12 ${controller.timesMainList.value[controller.listIndex!.value].title}');
                                                        debugPrint(
                                                            'Selected Valus is 12 ${controller.timesMainList.value[controller.listIndex!.value].selected}');
                                                        debugPrint(
                                                            'Selected Valus is ${controller.listIndex!.value}');
                                                      }
                                                    },
                                                  );
                                                },
                                                // controller: controller.cPassword,
                                                textInputType:
                                                    TextInputType.number),
                                          )
                                        ],
                                      ),
                                    ),
                            ],
                          ),
                          SizedBox(
                            height: h * 0.02,
                          ),
                          controller.timeVisible.value == true
                              ? SizedBox()
                              : Container(
                                  // alignment: Alignment.centerLeft,
                                  width: w * 0.47,
                                  child: Column(
                                    // mainAxisAlignment: MainAxisAlignment.start,
                                    // crossAxisAlignment: CrossAxisAlignment.start,
                                    // mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                              Assets.myAccountHome),
                                          SizedBox(
                                            width: w * 0.02,
                                          ),
                                          Text(
                                            'select_pax'.tr,
                                            style: AppStyle
                                                .textStyleLabelColorGreyLight14,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: h * 0.01,
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.only(right: w * 0.01),
                                        child: TextFormFieldBooking(
                                            readOnly: true,
                                            label:
                                                controller.adultValue!.value
                                                        .toString() +
                                                    "-" +
                                                    controller
                                                        .childrenValue!.value
                                                        .toString() +
                                                    "-" +
                                                    controller
                                                        .babiesValue!.value
                                                        .toString(),
                                            onTap: () {
                                              dialogSelectPerson(
                                                context,
                                                'adult'.tr,
                                                // controller.adultValue!.value,
                                                'children'.tr,
                                                // controller.childrenValue!.value,
                                                'baby'.tr,
                                                'babyMain'.tr,
                                                // controller.babiesValue!.value,
                                                () {
                                                  if (controller
                                                          .adultValue!.value !=
                                                      0) {
                                                    controller
                                                        .adultValue!.value--;
                                                  }
                                                  debugPrint(
                                                      'controller.adultValue!.value : ${controller.adultValue!.value}');
                                                },
                                                () {
                                                  // if(controller.adultValue!.value != 0){
                                                  controller
                                                      .adultValue!.value++;
                                                  // }
                                                  debugPrint(
                                                      'controller.adultValue!.value : ${controller.adultValue!.value}');
                                                },
                                                () {
                                                  if (controller.childrenValue!
                                                          .value !=
                                                      0) {
                                                    controller
                                                        .childrenValue!.value--;
                                                  }
                                                  debugPrint(
                                                      'controller.childrenValue!.value : ${controller.childrenValue!.value}');
                                                },
                                                () {
                                                  controller
                                                      .childrenValue!.value++;
                                                  debugPrint(
                                                      'controller.childrenValue!.value : ${controller.childrenValue!.value}');
                                                },
                                                () {
                                                  if (controller
                                                          .babiesValue!.value !=
                                                      0) {
                                                    controller
                                                        .babiesValue!.value--;
                                                  }
                                                  debugPrint(
                                                      'controller.babiesValue!.value : ${controller.babiesValue!.value}');
                                                },
                                                () {
                                                  controller
                                                      .babiesValue!.value++;
                                                  debugPrint(
                                                      'controller.babiesValue!.value : ${controller.babiesValue!.value}');
                                                },
                                                'confirm'.tr,
                                                () {
                                                  Get.back();
                                                },
                                              );
                                            },

                                            // controller: controller.cPassword,
                                            textInputType:
                                                TextInputType.number),
                                      ),
                                    ],
                                  ),
                                ),
                          SizedBox(
                            height: h * 0.02,
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(Assets.usageDetails),
                              SizedBox(
                                width: w * 0.02,
                              ),
                              Text(
                                'usage_details'.tr,
                                style: AppStyle.textStyleLabelColorGreyLight14,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: h * 0.01,
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: ListView(
                                physics: const NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    alignment: Alignment.center,
                                    height: h * 0.05,
                                    decoration: BoxDecoration(
                                        border:
                                            Border.all(color: cLightGreyBorder),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(3),
                                          topRight: Radius.circular(3),
                                        )),
                                    child: Text(
                                      'per_session_topic'.tr,
                                      style:
                                          AppStyle.textStyleFamilyRobotoRegular,
                                    ),
                                  ),
                                  Table(
                                    defaultVerticalAlignment:
                                        TableCellVerticalAlignment.middle,
                                    children: controller.tableList.value,
                                    columnWidths: const {
                                      0: FlexColumnWidth(2),
                                      1: FlexColumnWidth(4),
                                      2: FlexColumnWidth(2)
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),

                          // Container(
                          //   child: Column(
                          //     children: [
                          //       Container(
                          //         width: double.infinity,
                          //         alignment: Alignment.center,
                          //         height: 50,
                          //         decoration: BoxDecoration(
                          //           border: Border.all(color:cLightGreyBorder),
                          //           borderRadius: const BorderRadius.only(
                          //             topRight: Radius.circular(10),
                          //             topLeft: Radius.circular(10)
                          //           ),
                          //         ),
                          //         child: Text('per_session_topic'.tr,
                          //         style: AppStyle.textStyleLabelColorBlackReservationTitle,),
                          //       ),
                          //       Table(
                          //         defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                          //         children: controller.tableList.value,
                          //         border: TableBorder(
                          //           verticalInside: BorderSide(color: cLightGreyBorder),
                          //           horizontalInside: BorderSide(color: cLightGreyBorder),
                          //           //borderRadius: BorderRadius.circular(20),
                          //           bottom: BorderSide(color: cLightGreyBorder),
                          //           top: BorderSide(color: cLightGreyBorder),
                          //           left: BorderSide(color: cLightGreyBorder),
                          //           right: BorderSide(color: cLightGreyBorder),
                          //         ),
                          //         columnWidths: const {
                          //           0 : FlexColumnWidth(2),
                          //           1: FlexColumnWidth(4),
                          //           2 : FlexColumnWidth(2)
                          //         },
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          SizedBox(
                            height: h * 0.02,
                          ),
                          controller.clubDetailsMutableDetails.value[0]
                              .description.toString().isEmpty
                              ? Container()
                              : Column(
                            children: [
                              SizedBox(
                                height: h * 0.015,
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  // controller.clubMutableList.value[index]
                                  //   .clubTitle,
                                  'description'.tr.toUpperCase(),
                                  textAlign: TextAlign.start,
                                  style: AppStyle
                                      .textStyleLabelColorGreyLight14,
                                ),
                              ),
                              SizedBox(
                                height: h * 0.02,
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  // controller.clubMutableList.value[index]
                                  //   .clubTitle,
                                  controller.clubDetailsMutableDetails
                                      .value[0].description
                                      .toString(),
                                  textAlign: TextAlign.start,
                                  style: AppStyle
                                      .textStyleLabelColorBlackInfoList,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: h * 0.025,
                          ),
                          CustomButton(
                            title: 'reserve'.tr,
                            onPressed: () {
                              if (controller.timeVisible.value) {
                                Const().toast('time_not_available'.tr);
                              } else if (controller.cTime.text
                                  .toString()
                                  .isEmpty) {
                                Const().toast('select_time_validation'.tr);
                              } else if (controller.adultValue!.value.toString() +
                                      "-" +
                                      controller.childrenValue!.value
                                          .toString() +
                                      "-" +
                                      controller.babiesValue!.value
                                          .toString() ==
                                  '0-0-0') {
                                Const().toast('select_person_validation'.tr);
                              } else if (controller.adultValue!.value
                                      .toString() ==
                                  "0") {
                                Const().toast('select_adult_validation'.tr);
                              } else {
                                debugPrint(
                                    "value is ${DateTime.parse(controller.dateValue.value)}");
                                final DateFormat formatter =
                                    DateFormat('yyyy-MM-dd');
                                final String formattedDate = formatter.format(
                                    DateTime.parse(controller.dateValue.value));
                                dialogCancel(
                                  context,
                                  'please_check_your_booking_info'.tr,
                                  'select_date_valid'.tr,
                                  formattedDate,
                                  'select_time_valid'.tr,
                                  controller.cTime.text.toString(),
                                  'select_pax_valid'.tr,
                                  controller.adultValue!.value.toString() +
                                      "-" +
                                      controller.childrenValue!.value
                                          .toString() +
                                      "-" +
                                      controller.babiesValue!.value.toString(),
                                  'cancel_dialog'.tr,
                                  'confirm'.tr,
                                  'please_pay'.tr +
                                      " " +
                                      formattedDate +
                                      " " +
                                      'please_confirm'.tr,
                                  () {
                                    Get.back();
                                  },
                                  () {
                                    Get.back();
                                    debugPrint(
                                        "value is ${controller.dateValueApi.value}");
                                    // final DateFormat formatterApi = DateFormat('dd-MM-yyyy');
                                    // final String formattedDateApi = formatterApi.format(
                                    //     DateTime.parse(controller.dateValueApi.value));
                                    controller.callClubBookingApi(
                                        controller.dateValueApi.value,
                                        controller.cTime.text.toString(),
                                        controller.adultValue!.value.toString(),
                                        controller.childrenValue!.value
                                            .toString(),
                                        controller.babiesValue!.value
                                            .toString());
                                  },
                                );
                              }
                            },
                          ),
                          // Container(
                          //   decoration: BoxDecoration(
                          //     color: cWhite,
                          //     borderRadius: BorderRadius.circular(10),
                          //     border: Border.all(color: Colors.black),
                          //
                          //   ),
                          //   child: Column(
                          //     mainAxisAlignment: MainAxisAlignment.center,
                          //     // mainAxisSize: MainAxisSize.max,
                          //     children: [
                          //       Container(
                          //           width: w,
                          //           decoration: BoxDecoration(
                          //             color: cWhite,
                          //             borderRadius: BorderRadius.only(
                          //                 topLeft: Radius.circular(10),
                          //                 topRight: Radius.circular(10)),
                          //             // border: Border.all(color: Colors.black),
                          //             // border: const Border(bottom: BorderSide( color: Colors.black)),
                          //
                          //           ),
                          //           child: Padding(
                          //             padding: EdgeInsets.symmetric(
                          //                 horizontal: w * 0.03, vertical: h * 0.02),
                          //             child: const Text('Per Session (Mon to Thur)',
                          //               textAlign: TextAlign.center,),
                          //           )),
                          //       Container(
                          //         width: w,
                          //         color: Colors.red[100],
                          //         child: Row(
                          //           mainAxisAlignment: MainAxisAlignment.start,
                          //           mainAxisSize: MainAxisSize.max,
                          //           children: [
                          //             Container(
                          //                 width: w * 0.2,
                          //                 padding: EdgeInsets.symmetric(vertical: h * 0.02),
                          //                 decoration: BoxDecoration(
                          //                     color: cWhite,
                          //                     border: const Border(
                          //                         top: BorderSide(color: Colors.black,),
                          //                         bottom: BorderSide(color: Colors.black),
                          //                         right: BorderSide(color: Colors.black,))),
                          //                 child: Text(
                          //                   'Day', overflow: TextOverflow.ellipsis,
                          //                   textAlign: TextAlign.center,)),
                          //             Container(
                          //                 padding: EdgeInsets.symmetric(vertical: h * 0.02),
                          //                 decoration: BoxDecoration(
                          //                   color: cWhite,
                          //                   border: const Border(
                          //                       top: BorderSide(color: Colors.black,),
                          //                       bottom: BorderSide(color: Colors.black,),
                          //                       right: BorderSide(color: Colors.black,)),
                          //                 ),
                          //                 child: Text(
                          //                   'Opening Hours', textAlign: TextAlign.center,)),
                          //             Container(
                          //               // width :w / 2.2,
                          //                 padding: EdgeInsets.symmetric(
                          //                   vertical: h * 0.02,), //horizontal: w * 0.088
                          //                 decoration: BoxDecoration(
                          //                   color: cWhite,
                          //                   border: const Border(
                          //                       top: BorderSide(color: Colors.black,),
                          //                       bottom: BorderSide(color: Colors.black)),
                          //
                          //                 ),
                          //                 child: Text(
                          //                   'Charge', overflow: TextOverflow.ellipsis,
                          //                   textAlign: TextAlign.center,)),
                          //
                          //
                          //           ],
                          //         ),
                          //       ),
                          //       Row(
                          //         mainAxisAlignment: MainAxisAlignment.center,
                          //         children: [
                          //           Expanded(
                          //             child: ListView.separated(
                          //                 shrinkWrap: true,
                          //                 itemCount: Const().bookingDetails.length,
                          //                 separatorBuilder: (context, index) {
                          //                   return Divider(color: Colors.red);
                          //                 },
                          //                 itemBuilder: (context, index) {
                          //                   return Padding(
                          //                     padding: EdgeInsets.fromLTRB(
                          //                         w * 0.04, h * 0.02, 0.0, h * 0.02),
                          //                     child: Text(
                          //                         Const().bookingDetails[index].toString(),
                          //                         textAlign: TextAlign.start),
                          //                   );
                          //                 }),
                          //           ),
                          //           Expanded(
                          //             child: ListView.builder(
                          //                 shrinkWrap: true,
                          //                 itemCount: 10,
                          //                 itemBuilder: (context, index) {
                          //                   return Text('第1節12:00 - 16:00',
                          //                       textAlign: TextAlign.center);
                          //                 }),
                          //           ),
                          //           Expanded(
                          //             child: ListView.builder(
                          //                 shrinkWrap: true,
                          //                 itemCount: 10,
                          //                 itemBuilder: (context, index) {
                          //                   return Text('\$400.00 (每節)',
                          //                       textAlign: TextAlign.center);
                          //                 }),
                          //           ),
                          //         ],
                          //       )
                          //
                          //     ],
                          //   ),
                          // )
                          // Row(
                          //   children: [
                          //     Expanded(
                          //       child: Column(
                          //         children: [
                          //           Row(
                          //             children: [
                          //               Column(
                          //                 children: [
                          //                   SvgPicture.asset(Assets.myAccountHome),
                          //                   Text(
                          //                     'select_pax'.tr,
                          //                     style: AppStyle.textStyleLabelColorGreyLight14,
                          //                   ),
                          //                 ],
                          //               ),
                          //               Column(
                          //                 children: [
                          //                   TextFormFieldBooking(
                          //                       // controller: controller.cPassword,
                          //                       textInputType: TextInputType.number),
                          //                 ],
                          //               ),
                          //             ],
                          //           ),
                          //         ],
                          //       ),
                          //     ),
                          //   ],
                          // )
                        ],
                      ),
                    ),
                  );
      }),
      endDrawer: CustomDrawer(),
    );
  }
}
