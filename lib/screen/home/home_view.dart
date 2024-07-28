import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:greencode/app_route/app_route.dart';
import 'package:greencode/constant/app_constant.dart';
import 'package:greencode/constant/app_image.dart';
import 'package:greencode/constant/appstyle.dart';
import 'package:greencode/constant/colors.dart';
import 'package:greencode/screen/dashboard/dashboard_controller.dart';
import 'package:greencode/utils/preference.dart';
import 'package:greencode/widget/custom_appbar.dart';

import 'home_controller.dart';

class HomeWidget extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    // final logic = Get.find<HomeController>();
    final dashboardController = Get.find<DashboardController>();

    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: cBottomLayout,
      appBar: CustomAppBar(
        padding: EdgeInsets.zero,
        leading: Container(
          padding: EdgeInsets.only(top: h * 0.04),
          width: w * 0.15,
          height: h / 10,
          // color: Colors.white,
          alignment: Alignment.center,
          // child: Center(
          //   child: SvgPicture.asset(
          //     Assets.back,
          //   ),
          // ),
        ),
        imageCenter: Container(
          // color: Colors.red,
          padding: EdgeInsets.only(top: h * 0.03, right: w * 0.05),
          child: Image.asset(Assets.greenCodeTitle),
        ),
        action: [
          Padding(
            padding: EdgeInsets.only(top: h * 0.05, right: 10.0),
            child: GestureDetector(
              child: SvgPicture.asset(Assets.menu),
              onTap: () async {
                dashboardController.openDrawer();
              },
            ),
          )
        ],
      ),
      body: Obx(() {
        return SingleChildScrollView(
          child: Container(
            width: w,
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: w * 0.02,
                        height: h * 0.02,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          controller.background.value = cBlue;
                          controller.iconColor.value = cWhite;
                          controller.changeBg.value = true;
                          // Navigator.pushReplacementNamed(context, (AppRoute.estateInfoListScreen));
                          Get.toNamed(AppRoute.estateInfoListScreen);

                          Future.delayed(const Duration(milliseconds: 500), () {
                            controller.background.value = cWhite;
                            controller.iconColor.value = cBrown;
                            controller.changeBg.value = false;
                          });
                        },
                        child: Container(
                          width: w * 0.27,
                          height: h * 0.125,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            color: controller.changeBg.value == true
                                ? controller.background.value
                                : cWhite,
                            boxShadow: [
                              BoxShadow(
                                color: cDivider,
                                spreadRadius: 2,
                                blurRadius: 1,
                                offset: const Offset(0, 3),
                              )
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SvgPicture.asset(
                                Assets.estateInfoHome,
                                color: controller.changeBg.value == true
                                    ? controller.iconColor.value
                                    : cBrown,
                              ),
                              Text("estate_info_home".tr,
                                  style: controller.changeBg.value == true
                                      ? AppStyle.textStyleLabelColorWhiteHome
                                      : AppStyle.textStyleLabelColorBlackHome),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.backgroundBooking.value = cBlue;
                          controller.iconColorBooking.value = cWhite;
                          controller.changeBgBooking.value = true;

                          Future.delayed(const Duration(milliseconds: 500), () {
                            controller.backgroundBooking.value = cWhite;
                            controller.iconColorBooking.value = cBrown;
                            dashboardController
                                .changeTabIndex(Const.thirdTabBooking);
                            controller.changeBgBooking.value = false;
                          });
                        },
                        child: Container(
                          width: w * 0.27,
                          height: h * 0.125,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: controller.changeBgBooking.value == true
                                ? controller.backgroundBooking.value
                                : cWhite,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(
                                color: cDivider,
                                spreadRadius: 2,
                                blurRadius: 1,
                                offset: const Offset(0, 3),
                              )
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SvgPicture.asset(
                                Assets.bookingHome,
                                color: controller.changeBgBooking.value == true
                                    ? controller.iconColorBooking.value
                                    : cBrown,
                              ),
                              Text("booking_home".tr,
                                  style: controller.changeBgBooking.value ==
                                          true
                                      ? AppStyle.textStyleLabelColorWhiteHome
                                      : AppStyle.textStyleLabelColorBlackHome),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.backgroundEasyLiving.value = cBlue;
                          controller.iconColorEasyLiving.value = cWhite;
                          controller.changeBgEasyLiving.value = true;
                          // Navigator.pushReplacementNamed(context, (AppRoute.estateInfoListScreen));
                          Get.toNamed(AppRoute.easyLivingInfo);

                          Future.delayed(const Duration(milliseconds: 500), () {
                            controller.backgroundEasyLiving.value = cWhite;
                            controller.iconColorEasyLiving.value = cBrown;
                            controller.changeBgEasyLiving.value = false;
                          });
                        },
                        child: Container(
                          width: w * 0.27,
                          height: h * 0.125,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: controller.changeBgEasyLiving.value == true
                                ? controller.backgroundEasyLiving.value
                                : cWhite,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(
                                color: cDivider,
                                spreadRadius: 2,
                                blurRadius: 1,
                                offset: const Offset(0, 3),
                              )
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SvgPicture.asset(
                                Assets.easyLivingHome,
                                color:
                                    controller.changeBgEasyLiving.value == true
                                        ? controller.iconColorEasyLiving.value
                                        : cBrown,
                              ),
                              Text("easy_living_home".tr,
                                  style: controller.changeBgEasyLiving.value ==
                                          true
                                      ? AppStyle.textStyleLabelColorWhiteHome
                                      : AppStyle.textStyleLabelColorBlackHome),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: w * 0.02,
                        height: h * 0.03,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          controller.backgroundMyAccount.value = cBlue;
                          controller.iconColorMyAccount.value = cWhite;
                          controller.changeBgMyAccount.value = true;
                          // Navigator.pushReplacementNamed(context, (AppRoute.estateInfoListScreen));

                          Get.toNamed(AppRoute.settingScreen);

                          Future.delayed(const Duration(milliseconds: 1000),
                              () {
                            controller.backgroundMyAccount.value = cWhite;
                            controller.iconColorMyAccount.value = cBrown;
                            controller.changeBgMyAccount.value = false;
                          });
                          // Get.toNamed(AppRoute.settingScreen);
                        },
                        child: Container(
                          width: w * 0.27,
                          height: h * 0.125,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: controller.changeBgMyAccount.value == true
                                ? controller.backgroundMyAccount.value
                                : cWhite,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(
                                color: cDivider,
                                spreadRadius: 2,
                                blurRadius: 1,
                                offset: const Offset(0, 3),
                              )
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SvgPicture.asset(
                                Assets.myAccountHome,
                                color:
                                    controller.changeBgMyAccount.value == true
                                        ? controller.iconColorMyAccount.value
                                        : cBrown,
                              ),
                              Text("my_account_home".tr,
                                  style: controller.changeBgMyAccount.value ==
                                          true
                                      ? AppStyle.textStyleLabelColorWhiteHome
                                      : AppStyle.textStyleLabelColorBlackHome),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          //TODO : M9
                          controller.backgroundEResidenceCard.value = cBlue;
                          controller.iconColorEResidenceCard.value = cWhite;
                          controller.changeBgEResidenceCard.value = true;
                          // Navigator.pushReplacementNamed(context, (AppRoute.estateInfoListScreen));

                          Get.toNamed(AppRoute.eResidentCardScreen);

                          Future.delayed(const Duration(milliseconds: 1000),
                              () {
                            controller.backgroundEResidenceCard.value = cWhite;
                            controller.iconColorEResidenceCard.value = cBrown;
                            controller.changeBgEResidenceCard.value = false;
                          });
                        },
                        child: Container(
                          width: w * 0.27,
                          height: h * 0.125,
                          // padding:  EdgeInsets.symmetric(horizontal: 10,vertical: h * 0.01),
                          padding: EdgeInsets.only(
                              left: 10,
                              right: 10,
                              top: h * 0.012,
                              bottom: h * 0.005),
                          decoration: BoxDecoration(
                            color:
                                controller.changeBgEResidenceCard.value == true
                                    ? controller.backgroundEResidenceCard.value
                                    : cWhite,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(
                                color: cDivider,
                                spreadRadius: 2,
                                blurRadius: 1,
                                offset: const Offset(0, 3),
                              )
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                  // height: h * 0.07,
                                  child: SvgPicture.asset(
                                Assets.eResidentCardHome,
                                fit: BoxFit.contain,
                                color: controller
                                            .changeBgEResidenceCard.value ==
                                        true
                                    ? controller.iconColorEResidenceCard.value
                                    : cBrown,
                              )),
                              // SizedBox(height: h * 0.01,),
                              Text("e_resident_card_home".tr,
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  style: controller
                                              .changeBgEResidenceCard.value ==
                                          true
                                      ? AppStyle.textStyleLabelColorWhiteHome16
                                      : AppStyle
                                          .textStyleLabelColorBlackHome16),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.backgroundNotification.value = cBlue;
                          controller.iconColorNotification.value = cWhite;
                          controller.changeBgMyNotification.value = true;

                          Future.delayed(const Duration(milliseconds: 500), () {
                            controller.backgroundNotification.value = cWhite;
                            controller.iconColorNotification.value = cBrown;
                            dashboardController
                                .changeTabIndex(Const.fourthTabNotification);
                            controller.changeBgMyNotification.value = false;
                          });
                        },
                        child: Container(
                          width: w * 0.27,
                          height: h * 0.125,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color:
                                controller.changeBgMyNotification.value == true
                                    ? controller.backgroundNotification.value
                                    : cWhite,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(
                                color: cDivider,
                                spreadRadius: 2,
                                blurRadius: 1,
                                offset: const Offset(0, 3),
                              )
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SvgPicture.asset(
                                Assets.notificationHome,
                                color:
                                    controller.changeBgMyNotification.value ==
                                            true
                                        ? controller.iconColorNotification.value
                                        : cBrown,
                              ),
                              Text("notification_home".tr,
                                  style: controller
                                              .changeBgMyNotification.value ==
                                          true
                                      ? AppStyle.textStyleLabelColorWhiteHome
                                      : AppStyle.textStyleLabelColorBlackHome),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: w * 0.02,
                        height: h * 0.03,
                      )
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      if (controller.languageKey.value == "en") {
                        controller
                            .launchUrl("https://www.hko.gov.hk/en/index.html");
                      } else if (controller.languageKey.value == "tc") {
                        controller
                            .launchUrl("https://www.hko.gov.hk/tc/index.html");
                      } else {
                        controller
                            .launchUrl("https://www.hko.gov.hk/sc/index.html");
                      }
                    },
                    child: Container(
                      width: w,
                      height: h * 0.11,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: cDarkBlue,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                              //offset: Offset(0, 4),
                              color: cBlack,
                              blurRadius: 0,
                              offset: const Offset(0.0, 0.0),
                              blurStyle: BlurStyle.outer),
                        ],
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 5.0, bottom: 5.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  children: [
                                    Text('observatory_home'.tr,
                                        textAlign: TextAlign.left,
                                        style: AppStyle
                                            .textStyleLabelColorTitleWhite),
                                  ],
                                ),
                                Obx(() {
                                  return Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        // color: Colors.red[100],
                                        height: h * 0.03,
                                        child: SvgPicture.asset(
                                          Assets.downArrowIcon,
                                          color: cWhite,
                                          width: w * 0.04,
                                          fit: BoxFit.fitHeight,
                                        ),
                                      ),
                                      // Icon((Icons.arrow_downward),color: cWhite,),
                                      SizedBox(
                                        width: w * 0.015,
                                      ),
                                      Text(
                                          controller.minTemp.value.toString() +
                                              "°C",
                                          style: AppStyle
                                              .textStyleLabelColorTitleWhiteBold20),
                                      SizedBox(
                                        width: w * 0.02,
                                      ),
                                      // SvgPicture.asset(
                                      //   Assets.upArrowIcon,
                                      //   width: w * 0.04,
                                      //   color: cWhite,
                                      // ),
                                      Container(
                                        // color: Colors.red[100],
                                        height: h * 0.03,
                                        child: SvgPicture.asset(
                                          Assets.upArrowIcon,
                                          color: cWhite,
                                          width: w * 0.04,
                                          fit: BoxFit.fitHeight,
                                        ),
                                      ),
                                      SizedBox(
                                        width: w * 0.015,
                                      ),
                                      Text(
                                          controller.maxTemp.value.toString() +
                                              "°C",
                                          style: AppStyle
                                              .textStyleLabelColorTitleWhiteBold20),
                                      SizedBox(
                                        width: w * 0.001,
                                      ),

                                      // SvgPicture.asset(
                                      //   Assets.questionMark,
                                      //   color: cWhite,
                                      // ),
                                      Container(
                                        height: h * 0.033,
                                        width: w * 0.09,
                                        decoration: BoxDecoration(
                                            color: cWhite,
                                            shape: BoxShape.circle),
                                        child: Center(
                                            child: Container(
                                                margin: EdgeInsets.only(
                                                    top: h * 0.005),
                                                child: Text(
                                                  '?',
                                                  textAlign: TextAlign.center,
                                                  style: AppStyle
                                                      .textStyleLabelColorTitleBlueBold22,
                                                ))),
                                      ),
                                      SizedBox(
                                        width: w * 0.01,
                                      ),
                                      Text(
                                          controller.currentTemp.value
                                                  .toString() +
                                              "°C",
                                          style: AppStyle
                                              .textStyleLabelColorTitleWhiteBold20),
                                      SizedBox(
                                        width: w * 0.01,
                                      ),
                                    ],
                                  );
                                }),
                              ],
                            ),
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              'assets/images/pic' +
                                  controller.iconValue.value.toString() +
                                  '.png',
                              // Assets.weatherIcon,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: w * 0.02,
                    height: h * 0.03,
                  ),
                  controller.children.value.isEmpty
                      ? Container(
                          height: h * 0.3,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(11),
                            ),
                          ),
                          child: controller.children.value.isEmpty
                              ? Container()
                              : Center(
                                  child: CircularProgressIndicator(
                                    valueColor:
                                        AlwaysStoppedAnimation<Color>(cBrown),
                                  ),
                                ),
                        )
                      : Container(
                          decoration: BoxDecoration(
                            // shape: BoxShape.circle,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            border: Border.all(color: cBlack),
                          ),
                          child: Obx(() {
                            return Container(
                              child: ImageSlideshow(
                                width: double.infinity,
                                height: h * 0.3,
                                initialPage: 0,
                                indicatorColor: cBlack,
                                indicatorBackgroundColor: cGreyLight,
                                children: controller.children.value,
                                onPageChanged: (value) {
                                  // print('Page changed: $value');
                                },
                                autoPlayInterval: 4000,
                                isLoop: true,
                              ),
                            );
                          }),
                        ),
                  // Obx(() {
                  //   return Container(
                  //     color: Colors.red[100],
                  //     height: h * 0.3,
                  //     child: Stack(
                  //       children: [
                  //         CarouselSlider(
                  //           // options: CarouselOptions(height: h * 0.32,),
                  //           options: CarouselOptions(
                  //             height: h,
                  //             enlargeCenterPage: false,
                  //             scrollDirection: Axis.horizontal,
                  //             autoPlay: false,
                  //           ),
                  //
                  //           items: [1, 2, 3, 4, 5].map((i) {
                  //             debugPrint('PAGE INDEX : $i');
                  //             controller.selectedIndex!.value = i;
                  //             return Builder(
                  //               builder: (BuildContext context) {
                  //                 return Container(
                  //                     height: h * 0.15,
                  //                     width: w,
                  //                     decoration: BoxDecoration(
                  //                         borderRadius: BorderRadius.all(
                  //                             Radius.circular(10)),
                  //                         color: cGreyLight),
                  //                     child: Text(
                  //                       'text $i',
                  //                       style: TextStyle(fontSize: 16.0),
                  //                     ));
                  //               },
                  //             );
                  //           }).toList(),
                  //         ),
                  //         Align(
                  //           alignment: Alignment.bottomCenter,
                  //           child: Row(
                  //             mainAxisAlignment: MainAxisAlignment.center,
                  //             children: [1, 2, 3, 4, 5].map((entry) {
                  //               debugPrint('PAGE entry : $entry');
                  //               return GestureDetector(
                  //                 onTap: () {},
                  //                 child: Container(
                  //                   width: 12.0,
                  //                   height: 12.0,
                  //                   margin: EdgeInsets.symmetric(
                  //                       vertical: 8.0, horizontal: 4.0),
                  //                   decoration: BoxDecoration(
                  //                       shape: BoxShape.circle,
                  //                       color: controller.selectedIndex!.value ==
                  //                               entry
                  //                           ? Colors.red
                  //                           : Colors.black),
                  //                 ),
                  //               );
                  //             }).toList(),
                  //           ),
                  //         )
                  //       ],
                  //     ),
                  //   );
                  // })
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
