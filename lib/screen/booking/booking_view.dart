import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:greencode/app_route/NavigationArgs.dart';
import 'package:greencode/app_route/app_route.dart';
import 'package:greencode/constant/app_constant.dart';
import 'package:greencode/constant/app_image.dart';
import 'package:greencode/constant/appstyle.dart';
import 'package:greencode/constant/colors.dart';
import 'package:greencode/screen/dashboard/dashboard_controller.dart';
import 'package:greencode/utils/preference.dart';
import 'package:greencode/widget/custom_appbar_text.dart';
import 'package:greencode/widget/custom_drawer.dart';
import 'package:greencode/widget/data_not_found_widget.dart';
import 'booking_controller.dart';

class BookingWidget extends GetView<BookingController> {
  @override
  Widget build(BuildContext context) {
    final logic = Get.find<BookingController>();
    final dashboardController = Get.find<DashboardController>();
    var h = MediaQuery
        .of(context)
        .size
        .height;
    var w = MediaQuery
        .of(context)
        .size
        .width;

    return Scaffold(
      appBar: CustomAppBarText(
        padding: EdgeInsets.zero,
        leading: Container(
          padding: EdgeInsets.only(top: h * 0.04),
          width: w * 0.15,
          height: h / 10,
          // color: Colors.white,
          alignment: Alignment.center,
        ),
        title: 'booking'.tr,
        action: [
          Padding(
            padding: EdgeInsets.only(top: h * 0.05, right: 10.0),
            child: GestureDetector(
              child: SvgPicture.asset(Assets.menu),
              onTap: () {
                dashboardController.openDrawer();
              },
            ),
          )
        ],
      ),
      backgroundColor: cBottomLayout,
      endDrawer: CustomDrawer(),
      body: Obx(() {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 15.0, right: 15.0),
              child: GestureDetector(
                onTap: () {

                  Get.toNamed(AppRoute.reservationRecordsScreen,
                      arguments: {
                        NavigationArgs.navigationTabBooking: Const
                            .thirdTabBooking,
                      });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: w * 0.028, vertical: h * 0.014),
                  decoration: BoxDecoration(
                    color: cWhite,
                    // controller.currantIndex.value == index
                    //     ? controller.background.value
                    //     : cWhite,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: cDivider,
                        spreadRadius: 2,
                        blurRadius: 1,
                        offset: const Offset(0, 1),
                      )
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: w * 0.09,
                          width: w * 0.09,
                          child: SvgPicture.asset(Assets.reservationRecord),
                        ),
                        SizedBox(width: w * 0.04),

                        Expanded(
                          child: Text('reservation_record'.tr,
                              maxLines: 1,
                              style:
                              AppStyle
                                  .textStyleLabelColorBlackReservationTitle,
                              textAlign: TextAlign.start),
                        ),

                        Text(
                          controller.clubMutableList.value.isEmpty
                              ? ''
                              : controller.countValue
                              .toString(),
                          style: AppStyle
                              .textStyleLabelColorLightGreyInfoList,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(width: w * 0.03),
                        SvgPicture.asset(Assets.rightArrow, color: cBrown
                          // controller.iconColor.value
                          //     ? cWhite
                          //     : cBrown,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),

            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: w * 0.045, vertical: h * 0.02),
                child: Obx(() {
                  // debugPrint('controller.estateInfoMutableList.value.length  :${controller.estateInfoMutableList.value.length}');
                  return controller.isBookingLoad.value == true
                      ? DataNotFoundWidget(title:controller.message.value.toString())
                      : GridView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 7,
                      crossAxisSpacing: 10,
                      childAspectRatio: 0.98
                    ),
                    itemCount: controller.clubMutableList.value.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () async {
                          await Preference().saveInt(Const.prefClubId,controller.clubMutableList.value[index].clubId);
                          debugPrint('Club id ${controller.clubMutableList.value[index].clubId}');
                          Get.toNamed(AppRoute.bookingDetailsScreen);
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: w / 2,
                              // decoration: BoxDecoration(
                              //   borderRadius: BorderRadius.circular(8),
                              child: Obx(() {
                                return CachedNetworkImage(
                                  height: h * 0.17,
                                  // imageUrl: index % 2 == 0 ? '' : 'https://picsum.photos/250?image=9',
                                  imageUrl:controller.clubMutableList
                                      .value[index].clubImageInfo!.isEmpty ?'':controller.clubMutableList
                                      .value[index].clubImageInfo![0].clubImage,
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(Radius.circular(10)
                                          ),
                                          image: DecorationImage(
                                              image: imageProvider,
                                              fit: BoxFit.cover),
                                          boxShadow: [
                                            BoxShadow(
                                              color: cDivider,
                                              spreadRadius: 2,
                                              blurRadius: 1,
                                              offset: const Offset(0, 3),
                                            )
                                          ],
                                        ),
                                      ),
                                  errorWidget: (context, url, error) =>
                                      Container(
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              bottomLeft: Radius.circular(10)
                                          ),
                                        ),
                                        child: SvgPicture.asset(
                                          Assets.placeHolderBanner,
                                          fit: BoxFit.fill,),
                                      ),

                                );
                              }),
                            ),
                            Expanded(
                              child: Center(
                                child: Text(controller.clubMutableList.value[index]
                                    .clubTitle,
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: AppStyle
                                      .textStyleLabelColorBlackClubTitle,),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  );
                }),
              ),
            ),
          ],
        );
      }),
    );
  }
}
