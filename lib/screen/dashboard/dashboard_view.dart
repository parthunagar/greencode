import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greencode/constant/appstyle.dart';
import 'package:greencode/constant/colors.dart';
import 'package:greencode/screen/booking/booking_view.dart';
import 'package:greencode/screen/home/home_view.dart';
import 'package:greencode/screen/notification/notification_view.dart';
import 'package:greencode/screen/qr_code/qr_code_view.dart';
import 'package:greencode/widget/custom_drawer.dart';

import 'dashboard_controller.dart';

class DashboardWidget extends GetView<DashboardController> {
  @override
  Widget build(BuildContext context) {
    // final logic = Get.find<DashboardController>();
    var h = MediaQuery
        .of(context)
        .size
        .height;
    var w = MediaQuery
        .of(context)
        .size
        .width;
    bool _isDrawerOpen = false;

    return Obx(() {
      return Scaffold(
        backgroundColor: cBottomLayout,
        //default controller
        key: controller.scaffoldKey,
        endDrawer: CustomDrawer(
          callback: (isOpen) {
            print("isOpen ${isOpen}");
            WidgetsBinding.instance!.addPostFrameCallback((_) {
              _isDrawerOpen = isOpen;
              // if(isOpen) {
              //   controller.closeDrawer();
              // }else{
              //   controller.openDrawer();
              // }
              //   // setState(() {
              //   //   _isDrawerOpen = isOpen;
              //   // });
            });
          },
        ),
        body:
        IndexedStack(
          index: controller.tabIndex.value,
          children: [
            HomeWidget(),
            QrCodeWidget(),
            BookingWidget(),
            NotificationWidget(),
          ],
        ),
        bottomNavigationBar: Container(
          height: h * 0.12,
          decoration: BoxDecoration(
            color: cBlack,
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: cGrey,
                blurRadius: 1.0,
                offset: Offset(0.0, 0.0),
              ),
            ],
          ),
          child: Obx(() {
            return ClipRRect(
              child: BottomNavigationBar(
                backgroundColor: cBottomLayout,
                onTap: controller.changeTabIndex,
                currentIndex: controller.tabIndex.value,
                type: BottomNavigationBarType.fixed,
                selectedItemColor: cBlack,
                unselectedItemColor: cGreyLight,
                showUnselectedLabels: true,
                unselectedLabelStyle: AppStyle.textStyleLabelColorUnSelected,
                selectedLabelStyle: AppStyle.textStyleLabelColorBlackSmall,
                items: [...controller.bottomNavigationBarItemsofCustomer],
              ),
            );
          }),
        ),
      );
    });
  }
}
