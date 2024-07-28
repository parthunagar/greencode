import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:greencode/constant/app_image.dart';
import 'package:greencode/constant/appstyle.dart';
import 'package:greencode/constant/colors.dart';
import 'package:greencode/widget/customDialog.dart';
import 'package:greencode/widget/custom_appbar_text.dart';
import 'package:greencode/widget/custom_button.dart';
import 'package:greencode/widget/custom_button_notification.dart';
import 'package:greencode/widget/data_not_found_widget.dart';

import 'notification_controller.dart';

class NotificationWidget extends GetView<NotificationController> {
  @override
  Widget build(BuildContext context) {
    final logic = Get.find<NotificationController>();

    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    // RxList<RxCheckBoxListTileModel> checkBoxListTileModel =

    return Obx(() {
      return Scaffold(
        backgroundColor: cBottomLayout,
        appBar: CustomAppBarText(
          padding: EdgeInsets.zero,
          leading: Container(
            padding: EdgeInsets.only(top: h * 0.04),
            width: w * 0.15,
            height: h / 10,
            // color: Colors.white,
            alignment: Alignment.center,
            // child: Center(
            //   child: SvgPicture.asset(
            //     Assets.back,
            //   ),
            // ),
          ),
          title: 'notification_title'.tr,
          action: [
            Padding(
              padding: EdgeInsets.only(top: h * 0.05, right: 10.0),
              child: GestureDetector(
                child: Text(
                  controller.titleValue.value,
                  style: AppStyle.textStyleAbelProWhite17,
                ),
                onTap: () async {
                  controller.removeIndex();
                  if (controller.titleValue.value == 'edit'.tr) {
                    controller.checkboxStatus.value = true;
                    controller.titleValue.value = 'done'.tr;
                  } else {
                    controller.checkboxStatus.value = false;
                    controller.titleValue.value = 'edit'.tr;
                    // controller.notificationMutableDetailsList.value = [];

                  }
                  // dashboardController.openDrawer();
                },
              ),
            )
          ],
        ),
        body: controller.isNotificationLoad.value
            ? SizedBox(
            width : w,
            child: Center(child: DataNotFoundWidget(title: controller.messageValue.value.toString())))
            : controller.notificationMutableDetailsList.value.isEmpty
                ? Container()
                : Obx(() {
                    return Stack(
                      children: [
                        ListView.builder(
                            itemCount: controller
                                .notificationMutableDetailsList.value.length,
                            padding: controller.checkboxStatus.value
                                ? EdgeInsets.only(bottom: h * 0.075)
                                : EdgeInsets.only(bottom: h * 0.00),
                            itemBuilder: (BuildContext context, int index) {
                              debugPrint(
                                  'length ${controller.notificationMutableDetailsList.value.length}');
                              // return Obx(() {
                              return GetBuilder<NotificationController>(
                                  builder: (logic) {
                                return Obx(() {
                                  return Column(
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: w * 0.04,
                                            right: w * 0.04,
                                            top: h * 0.013,
                                            bottom: h * 0.012),
                                        child: Theme(
                                          data: ThemeData(
                                              checkboxTheme: Theme.of(context)
                                                  .checkboxTheme
                                                  .copyWith(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                      20)),
                                                      side: BorderSide(
                                                          width: 1.8,
                                                          color: Theme.of(
                                                                  context)
                                                              .unselectedWidgetColor),
                                                      splashRadius: 0)),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Visibility(
                                                    visible: controller.checkboxStatus.value ? true : false,
                                                    child: Checkbox(
                                                      activeColor: Colors.black,
                                                      value: controller.valOf(index),
                                                      onChanged: (bool? value) {
                                                        controller.changeValue(value, index);
                                                        debugPrint('value is $value - ${controller.notificationMutableDetailsList.value[index].isCheck}');
                                                      },
                                                    ),
                                                  ),
                                                  SvgPicture.asset(
                                                      Assets.broadcastImage),
                                                  SizedBox(width: w * 0.018),
                                                  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Expanded(
                                                                // width: w * 0.5,
                                                                // color: Colors.red[100],
                                                                child: Text(
                                                                    controller
                                                                        .notificationMutableDetailsList
                                                                        .value[
                                                                            index]
                                                                        .title
                                                                        .toString(),
                                                                    style: AppStyle
                                                                        .textStyleLabelColorBlackHome)),
                                                            SizedBox(
                                                                width:
                                                                    w * 0.02),
                                                            Text(
                                                                controller
                                                                    .dateTimeFormat(controller
                                                                        .notificationMutableDetailsList
                                                                        .value[
                                                                            index]
                                                                        .createdAt
                                                                        .toString())
                                                                    .toString(),
                                                                style: AppStyle
                                                                    .textStyleLabelColorBlackSmall),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                            height: h * 0.01),
                                                        Text(
                                                            controller
                                                                .notificationMutableDetailsList
                                                                .value[index]
                                                                .description
                                                                .toString(),
                                                            style: AppStyle
                                                                .textStyleLabelColorBlackSmall)
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                              // SizedBox(height: h * 0.006),
                                              // Padding(
                                              //   padding: controller.checkboxStatus.value? EdgeInsets.only(left: w * 0.265): EdgeInsets.only(left: w * 0.13),
                                              //   child: SizedBox(
                                              //     width: w,
                                              //     child: Text(controller.notificationMutableDetailsList.value[index].description.toString(),style: AppStyle.textStyleLabelColorBlackSmall)),
                                              // ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Divider(
                                          height: 1,
                                          color: cDivider,
                                          thickness: 1)
                                    ],
                                  );
                                });
                              });
                              // });
                            }),
                        Visibility(
                          visible:
                              controller.checkboxStatus.value ? true : false,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                width: w * 0.45,
                                child: CustomButtonNotification(
                                  // backgroundColor: cRed,
                                  title: 'read'.tr,
                                  onPressed: () async {
                                    if(controller.selectId.isNotEmpty) {
                                      dialogNotificationRead(context, () {
                                        Get.back();
                                      });
                                    }
                                  },
                                ),
                              ),
                              Container(
                                width: w * 0.45,
                                child: CustomButtonNotification(
                                  backgroundColor: cRed,
                                  title: 'delete'.tr,
                                  onPressed: () async {
                                    // controller.notificationMutableDetailsList.
                                    if(controller.selectId.isNotEmpty) {
                                      dialogConfirmDelete(
                                          context,
                                          'confirmed_to_delete'.tr,
                                          'cancel_dialog'.tr,
                                          'confirm'.tr, () {
                                        Get.back();
                                      }, () {
                                        debugPrint(
                                            'Select List Index ${controller
                                                .selectedListIndex.value
                                                .toString()}');
                                        debugPrint(
                                            'selectId List Index ${controller
                                                .selectId.value.toString()}');
                                        debugPrint(
                                            'selectId List Index ${controller
                                                .selectId.value.toString()
                                                .replaceAll('[', '')
                                                .replaceAll(']', '')}');
                                        controller.callApiForDeleteNotification(
                                            controller.selectId.value
                                                .toString()
                                                .replaceAll('[', '')
                                                .replaceAll(']', ''));
                                        Get.back();
                                        controller.checkboxStatus.value = false;
                                        controller.titleValue.value = 'edit'.tr;
                                      });
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    );
                  }),
      );
    });
  }
}

//
// class CheckBoxListTileModel {
//   int userId;
//   String img;
//   String title;
//   bool isCheck;
//   CheckBoxListTileModel(
//       {required this.userId,
//       required this.img,
//       required this.title,
//       required this.isCheck});
//
//   static List<CheckBoxListTileModel> getUsers() {
//     return <CheckBoxListTileModel>[
//       CheckBoxListTileModel(
//           userId: 1, img: Assets.placeHolder, title: "Android", isCheck: true),
//       CheckBoxListTileModel(
//           userId: 2, img: Assets.placeHolder, title: "Flutter", isCheck: false),
//       CheckBoxListTileModel(
//           userId: 3, img: Assets.placeHolder, title: "IOS", isCheck: false),
//       CheckBoxListTileModel(
//           userId: 4, img: Assets.placeHolder, title: "PHP", isCheck: false),
//       CheckBoxListTileModel(
//           userId: 5, img: Assets.placeHolder, title: "Node", isCheck: false),
//     ];
//   }
// }
