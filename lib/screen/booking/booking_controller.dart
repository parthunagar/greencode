import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:greencode/app_route/NavigationArgs.dart';
import 'package:greencode/app_route/app_route.dart';
import 'package:greencode/constant/app_constant.dart';
import 'package:greencode/constant/app_image.dart';
import 'package:greencode/screen/booking/booking_model.dart';
import 'package:greencode/screen/booking/booking_provider.dart';
import 'package:greencode/utils/preference.dart';
import 'package:greencode/widget/progress_dialog_utils.dart';

class BookingController extends GetxController with StateMixin<dynamic> {
  RxBool isBookingLoad = false.obs;
  RxInt countValue = 0.obs;

  // var scaffoldKey = GlobalKey<ScaffoldState>();
  Rx<RxList<ClubDatum>> clubMutableList = RxList<ClubDatum>.empty().obs;
  RxString message = ''.obs;

  // GlobalKey<ScaffoldState> scaffoldKeyBooking = GlobalKey<ScaffoldState>(debugLabel: 'Booking');
  // RxInt tabIndex = Const.thirdTabBooking.obs;
  //
  // void changeTabIndex(int index) {
  //   tabIndex.value = index;
  //   if(index == 0) {
  //     Get.toNamed(AppRoute.homeScreen);
  //   }
  //   else if(index == 1){
  //     Get.toNamed(AppRoute.qrCodeScreen);
  //   }else if(index == 2){
  //     Get.toNamed(AppRoute.bookingScreen);
  //   }else{
  //     Get.toNamed(AppRoute.notificationScreen);
  //   }
  //   update();
  // }


  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();


    // callClubList();
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

  Future<ClubListModel?> callClubList() async {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      ProgressDialogUtils.showProgressDialog(Get.context);
    });
    String token = await Preference().read(Const.prefAPIToken);
    int userId = await Preference().readInt(Const.prefUserId);
    String language = await Preference().read(Const.prefLanguage);
    BookingProvider().callClubList(token, language,userId).then((value) async {
      debugPrint('callClubListApi => value  :${value}');
      final clubListResponse = ClubListModel.fromJson(value);
      change(value, status: RxStatus.success());
      if (clubListResponse.status == 1) {
        WidgetsBinding.instance?.addPostFrameCallback((_) {
          ProgressDialogUtils.hideProgressDialog();
        });
        clubMutableList.value.clear();
        clubMutableList.value.addAll(clubListResponse.clubData!);
        countValue.value = 0;
        for(int j=0;j<clubMutableList.value.length;j++){
          countValue.value = countValue.value + clubMutableList.value[j].count;
        }

        if (clubMutableList.value.isEmpty) {
          isBookingLoad.value = true;
        }
      } else {
        isBookingLoad.value = true;
        WidgetsBinding.instance?.addPostFrameCallback((_) {
          ProgressDialogUtils.hideProgressDialog();
        });
        message.value = clubListResponse.message.toString();
        // Const().toast(clubListResponse.message);
      }
    }, onError: (error) {
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        ProgressDialogUtils.hideProgressDialog();
      });
      debugPrint("Get Club List Api => error : $error");
      change(null, status: RxStatus.error(error.toString()));
    });
  }
}
