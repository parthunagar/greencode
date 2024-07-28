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
import 'package:greencode/widget/custom_appbar_text.dart';
import 'package:greencode/widget/custom_drawer.dart';
import 'package:greencode/widget/data_not_found_widget.dart';

import 'easy_living_info_controller.dart';

class EasyLivingInfoWidget extends GetView<EasyLivingInfoController> {
  @override
  Widget build(BuildContext context) {
    final logic = Get.find<EasyLivingInfoController>();

    var h = MediaQuery
        .of(context)
        .size
        .height;
    var w = MediaQuery
        .of(context)
        .size
        .width;

    return Scaffold(
      key: controller.scaffoldKeyEasyLivingInfo,
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
        title: 'easy_living_title'.tr,
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
      body: Obx(() {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: h * 0.05),
          child: controller.isEssentialInfoLoad.value == true
              ? DataNotFoundWidget(
            title: controller.message.value.toString(),
          )
              : GridView.builder(
            itemCount: controller.easyLivingInfoList.value.length,
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, mainAxisSpacing: 28),
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      controller.findIndex!.value = index;
                      Future.delayed(const Duration(milliseconds: 200),
                              () {

                            if (index == Const.catMtr) {
                              Get.toNamed(AppRoute.easyLivingMTRCategory,
                                  arguments: {
                                    NavigationArgs.navigationEasyLivingTitle:
                                    controller.easyLivingInfoList.value[index]
                                        .cmsCategoryTitle,
                                  });
                            } else if (index == Const.catBus) {
                              Get.toNamed(AppRoute.easyLivingBusStation,
                                  arguments: {
                                    NavigationArgs.navigationEasyLivingTitle:
                                    controller.easyLivingInfoList.value[index]
                                        .cmsCategoryTitle,
                                  });
                            }
                            else if (index == Const.catTaxi) {
                              Get.toNamed(AppRoute.easyLivingTaxi,
                                  arguments: {
                                    NavigationArgs.navigationEasyLivingTitle:
                                    controller.easyLivingInfoList.value[index]
                                        .cmsCategoryTitle,
                                  });
                            }
                            else if (index == Const.catLibrary) {
                              Get.toNamed(AppRoute.easyLivingLibrary,
                                  arguments: {
                                    NavigationArgs.navigationEasyLivingTitle:
                                    controller.easyLivingInfoList.value[index]
                                        .cmsCategoryTitle,
                                  });
                            }
                            else if (index == Const.catPostOffice) {
                              Get.toNamed(AppRoute.easyLivingPostOffice,
                                  arguments: {
                                    NavigationArgs.navigationEasyLivingTitle:
                                    controller.easyLivingInfoList.value[index]
                                        .cmsCategoryTitle,
                                  });
                            }
                            else if (index == Const.catWetMarket) {
                              Get.toNamed(AppRoute.easyLivingWebMarket,
                                  arguments: {
                                    NavigationArgs.navigationEasyLivingTitle:
                                    controller.easyLivingInfoList.value[index]
                                        .cmsCategoryTitle,
                                  });
                            }
                            else if (index == Const.catSportCenter) {
                              Get.toNamed(AppRoute.easyLivingSportCenter,
                                  arguments: {
                                    NavigationArgs.navigationEasyLivingTitle:
                                    controller.easyLivingInfoList.value[index]
                                        .cmsCategoryTitle,
                                  });
                            }
                            controller.findIndex!.value = 10000;
                          });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: cDivider,
                            spreadRadius: 2,
                            blurRadius: 1,
                            offset: const Offset(0, 3),
                          )
                        ],
                      ),
                      child: Obx(() {
                        debugPrint('controller.easyLivingInfoList.value[index].cmsCategoryImage : ${controller.easyLivingInfoList.value[index].cmsCategoryImage}');
                        return CircleAvatar(
                          radius:w * 0.12,
                          // backgroundColor: controller.changeBg.value
                          // ? controller.background.value
                          // : cBackgroundLiving,
                          backgroundColor: controller.findIndex!.value == index
                              ? cBlue
                              : cBackgroundLiving,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: CachedNetworkImage(
                              imageUrl: controller.easyLivingInfoList.value[index].cmsCategoryImage,
                              color: controller.findIndex!.value == index ? cWhite : cBrown,
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10)),
                                      image: DecorationImage(
                                          image: imageProvider,
                                      ),
                                      // boxShadow: [
                                      //   BoxShadow(
                                      //     color: cDivider,
                                      //     spreadRadius: 2,
                                      //     blurRadius: 1,
                                      //     offset: const Offset(0, 3),
                                      //   )
                                      // ],
                                    ),
                                  ),
                              errorWidget: (context, url, error) =>
                                  Container(
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          bottomLeft: Radius.circular(10)),
                                    ),
                                    child: Image.asset(
                                      Assets.placeHolder,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                  SizedBox(
                    height: h * 0.02,
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        controller.easyLivingInfoList.value[index]
                            .cmsCategoryTitle,
                        // 'Post Office',
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: AppStyle
                            .textStyleLabelColorBlackReservationTitle,
                      ),
                    ),
                  )
                ],
              );
            },
          ),
        );
      }),
    );
  }
}
