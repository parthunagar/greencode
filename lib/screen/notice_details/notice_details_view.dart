import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:greencode/constant/app_image.dart';
// import 'package:greencode/constant/appstyle.dart';
import 'package:greencode/constant/colors.dart';
import 'package:greencode/screen/dashboard/dashboard_controller.dart';
import 'package:greencode/widget/custom_appbar_text.dart';
import 'package:greencode/widget/custom_drawer.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

import 'notice_details_controller.dart';

class NoticeDetailsWidget extends GetView<NoticeDetailsController> {


  @override
  Widget build(BuildContext context) {
    final logic = Get.find<NoticeDetailsController>();
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
      key: controller.scaffoldKeyNoticeDetails,
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
      // body: Container(
      //   // width: w,
      //   // height: h,
      //   child: SfPdfViewer.asset(
      //       'assets/images/1649036303.pdf',
      //       pageLayoutMode: PdfPageLayoutMode.single,
      //       initialScrollOffset: Offset(5,5),
      //       // canShowScrollHead: false,
      //       // controller.noticeLink.value,
      //   // pageSpacing: 15.0,
      //   initialZoomLevel: 5,
      //   ),
      // ),

      body: PDF(swipeHorizontal: false).cachedFromUrl(controller.noticeLink.value)
    );
  }
}
