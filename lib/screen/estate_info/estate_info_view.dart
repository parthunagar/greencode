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

import 'estate_info_controller.dart';

class EstateInfoWidget extends GetView<EstateInfoController> {
  @override
  Widget build(BuildContext context) {
    final logic = Get.find<EstateInfoController>();
    // final dashboardController = Get.find<DashboardController>();

    var h = MediaQuery
        .of(context)
        .size
        .height;
    var w = MediaQuery
        .of(context)
        .size
        .width;

      return Scaffold(
        key: controller.scaffoldKeyOne,
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
          title: 'estate_info_title'.tr,
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
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: w * 0.04, vertical: h * 0.01),
          child: Obx(() {
            // debugPrint('controller.estateInfoMutableList.value.length  :${controller.estateInfoMutableList.value.length}');
            return controller.isEstateInfoListLoad.value == true
                ? DataNotFoundWidget(
              title: controller.message.value.toString(),
            )
                : ListView.separated(
                padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                shrinkWrap: true,
                // itemCount: controller.driverList.value.length,// 20,
                itemCount: controller.estateInfoMutableList.value.length,
                // 20,
                separatorBuilder: (_, __) => SizedBox(height: h * 0.02),
                itemBuilder: ((context, index) {
                  return GestureDetector(
                    onTap: () {
                      debugPrint('index--' + index.toString());
                      controller.currantIndex.value = index;
                      controller.background.value = cBlue;
                      controller.iconColor.value = true;

                      Get.toNamed(AppRoute.estateFundListScreen, arguments: {
                        NavigationArgs.navigationEstateNoticeID: controller
                            .estateInfoMutableList
                            .value[index].noticeCategoriesId
                            .toString(),
                      });
                      Future.delayed(const Duration(milliseconds: 1500), () {
                        controller.background.value = cWhite;
                        controller.iconColor.value = false;
                      });
                    },
                    child: Obx(() {
                      return Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: w * 0.028, vertical: h * 0.013),
                        decoration: BoxDecoration(
                          color: controller.currantIndex.value == index
                              ? controller.background.value
                              : cWhite,
                          borderRadius:
                          const BorderRadius.all(Radius.circular(10)),
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
                          padding:
                          const EdgeInsets.only(left: 8.0, right: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                  height: w * 0.09,
                                  width: w * 0.09,
                                  child: CachedNetworkImage(
                                    imageUrl: controller.estateInfoMutableList
                                        .value[index].noticeCatImage,
                                    imageBuilder: (context, imageProvider) =>
                                        Container(
                                          decoration: BoxDecoration(
                                            color: controller.iconColor.value
                                                ? cWhite
                                                : cBrown,
                                            image: DecorationImage(
                                                image: imageProvider,
                                                fit: BoxFit.cover,
                                                colorFilter:
                                                const ColorFilter.mode(
                                                    Colors.red,
                                                    BlendMode.colorBurn)),
                                          ),
                                        ),
                                    errorWidget: (context, url, error) =>
                                        Image.asset(Assets.placeHolder),
                                  )
                              ),
                              SizedBox(width: w * 0.04),
                              Expanded(
                                child: Text(
                                    controller.estateInfoMutableList
                                        .value[index].noticeTitle
                                        .toString(),
                                    maxLines: 1,
                                    style: controller.iconColor.value
                                        ? AppStyle
                                        .textStyleLabelColorLightWhiteInfoList
                                        : AppStyle
                                        .textStyleLabelColorBlackInfoList,
                                    textAlign: TextAlign.start),
                              ),

                              Text(
                                controller.estateInfoMutableList.value[index]
                                    .noticeCount
                                    .toString(),
                                style: controller.iconColor.value
                                    ? AppStyle
                                    .textStyleLabelColorLightWhiteInfoList
                                    : AppStyle
                                    .textStyleLabelColorLightGreyInfoList,
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(width: w * 0.03),
                              SvgPicture.asset(
                                Assets.rightArrow,
                                color: controller.iconColor.value
                                    ? cWhite
                                    : cBrown,
                              )
                            ],
                          ),
                        ),
                      );
                    }),
                  );
                }));
          }),
        ),
        // bottomNavigationBar: Container(
        //   height: h * 0.09,
        //   decoration: BoxDecoration(
        //     color: cBlack,
        //     boxShadow: <BoxShadow>[
        //       new BoxShadow(
        //         color: cGrey,
        //         blurRadius: 1.0,
        //         offset: new Offset(0.0, 0.0),
        //       ),
        //     ],
        //   ),
        //   child: ClipRRect(
        //     child: BottomNavigationBar(
        //       backgroundColor: cBottomLayout,
        //       onTap: controller.changeTabIndex,
        //       currentIndex: controller.tabIndex.value,
        //       type: BottomNavigationBarType.fixed,
        //       selectedItemColor: cBlack,
        //       unselectedItemColor: cGreyLight,
        //       showUnselectedLabels: true,
        //       unselectedLabelStyle: AppStyle.textStyleLabelColorUnSelected,
        //       selectedLabelStyle: AppStyle.textStyleLabelColorBlackSmall,
        //       items: [...controller.bottomNavigationBarItemsofCustomer],
        //     ),
        //   ),
        // ),
      );
    // });
  }
}
