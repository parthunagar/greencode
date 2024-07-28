import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:greencode/app_route/NavigationArgs.dart';
import 'package:greencode/app_route/app_route.dart';
import 'package:greencode/constant/app_constant.dart';
import 'package:greencode/constant/app_image.dart';
import 'package:greencode/screen/estate_fund_types/estate_fund_list_provider.dart';
import 'package:greencode/screen/estate_info/estate_info_model.dart';
import 'package:greencode/utils/preference.dart';
import 'package:greencode/widget/progress_dialog_utils.dart';

import 'estate_fund_list_model.dart';

class EstateFundListController extends GetxController with StateMixin<dynamic> {

  String noticeId = '';
  Rx<Color> background = Colors.white.obs;
  RxInt tabIndex = 0.obs;
  // var scaffoldKey = GlobalKey<ScaffoldState>();
  Rx<RxList<EstateNoticeData>> estateNoticeMutableList =
      RxList<EstateNoticeData>.empty().obs;
  RxString message = ''.obs;
  GlobalKey<ScaffoldState> scaffoldKeyEstateNotice = GlobalKey<ScaffoldState>(debugLabel: 'scaffoldKeyEstateNotice');

  void openDrawer() {
    scaffoldKeyEstateNotice.currentState?.openEndDrawer();
  }

  void closeDrawer() {
    Get.back();
    FocusScope.of(Get.context!).unfocus();
  }


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
        color: Colors.red,
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
    Get.offAllNamed(AppRoute.dashboardScreen);
    tabIndex.value = index;
    if(index == Const.firstTabMain) {
      Get.offAllNamed(AppRoute.dashboardScreen);
    }
    else if(index == Const.secondTabQr){
      Get.offAllNamed(AppRoute.qrCodeScreen);
    }else if(index == Const.thirdTabBooking){
      Get.offAllNamed(AppRoute.bookingScreen);
    }else{
      Get.offAllNamed(AppRoute.notificationScreen);
    }
    update();
  }

  // Rx<RxList<DriverDatum>> driverList = RxList<DriverDatum>.empty().obs;
  RxBool isEstateInfoListLoad = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit

    super.onInit();
    noticeId = Get.arguments[NavigationArgs.navigationEstateNoticeID];
    debugPrint('noticeId onInit => value  :${noticeId}');
    callGetCategoryNoticeDetailsApi();
  }

  @override
  Future<void> onReady() async {
    // TODO: implement onReady

    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  Future<EstateNoticeModel?>  callGetCategoryNoticeDetailsApi() async {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      ProgressDialogUtils.showProgressDialog(Get.context);
    });
    String token = await Preference().read(Const.prefAPIToken);
    String language = await Preference().read(Const.prefLanguage);
    debugPrint('noticeId => value  :${noticeId}');
    EstateFundListProvider().GetCategoryNoticeDetails(token, language,noticeId).then((value) async {

      final estateNoticeListInfo = EstateNoticeModel.fromJson(value);
      change(value, status: RxStatus.success());
      if (estateNoticeListInfo.status == 1) {
        WidgetsBinding.instance?.addPostFrameCallback((_) {
          ProgressDialogUtils.hideProgressDialog();
        });

        estateNoticeMutableList.value.clear();
        estateNoticeMutableList.value.addAll(estateNoticeListInfo.data!);
        if(estateNoticeMutableList.value.isEmpty){
          isEstateInfoListLoad.value = true;
        }
        message.value = estateNoticeListInfo.message.toString();
      } else {
        message.value = estateNoticeListInfo.message.toString();
        isEstateInfoListLoad.value = true;
        WidgetsBinding.instance?.addPostFrameCallback((_) {
          ProgressDialogUtils.hideProgressDialog();
        });
        // Const().toast(estateNoticeListInfo.message);
      }

    }, onError: (error) {
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        ProgressDialogUtils.hideProgressDialog();
      });
      debugPrint("Estate Notice Fund List Api => error : $error");
      change(null, status: RxStatus.error(error.toString()));
    });
  }
}
