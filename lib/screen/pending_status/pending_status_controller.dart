import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:greencode/app_route/app_route.dart';
import 'package:greencode/constant/app_constant.dart';
import 'package:greencode/constant/app_image.dart';
import 'package:greencode/screen/reservation/reservation_controller.dart';
import 'package:greencode/screen/reservation/reservation_model.dart';
import 'package:greencode/screen/reservation/reservation_provider.dart';
import 'package:greencode/utils/preference.dart';
import 'package:greencode/widget/customDialog.dart';
import 'package:greencode/widget/progress_dialog_utils.dart';

class PendingStatusController extends GetxController with StateMixin<dynamic> {

  RxInt isOpacity = 0.obs;
  RxBool isPendingStatusLoad = false.obs;
  final reservationController = Get.find<ReservationController>();

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

  Future<ReservationListModel?> callCancelBooking(int bookingId) async {
    // WidgetsBinding.instance?.addPostFrameCallback((_) {
    //   ProgressDialogUtils.showProgressDialog(Get.context);
    // });
    String token = await Preference().read(Const.prefAPIToken);
    int userId = await Preference().readInt(Const.prefUserId);
    String status = "Cancel";

    debugPrint('token' );
    // int language = await Preference().readInt(Const.prefLanguage);
    ReservationProvider()
        .callCancelBooking(token, userId, bookingId, status)
        .then((value) async {
      debugPrint('callClubListApi => value  :${value}');
      final reservationClubListResponse = ReservationListModel.fromJson(value);
      change(value, status: RxStatus.success());
      if (reservationClubListResponse.status == 1) {
        // WidgetsBinding.instance?.addPostFrameCallback((_) {
        //   ProgressDialogUtils.hideProgressDialog();
        // });
        debugPrint('callStatus => value  :${reservationClubListResponse.status}');
        dialogCancelSuccessfully(
          Get.context!,
          'booking_cancel'.tr,
          'back_dialog'.tr,
              () {

            reservationController.callReservationClubList();
            Get.back();
            // Const().toast(reservationClubListResponse.message);
          },
        );

      } else {
        WidgetsBinding.instance?.addPostFrameCallback((_) {
          ProgressDialogUtils.hideProgressDialog();
        });
        Const().toast(reservationClubListResponse.message);
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
