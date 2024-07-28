import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:greencode/app_route/NavigationArgs.dart';
import 'package:greencode/app_route/app_route.dart';
import 'package:greencode/constant/app_image.dart';
import 'package:greencode/constant/appstyle.dart';
import 'package:greencode/constant/colors.dart';
import 'package:greencode/widget/custom_appbar_text.dart';
import 'package:greencode/widget/custom_drawer.dart';
import 'package:greencode/widget/data_not_found_widget.dart';

import 'category_bus_station_list_controller.dart';

class CategoryBusStationListWidget
    extends GetView<CategoryBusStationController> {
  @override
  Widget build(BuildContext context) {
    final logic = Get.find<CategoryBusStationController>();

    var h = MediaQuery
        .of(context)
        .size
        .height;
    var w = MediaQuery
        .of(context)
        .size
        .width;

    return Obx(() {
      return Scaffold(
        key: controller.scaffoldKeyBusStationList,
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
        body: controller.isBusStationListLoad.value
            ? DataNotFoundWidget(title:'data_not_found'.tr)
            : controller.busStationMutableList.value.isEmpty
            ? Container()
            : SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: w * 0.06, horizontal: h * 0.045),
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: controller.busStationMutableList.value[0]
                    .stationList!.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: w * 0.01),
                    child: GestureDetector(
                      onTap: () {
                        // controller.background.value = cBlue;
                        // controller.changeBg.value = true;
                        controller.findIndex!.value = index;
                        Future.delayed(const Duration(milliseconds: 200),
                                () {
                              // controller.background.value = cBackgroundLiving;
                              // controller.changeBg.value = false;

                              Get.toNamed(AppRoute.easyLivingBusCategory,
                                  arguments: {
                                    NavigationArgs.navigationEasyLivingTitle:
                                    controller.easyLivingTitle.value,
                                    NavigationArgs.navigationBusStationId:
                                    controller.busStationMutableList.value[0]
                                        .stationList![index].id,
                                  });
                              controller.findIndex!.value = 10000;
                            });
                      },
                      child: Obx(() {
                        return Card(
                          color: controller.findIndex!.value == index ? cBlue : cWhite,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: w * 0.035,
                                horizontal: h * 0.02),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceEvenly,
                              children: [
                                CachedNetworkImage(
                                  width: w * 0.34,
                                  height: h * 0.1,
                                  // imageUrl: 'https://picsum.photos/250?image=9',
                                  imageUrl: controller
                                      .busStationMutableList
                                      .value[0]
                                      .stationList![index]
                                      .stationImage,
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
                                Expanded(
                                  child: Center(
                                    child: Text(
                                      controller
                                          .busStationMutableList
                                          .value[0]
                                          .stationList![index]
                                          .stationName,
                                      // 'Luen Wo Hui Bus Terminal',
                                      textAlign: TextAlign.center,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: controller.findIndex!.value == index ? AppStyle.textStyleLabelColorLightWhiteInfoList : AppStyle
                                          .textStyleLabelColorBlackInfoList,

                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                  );
                },
              )),
        ),
      );
    });
  }
}
