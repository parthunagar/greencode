import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:greencode/app_route/NavigationArgs.dart';
import 'package:greencode/app_route/app_route.dart';
import 'package:greencode/constant/app_constant.dart';
import 'package:greencode/constant/app_image.dart';

class NoticeDetailsController extends GetxController {

  RxString noticeLink = ''.obs;
  RxString noticeTitle = ''.obs;

  // final pdfController = PdfController(
  //   document: PdfDocument.openAsset('assets/pdfload/demo.pdf'),
  // );

  var scaffoldKeyNoticeDetails = GlobalKey<ScaffoldState>(debugLabel: 'scaffoldKeyNoticeDetails');

  void openDrawer() {
    scaffoldKeyNoticeDetails.currentState?.openEndDrawer();
  }

  void closeDrawer() {
    Get.back();
    FocusScope.of(Get.context!).unfocus();
  }

  RxInt tabIndex = 0.obs;

  List<BottomNavigationBarItem> bottomNavigationBarItemsofCustomer = [
    BottomNavigationBarItem(
      activeIcon: Container(
        margin: const EdgeInsets.only(bottom: 6.0),
        child: SvgPicture.asset(
          Assets.homeActive,
        ),
      ),
      icon: Container(
        margin: const EdgeInsets.only(bottom: 6.0),
        child: SvgPicture.asset(
          Assets.home,
        ),
      ),
      label: 'main_page'.tr,
    ),
    BottomNavigationBarItem(
      activeIcon: Container(
        width: 50,
        color: Colors.black,
        margin: const EdgeInsets.only(bottom: 6.0),
        child: SvgPicture.asset(
          Assets.qrCodeActive,
        ),
      ),
      icon: Container(
        margin: const EdgeInsets.only(bottom: 6.0),
        child: SvgPicture.asset(
          Assets.qrCode,
        ),
      ),
      label: 'qr_code'.tr,
    ),
    BottomNavigationBarItem(
      activeIcon: Container(
        width: 50,
        margin: const EdgeInsets.only(bottom: 6.0),
        child: SvgPicture.asset(
          Assets.bookingActive,
        ),
      ),
      icon: Container(
        margin: const EdgeInsets.only(bottom: 6.0),
        width: 50,
        child: SvgPicture.asset(
          Assets.booking,
        ),
      ),
      label: 'booking'.tr,
    ),
    BottomNavigationBarItem(
      activeIcon: Container(
        margin: const EdgeInsets.only(bottom: 6.0),
        child: SvgPicture.asset(
          Assets.notificationActive,
        ),
      ),
      icon: Container(
        margin: const EdgeInsets.only(bottom: 6.0),
        child: SvgPicture.asset(
          Assets.notification,
        ),
      ),
      label: 'notification'.tr,
    ),
  ];

  void changeTabIndex(int index) {
    tabIndex.value = index;
    // if(index == Const.firstTabMain) {
    //   Get.offAllNamed(AppRoute.homeScreen);
    // }
    // else if(index == Const.secondTabQr){
    //   Get.offAllNamed(AppRoute.qrCodeScreen);
    // }else if(index == Const.thirdTabBooking){
    //   Get.offAllNamed(AppRoute.bookingScreen);
    // }else{
    //   Get.offAllNamed(AppRoute.notificationScreen);
    // }
    update();
  }



  @override
  void onInit() {
    // TODO: implement onInit
    noticeLink.value = Get.arguments[NavigationArgs.navigationEstateNoticeLink];
    debugPrint('noticeId onInit => value  :${noticeLink}');
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady

    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
