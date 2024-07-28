import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greencode/constant/app_constant.dart';
import 'package:greencode/constant/appstyle.dart';
import 'package:greencode/screen/e_resident_card/e_resident_card_model.dart';
import 'package:greencode/utils/preference.dart';
import 'package:greencode/widget/customDialog.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrCodeController extends  FullLifeCycleController with FullLifeCycleMixin {

  GlobalKey<ScaffoldState> scaffoldKeyQrScanCode = GlobalKey<ScaffoldState>(debugLabel: 'scaffoldKeyQrScanCode');
  Rx<Barcode>? result = Barcode('',BarcodeFormat.codabar,[1,1]).obs;
  // Rx<QRViewController>? qrController;
  QRViewController? qrController;
  GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  RxBool? checkQrResult = false.obs;
  RxBool? testFlag = false.obs;



  void onQRViewCreated(QRViewController qrViewController) async {
    var h = MediaQuery.of(Get.context!).size.height;
    var w = MediaQuery.of(Get.context!).size.width;
    qrController = qrViewController;
    var userId = await Preference().readInt(Const.prefUserId);
    debugPrint('onQRViewCreated => userId : $userId');

    qrViewController.scannedDataStream.listen((scanData) {
        if(checkQrResult!.value == false) {
          result!.value = scanData;
          // debugPrint('onQRViewCreated => result!.value : ${result!.value.code.toString()}');
          debugPrint('onQRViewCreated => result!.value : ${result!.value.toString()}');
          debugPrint('onQRViewCreated => result!.value.code : ${result!.value.code.toString()}');
          var userData =  UserDetail.fromJson(json.decode(result!.value.code!));
          // debugPrint('onQRViewCreated => userData.userDetailData!.id.toString() : ${userData.userDetailData!.id.toString()}');
          if(userId.toString() == userData.userDetailData!.id.toString()) {
            checkQrResult!.value = false;
            if(testFlag!.value == false) {
              Const().toast('you_cannot_scan_your_own_qr_code'.tr);
              testFlag!.value = true;
            }
            return;
          }
          else if(userId.toString() != userData.userDetailData!.id.toString())  {
            dialogUserDetail(
              Get.context!,
              'back_dialog'.tr,
                  () {Get.back();
                  checkQrResult!.value = false;
                  testFlag!.value = false;
              },
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: h * 0.04),
                  Text('${'first_name'.tr} : ${userData.userDetailData!.firstName.toString()}', style: AppStyle.textStyleLabelColorBlackInfoList),
                  // SizedBox(height: h * 0.02),
                  // Text('${'last_name'.tr} : ${userData.userDetailData!.lastName.toString()}', style: AppStyle.textStyleLabelColorBlackInfoList),
                  SizedBox(height: h * 0.02),
                  Text('${'email'.tr} : ${userData.userDetailData!.email.toString()}', style: AppStyle.textStyleLabelColorBlackInfoList),
                  SizedBox(height: h * 0.02),
                  Text('${'mobile_no'.tr} : ${userData.userDetailData!.mobileNo.toString()}', style: AppStyle.textStyleLabelColorBlackInfoList),
                  SizedBox(height: h * 0.02),


                  Text('${'resident_id'.tr} : ${userData.userDetailData!.flatNumberCode.toString()}', style: AppStyle.textStyleLabelColorBlackInfoList),
                  // SizedBox(height: h * 0.02),
                  // Text('${'resident_name'.tr} : ${userData.userDetailData!.residentTypeTitle.toString()}', style: AppStyle.textStyleLabelColorBlackInfoList),
                  // SizedBox(height: h * 0.02),


                  // Text('${'address'.tr} : ${userData.userDetailData!.address.toString()}', style: AppStyle.textStyleLabelColorBlackInfoList),
                  // SizedBox(height: h * 0.02),

                  // Text('${'user_number'.tr} : ${userData.userDetailData!.userNumber.toString()}', style: AppStyle.textStyleLabelColorBlackInfoList),
                  SizedBox(height: h * 0.04),
                ],
              )
            );
          }
          debugPrint('userNumber : ${userData.userDetailData!.userNumber.toString()}');
          checkQrResult!.value = true;
        }
    });
  }

  void onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    debugPrint('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('no Permission')));
    }
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    debugPrint(' =====> onReady <===== ');
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    // controller!.value.dispose();
    debugPrint(' =====> QrCodeController onClose <===== ');
  }

  @override
  void onDetached() {
    // TODO: implement onDetached
    debugPrint(' =====> QrCodeController onDetached <===== ');
  }

  @override
  void onInactive() {
    // TODO: implement onInactive
    debugPrint(' =====> QrCodeController onInactive <===== ');
  }

  @override
  void onPaused() {
    // TODO: implement onPaused
    debugPrint(' =====> QrCodeController onPaused <===== ');
  }

  @override
  void onResumed() {
    // TODO: implement onResumed
    debugPrint(' =====> QrCodeController onResumed <===== ');
    // controller?.dispose();
    // checkQrResult!.value = false;
  }

  @override
  void $configureLifeCycle() {
    // TODO: implement $configureLifeCycle
    super.$configureLifeCycle();
    debugPrint(' =====> QrCodeController configureLifeCycle <===== ');
  }


}
