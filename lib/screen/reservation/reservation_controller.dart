import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:greencode/app_route/NavigationArgs.dart';
import 'package:greencode/app_route/app_route.dart';
import 'package:greencode/constant/app_constant.dart';
import 'package:greencode/constant/app_image.dart';
import 'package:greencode/screen/reservation/reservation_model.dart';
import 'package:greencode/screen/reservation/reservation_provider.dart';
import 'package:greencode/utils/preference.dart';
import 'package:greencode/widget/customDialog.dart';
import 'package:greencode/widget/progress_dialog_utils.dart';

class ReservationController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final List<Tab> myTabs = <Tab>[
    Tab(text: 'pending'.tr),
    Tab(text: 'past_records'.tr),
  ];

  late TabController controller;

  RxInt tabIndex = 0.obs;
  RxBool isReservationPendingClubListLoad = false.obs;
  RxBool isReservationPastClubListLoad = false.obs;

  // var scaffoldKey = GlobalKey<ScaffoldState>();
  Rx<RxList<ReservationListDatum>> reservationMainClubMutableList =
      RxList<ReservationListDatum>.empty().obs;
  Rx<RxList<ReservationListDatum>> reservationPendingClubMutableList =
      RxList<ReservationListDatum>.empty().obs;

  Rx<RxList<ReservationListDatum>> reservationPaidMutableList =
      RxList<ReservationListDatum>.empty().obs;
  Rx<RxList<ReservationListDatum>> reservationCancelMutableList =
      RxList<ReservationListDatum>.empty().obs;
  Rx<RxList<ReservationListDatum>> reservationPaidMainMutableList =
      RxList<ReservationListDatum>.empty().obs;

  Rx<RxList<ReservationListDatum>> reservationCancelMainMutableList =
      RxList<ReservationListDatum>.empty().obs;
  Rx<RxList<ReservationListDatum>> reservationPastClubMutableList =
      RxList<ReservationListDatum>.empty().obs;

  GlobalKey<ScaffoldState> scaffoldKeyReservation =
      GlobalKey<ScaffoldState>(debugLabel: 'scaffoldKeyReservation');

  void openDrawer() {
    scaffoldKeyReservation.currentState?.openEndDrawer();
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
    // if (index == 0) {
    //   Get.offAllNamed(AppRoute.dashboardScreen);
    // } else if (index == 1) {
    //   Get.offAllNamed(AppRoute.qrCodeScreen);
    // } else if (index == 2) {
    //   Get.offAllNamed(AppRoute.bookingScreen);
    // } else {
    //   Get.offAllNamed(AppRoute.notificationScreen);
    // }
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    controller = TabController(vsync: this, length: myTabs.length);
    tabIndex.value = Get.arguments[NavigationArgs.navigationTabBooking];
    callReservationClubList();
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
    controller.dispose();
    super.onClose();
  }

  Future<ReservationListModel?> callReservationClubList() async {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      ProgressDialogUtils.showProgressDialog(Get.context);
    });
    String token = await Preference().read(Const.prefAPIToken);
    int userId = await Preference().readInt(Const.prefUserId);
    String language = await Preference().read(Const.prefLanguage);
    debugPrint('callReservationClubList => value  :${userId} ${language}');
    ReservationProvider().callReservationClubList(token, language, userId).then(
        (value) async {

      final reservationClubListResponse = ReservationListModel.fromJson(value);
      // change(value, status: RxStatus.success());
      if (reservationClubListResponse.status == 1) {
        WidgetsBinding.instance?.addPostFrameCallback((_) {
          ProgressDialogUtils.hideProgressDialog();
        });
        reservationMainClubMutableList.value.clear();
        reservationPendingClubMutableList.value.clear();
        reservationPastClubMutableList.value.clear();
        reservationPaidMainMutableList.value.clear();
        reservationCancelMainMutableList.value.clear();
        reservationPaidMutableList.value.clear();
        reservationCancelMutableList.value.clear();
        for (ReservationListDatum reservationData
            in reservationClubListResponse.reservationListData!) {
          if (reservationData.status.toLowerCase() == "pending") {
            reservationMainClubMutableList.value.add(reservationData);

            // Collections.reverse(reservationPendingClubMutableList);
          } else if (reservationData.status.toLowerCase() == 'cancel'){
            reservationCancelMainMutableList.value.add(reservationData);
          }else {
            reservationPaidMainMutableList.value.add(reservationData);
          }
        }

        reservationPendingClubMutableList.value.addAll(reservationMainClubMutableList.value.reversed.toList());

        reservationPaidMutableList.value.addAll(reservationPaidMainMutableList.value.reversed.toList());
        reservationCancelMutableList.value.addAll(reservationCancelMainMutableList.value.reversed.toList());

        reservationPastClubMutableList.value.addAll(reservationPaidMutableList.value);
        reservationPastClubMutableList.value.addAll(reservationCancelMutableList.value);
        // reservationPastClubMutableList.value.addAll(reservationPastMainClubMutableList.value.reversed.toList());
        // reservationPendingClubMutableList.value.addAll(reservationClubListResponse.reservationListData!);
        if (reservationPendingClubMutableList.value.isEmpty) {
          isReservationPendingClubListLoad.value = true;
        }else{
          isReservationPendingClubListLoad.value = false;
        }
        if (reservationPastClubMutableList.value.isEmpty) {
          isReservationPastClubListLoad.value = true;
        }else{
          isReservationPastClubListLoad.value = false;
        }
      } else {
        isReservationPendingClubListLoad.value = true;
        isReservationPastClubListLoad.value = true;
        WidgetsBinding.instance?.addPostFrameCallback((_) {
          ProgressDialogUtils.hideProgressDialog();
        });
        // Const().toast(reservationClubListResponse.message);
      }
    }, onError: (error) {
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        ProgressDialogUtils.hideProgressDialog();
      });
      debugPrint("Get Club List Api => error : $error");
      // change(null, status: RxStatus.error(error.toString()));
    });
  }


}
