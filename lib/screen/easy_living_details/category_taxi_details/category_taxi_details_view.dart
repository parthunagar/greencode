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

import 'category_taxi_details_controller.dart';

class CategoryTaxiDetailsWidget extends GetView<CategoryTaxiDetailsController> {
  @override
  Widget build(BuildContext context) {
    final logic = Get.find<CategoryTaxiDetailsController>();
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Obx(() {
      return Scaffold(
        key: controller.scaffoldKeyTaxiDetails,
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
        body: controller.isTaxiDetailsLoad.value
            ? DataNotFoundWidget(title: 'data_not_found'.tr)
            : controller.taxiDetailsMutableList.value.isEmpty
                ? Container()
                : ListView.builder(
                    // padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                    shrinkWrap: false,
                    itemCount:
                        controller.taxiDetailsMutableList.value[0].cmsCategoryDetails!.length,
                    itemBuilder: ((context, index) {
                      return Obx(() {
                        return Column(
                          children: [
                            Padding(
                              // padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                              padding: EdgeInsets.symmetric(
                                  horizontal: w * 0.05, vertical: h * 0.0095),
                              child: Row(
                                // mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Text(
                                      controller.taxiDetailsMutableList.value[0]
                                          .cmsCategoryDetails![index].title.toString(),
                                      overflow: TextOverflow.ellipsis,
                                      style: AppStyle
                                          .textStyleLabelColorBlackInfoList,
                                    ),
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        customBottomSheet(context,
                                            controller.taxiDetailsMutableList.value[0]
                                                .cmsCategoryDetails![index].callUs.toString(),
                                            () {
                                          debugPrint('on tap launchUrl');
                                          Get.back();
                                          controller.launchUrl('tel:${controller.taxiDetailsMutableList.value[0].cmsCategoryDetails![index].callUs.toString()}');

                                        });

                                      },
                                      child: SvgPicture.asset(
                                          Assets.whatsappPhone)),
                                ],
                              ),
                            ),
                            Divider(
                              height: h * 0.01,
                              thickness: 1,
                              color: cDivider,
                            )
                          ],
                        );
                      });
                    })),
      );
    });
  }
}
