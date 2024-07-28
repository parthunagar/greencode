import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:greencode/constant/app_image.dart';
import 'package:greencode/constant/appstyle.dart';
import 'package:greencode/constant/colors.dart';
import 'package:greencode/screen/past_records/past_records_status_view.dart';
import 'package:greencode/screen/pending_status/pending_status_view.dart';
import 'package:greencode/widget/custom_appbar_text.dart';
import 'package:greencode/widget/custom_drawer.dart';

import 'reservation_controller.dart';

class ReservationWidget extends GetView<ReservationController> {
  @override
  Widget build(BuildContext context) {
    final logic = Get.find<ReservationController>();

    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Scaffold(
      key: controller.scaffoldKeyReservation,
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
        title: 'reservation'.tr,
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
      backgroundColor: cBottomLayout,
      endDrawer: CustomDrawer(),
      body: Container(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                      color: cGrey,
                    )),
              ),
              constraints: BoxConstraints.expand(height: 50),
              child: TabBar(
                  indicatorColor: cBrown,
                  labelColor: cBrown,
                  unselectedLabelColor: cBlack,
                  controller: controller.controller,
                  labelStyle: AppStyle.textStyleLabelColorBrownTabTitle,
                  unselectedLabelStyle: AppStyle.textStyleLabelColorBlackTabTitle,
                  tabs: [...controller.myTabs]),
            ),
            Expanded(
              child: Container(
                child: TabBarView(
                  controller: controller.controller,
                  children: [
                    PendingStatusWidget(),
                    PastRecordsStatusWidget(),
                  ],
                ),
              ),
            ),
          ],
        ),
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
    );;
  }
}
