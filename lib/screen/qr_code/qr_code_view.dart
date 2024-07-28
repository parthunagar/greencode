import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:greencode/constant/app_image.dart';
import 'package:greencode/constant/appstyle.dart';
import 'package:greencode/screen/dashboard/dashboard_controller.dart';
import 'package:greencode/widget/custom_appbar_text.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'qr_code_controller.dart';

class QrCodeWidget extends GetView<QrCodeController>  {

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<QrCodeController>();
    final dashboardController = Get.find<DashboardController>();
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    var scanArea = (w < 400 || h < 400) ? 220.0 : 300.0;
    return Scaffold(
      key: controller.scaffoldKeyQrScanCode,
      appBar: CustomAppBarText(
        padding: EdgeInsets.zero,
        leading: Container(
          padding: EdgeInsets.only(top: h * 0.04),
          width: w * 0.15,
          height: h / 10,
          // color: Colors.white,
          alignment: Alignment.center,
        ),
        title: 'qr_code'.tr,
        action: [
          Padding(
            padding: EdgeInsets.only(top: h * 0.05, right: 10.0),
            child: GestureDetector(
              child: SvgPicture.asset(Assets.menu),
              onTap: () {
                dashboardController.openDrawer();
              },
            ),
          )
        ],
      ),
      body: Stack(

        children: [
          QRView(
            key: controller.qrKey,
            onQRViewCreated: controller.onQRViewCreated,
            overlay: QrScannerOverlayShape(
                borderColor: Colors.green,
                // borderRadius: 10,
                borderLength: 110,
                // borderWidth: 10,
                // cutOutBottomOffset: 8.0,
                cutOutSize: scanArea),
            onPermissionSet: (ctrl, p) => controller.onPermissionSet(context, ctrl, p),
          ),
          Positioned.fill(
              top: h * 0.43,
              child: Center(child: SizedBox(
                width: w *0.6,
                // color: Colors.green,
                child: Text('qr_hint'.tr,
                  textAlign: TextAlign.center,
                  style: AppStyle.textStyleAbelProWhite17,),
              )))
        ],
      ),
    );
  }
}
