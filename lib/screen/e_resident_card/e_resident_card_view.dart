import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:greencode/constant/app_image.dart';
import 'package:greencode/constant/appstyle.dart';
import 'package:greencode/constant/colors.dart';
import 'package:greencode/screen/dashboard/dashboard_controller.dart';
import 'package:greencode/widget/custom_appbar_text.dart';
import 'package:greencode/widget/custom_drawer.dart';
import 'package:greencode/widget/custom_progressbar.dart';
import 'package:greencode/widget/data_not_found_widget.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'e_resident_card_logic.dart';

class EResidentCardPage extends GetView<EResidentCardLogic> {
  // final logic = Get.put(EResidentCardLogic());

  EResidentCardPage({Key? key}) : super(key: key);

  GlobalKey<ScaffoldState> scaffoldKeyEResidenceCard = GlobalKey<ScaffoldState>(debugLabel: 'scaffoldKeyEResidenceCard');

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    final logic = Get.put(DashboardController());
    return Scaffold(

      key: scaffoldKeyEResidenceCard,
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
        title: 'eresident_card'.tr,
        action: [
          Padding(
            padding:  EdgeInsets.only(top: h * 0.05, right: 10.0),
            child: GestureDetector(
              child: SvgPicture.asset(Assets.menu),
              onTap: () {
                // controller.openDrawer();
                scaffoldKeyEResidenceCard.currentState?.openEndDrawer();
              },
            ),
          )
        ],
      ),
      body: Obx(() {
        return controller.isUserDetailLoaded!.value
        ? DataNotFoundWidget(title: controller.message.value.toString())
        : controller.userDataList.value.isEmpty ?
        CustomProgressBar()
          : SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: w * 0.04),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: h * 0.1),
                Stack(
                  // alignment: Alignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                        // color: Colors.red[100],
                        child: Image.asset(Assets.eCard)),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        // padding: const EdgeInsets.all(8.0),
                        margin: EdgeInsets.only(right: w * 0.07, top: h * 0.02),
                        child: Text('No.: ${controller.userDataList.value[0].userDetailData!.userNumber.toString()}', style: AppStyle.textStyleAbelProBoldBlack15,),
                      ),
                    )
                  ],
                ),
                SizedBox(height: h * 0.04),
               controller.isUserDetailLoaded!.value == true ?
               SizedBox() :
               Container(
                  decoration: BoxDecoration(border: Border.all(color: cGrey, width: 1.5)),
                  child: QrImage(
                    size: h * 0.3,
                    data: controller.userDetail.toString(),
                    version: QrVersions.auto,
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
