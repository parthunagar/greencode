import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:greencode/app_route/NavigationArgs.dart';
import 'package:greencode/app_route/app_route.dart';
import 'package:greencode/constant/app_constant.dart';
import 'package:greencode/constant/app_image.dart';
import 'package:greencode/constant/appstyle.dart';
import 'package:greencode/constant/colors.dart';
import 'package:greencode/utils/preference.dart';
import 'package:greencode/utils/utils.dart';
import 'package:greencode/widget/custom_appbar.dart';
import 'package:greencode/widget/custom_appbar_text.dart';
import 'package:greencode/widget/custom_drawer.dart';
import 'package:greencode/widget/data_not_found_widget.dart';

import 'estate_fund_list_controller.dart';

class EstateFundListWidget extends GetView<EstateFundListController> {
  @override
  Widget build(BuildContext context) {
    final logic = Get.find<EstateFundListController>();

    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Scaffold(
      key: controller.scaffoldKeyEstateNotice,
      backgroundColor: cBottomLayout,
      endDrawer: CustomDrawer(),
      appBar: CustomAppBarText(
        padding: EdgeInsets.zero,
        leading: Container(
          padding: EdgeInsets.only(top: h * 0.04),
          width: w * 0.15,
          height: h / 10,
          // color: Colors.red,
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
        title: 'estate_fund_type_title'.tr,
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
        return controller.isEstateInfoListLoad.value == true
            ? DataNotFoundWidget(
                title: controller.message.value.toString(),
              )
            : ListView.builder(
                // padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                shrinkWrap: false,
                // itemCount: controller.driverList.value.length,// 20,
                itemCount: controller.estateNoticeMutableList.value.length,
                // 20,

                itemBuilder: ((context, index) {
                  return GestureDetector(
                    onTap: () {
                      debugPrint('index--' + index.toString());
                      // Get.toNamed(AppRoute.resetPasswordScreen);
                      Get.toNamed(AppRoute.noticeDetailsScreen,arguments: {
                        NavigationArgs.navigationEstateNoticeLink:  controller.estateNoticeMutableList.value[index].noticeDocumentation,
                      });
                    },
                    child: Column(
                      children: [
                        Padding(
                          // padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                          padding: EdgeInsets.symmetric(
                              horizontal: w * 0.04, vertical: h * 0.005),
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(Assets.rightArrow,
                                      color: cTextColor, height: h * 0.025),
                                  SizedBox(width: w * 0.04),
                                  Container(
                                    width: w * 0.65,
                                    child: Text(
                                        controller.estateNoticeMutableList
                                            .value[index].noticeTitle,
                                        style:
                                        AppStyle.textStyleLabelColorBlackHome,
                                        textAlign: TextAlign.start),
                                  ),
                                ],
                              ),

                              Container(
                                margin: const EdgeInsets.only(top: 30),
                                child : FutureBuilder(
                                  future: Utils.getDateFormat(
                                      controller.estateNoticeMutableList
                                          .value[index].updatedAt,
                                      "dd/MM/yyyy"),
                                  builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                                    return Text(
                                        snapshot.data ??'',
                                        style: AppStyle
                                            .textStyleLabelColorLightGreyFundList,
                                        textAlign: TextAlign.end
                                    );
                                  },

                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 1,
                          width: w,
                          color: cDivider,
                        )
                      ],
                    )
                  );
                }));
      }),
    );
  }
}
