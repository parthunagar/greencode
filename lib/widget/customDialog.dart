import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:greencode/constant/app_image.dart';
import 'package:greencode/constant/appstyle.dart';
import 'package:greencode/constant/colors.dart';
import 'package:greencode/screen/booking_details/booking_details_controller.dart';
import 'package:greencode/screen/booking_details/booking_details_model.dart';
import 'package:greencode/screen/easy_living_details/category_bus_details/category_bus_details_controller.dart';
import 'package:greencode/screen/notification/notification_controller.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

YYDialog dialogCancel(
  BuildContext c,
  String header,
  String btn1Title,
  String btn1DateValue,
  String btn2Title,
  String btn2TimeValue,
  String btn3Title,
  String btn3TPersonValue,
  String backText,
  String cancelText,
  String btn4Title,
  dynamic onTap1,
  dynamic onTap2,
  // bool changeColorBtn1,
  // bool changeColorBtn2,
) {
  var h = MediaQuery.of(c).size.height;
  var w = MediaQuery.of(c).size.width;
  return YYDialog().build(c)
    ..width = w * 0.8
    // ..height = h * 0.5
    ..borderRadius = 4.0
    ..borderRadius = 10.0
    ..barrierColor = Colors.black.withOpacity(0.8)
    ..widget(Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(
              left: 15.0, right: 15.0, top: 18.0, bottom: 12.0),
          child: Text(
            header,
            textAlign: TextAlign.center,
            style: AppStyle.textStyleLabelColorBlackReservationTitle,
          ),
        ),
        Divider(
          thickness: 1,
          color: cDivider,
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    Assets.selectDate,
                    color: cBlack,
                  ),
                  SizedBox(
                    width: w * 0.01,
                  ),
                  Text(
                    btn1Title + ' : ' + btn1DateValue,
                    textAlign: TextAlign.center,
                    style: AppStyle.textStyleLabelColorBlackInfoList,
                  ),
                ],
              ),
              SizedBox(height: h * 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    Assets.selectTime,
                    color: cBlack,
                  ),
                  SizedBox(
                    width: w * 0.01,
                  ),
                  Text(
                    btn2Title + ' : ' + btn2TimeValue,
                    textAlign: TextAlign.center,
                    style: AppStyle.textStyleLabelColorBlackInfoList,
                  ),
                ],
              ),
              SizedBox(height: h * 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    Assets.myAccountHome,
                    color: cBlack,
                  ),
                  SizedBox(
                    width: w * 0.01,
                  ),
                  Text(
                    btn3Title + ' : ' + btn3TPersonValue,
                    textAlign: TextAlign.center,
                    style: AppStyle.textStyleLabelColorBlackInfoList,
                  ),
                ],
              ),
              SizedBox(height: h * 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      btn4Title,
                      textAlign: TextAlign.center,
                      style: AppStyle.textStyleLabelColorRedInfoList,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: h * 0.01),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: GestureDetector(
                onTap: onTap1,
                child: Container(
                  color: cLightBlack,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      backText,
                      textAlign: TextAlign.center,
                      style: AppStyle.textStyleLabelColorWhiteHome,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: onTap2,
                child: Container(
                  color: cRed,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      cancelText,
                      textAlign: TextAlign.center,
                      style: AppStyle.textStyleLabelColorWhiteHome,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    ))
    ..duration = const Duration(milliseconds: 500)
    ..animatedFunc = (child, animation) {
      return ScaleTransition(
          child: child, scale: Tween(begin: 0.0, end: 1.0).animate(animation));
    }
    ..show();
}

YYDialog dialogUserDetail(
    BuildContext c,
    String backText,
    dynamic onTap1,
    Widget textWidget
    ) {
  var h = MediaQuery.of(c).size.height;
  var w = MediaQuery.of(c).size.width;
  return YYDialog().build(c)
    ..width = w * 0.7
  // ..height = h * 0.5
    ..borderRadius = 4.0
    ..borderRadius = 10.0
    ..barrierColor = Colors.black.withOpacity(0.8)
    ..widget(Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        textWidget,
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: GestureDetector(
                onTap: onTap1,
                child: Container(
                  color: cLightBlack,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      backText,
                      textAlign: TextAlign.center,
                      style: AppStyle.textStyleLabelColorWhiteHome,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    ))
    ..duration = const Duration(milliseconds: 500)
    ..animatedFunc = (child, animation) {
      return ScaleTransition(
          child: child, scale: Tween(begin: 0.0, end: 1.0).animate(animation));
    }
    ..show();
}

YYDialog dialogCancelSuccessfully(
  BuildContext c,
  String btn1Title,
  String backText,
  dynamic onTap1,
  // bool changeColorBtn1,
  // bool changeColorBtn2,
) {
  var h = MediaQuery.of(c).size.height;
  var w = MediaQuery.of(c).size.width;
  // var h = MediaQuery.of(Get.context!).size.height;
  // var w = MediaQuery.of(Get.context!).size.width;
  return YYDialog().build(c)
    ..width = w * 0.8
    // ..height = h * 0.5
    ..borderRadius = 4.0
    ..borderRadius = 10.0
    ..barrierColor = Colors.black.withOpacity(0.8)
    ..widget(Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SvgPicture.asset(
                      Assets.successFully,
                    ),
                  ),
                ],
              ),
              SizedBox(height: h * 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: w * 0.01,
                  ),
                  Text(
                    btn1Title,
                    textAlign: TextAlign.center,
                    style: AppStyle.textStyleLabelColorBlackInfoList,
                  ),
                ],
              ),
              SizedBox(height: h * 0.02),
            ],
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: GestureDetector(
                onTap: onTap1,
                child: Container(
                  color: cLightBlack,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      backText,
                      textAlign: TextAlign.center,
                      style: AppStyle.textStyleLabelColorWhiteHome,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    ))
    ..duration = const Duration(milliseconds: 500)
    ..animatedFunc = (child, animation) {
      return ScaleTransition(
          child: child, scale: Tween(begin: 0.0, end: 1.0).animate(animation));
    }
    ..show();
}

YYDialog dialogBookSuccessfully(
  BuildContext c,
  String btn1Title,
  String btn2Title,
  String backText,
  String reservationText,
  dynamic onTap1,
  dynamic onTap2,
  // bool changeColorBtn1,
  // bool changeColorBtn2,
) {
  var h = MediaQuery.of(c).size.height;
  var w = MediaQuery.of(c).size.width;
  // var h = MediaQuery.of(Get.context!).size.height;
  // var w = MediaQuery.of(Get.context!).size.width;
  return YYDialog().build(c)
    ..width = w * 0.8
    // ..height = h * 0.5
    ..borderRadius = 4.0
    ..borderRadius = 10.0
    ..barrierColor = Colors.black.withOpacity(0.8)
    ..widget(Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SvgPicture.asset(
                      Assets.successFully,
                    ),
                  ),
                ],
              ),
              SizedBox(height: h * 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: w * 0.01,
                  ),
                  Text(
                    btn1Title,
                    textAlign: TextAlign.center,
                    style: AppStyle.textStyleLabelColorBlackInfoList,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    btn2Title,
                    textAlign: TextAlign.center,
                    style: AppStyle.textStyleLabelColorBlackInfoList,
                  ),
                ],
              ),
              SizedBox(height: h * 0.02),
            ],
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: GestureDetector(
                onTap: onTap1,
                child: Container(
                  color: cLightBlack,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      backText,
                      textAlign: TextAlign.center,
                      style: AppStyle.textStyleLabelColorWhiteHome,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: onTap2,
                child: Container(
                  color: cBrown,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                    child: Text(
                      reservationText,
                      textAlign: TextAlign.center,
                      style: AppStyle.textStyleLabelColorWhiteHome,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    ))
    ..duration = const Duration(milliseconds: 500)
    ..animatedFunc = (child, animation) {
      return ScaleTransition(
          child: child, scale: Tween(begin: 0.0, end: 1.0).animate(animation));
    }
    ..show();
}

YYDialog dialogSelectDate(
  BuildContext c,
  String reservationText,
  dynamic onTap1,
  // dynamic selectionChanged,
  // bool changeColorBtn1,
  // bool changeColorBtn2,
) {
  final logic = Get.find<BookingDetailsController>();
  var h = MediaQuery.of(c).size.height;
  var w = MediaQuery.of(c).size.width;
  // final kToday = DateTime.now();
  // var h = MediaQuery.of(Get.context!).size.height;
  // var w = MediaQuery.of(Get.context!).size.width;
  return YYDialog().build(c)
    ..width = w * 0.8
    // ..height = h * 0.5
    ..borderRadius = 4.0
    ..borderRadius = 10.0
    ..barrierColor = Colors.black.withOpacity(0.8)
    ..widget(
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              child: Column(
                children: [
                  Stack(
                    children: [
                      SfDateRangePicker(
                          backgroundColor: Colors.white,
                          view: DateRangePickerView.month,
                          initialSelectedDate:
                              DateTime.parse(logic.initialDate.value),
                          enablePastDates: false,
                          selectionColor: cBrown,
                          todayHighlightColor: Colors.black,
                          showNavigationArrow: true,
                          headerHeight: 60,
                          headerStyle: DateRangePickerHeaderStyle(
                              textAlign: TextAlign.center),
                          onSelectionChanged: logic.selectionChanged),
                      Positioned(
                        top: 60,
                        left: 0,
                        child: Container(
                          width: MediaQuery.of(c).size.width,
                          height: 1,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                  GestureDetector(
                    onTap: onTap1,
                    child: Container(
                      width: w,
                      color: cBrown,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                        child: Text(
                          reservationText,
                          textAlign: TextAlign.center,
                          style: AppStyle.textStyleLabelColorWhiteHome,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    )
    ..duration = const Duration(milliseconds: 500)
    ..animatedFunc = (child, animation) {
      return ScaleTransition(
          child: child, scale: Tween(begin: 0.0, end: 1.0).animate(animation));
    }
    ..show();
}

YYDialog dialogNotificationRead(
  BuildContext c,
    dynamic onTap1,
) {
  final notificationController = Get.find<NotificationController>();
  var h = MediaQuery.of(c).size.height;
  var w = MediaQuery.of(c).size.width;
  // final kToday = DateTime.now();
  // var h = MediaQuery.of(Get.context!).size.height;
  // var w = MediaQuery.of(Get.context!).size.width;
  return YYDialog().build(c)
    ..width = w * 0.8
    ..height = h * 0.45
    ..borderRadius = 4.0
    ..borderRadius = 10.0
    ..barrierColor = Colors.black.withOpacity(0.8)
    ..widget(
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              width: w * 0.8,
              height: h * 0.45,
              child: PageView.builder(
                controller: notificationController.pageController,
                itemCount: notificationController.selectedListIndex.length,
                // Can be null
                itemBuilder: (context, position) {
                  return Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: w * 0.04, right: w * 0.04, top: h * 0.012),
                        child: IntrinsicHeight(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                  child: SvgPicture.asset(
                                    Assets.previous,
                                  ),
                                  onTap: () {
                                    notificationController.pageController
                                        .previousPage(
                                      duration: Duration(milliseconds: 200),
                                      curve: Curves.linear,
                                    );
                                  }),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 5.0,right: 5.0),
                                  child: Text(
                                    notificationController
                                        .notificationMutableDetailsList
                                        .value[notificationController
                                            .selectedListIndex.value[position]]
                                        .title.toString(),
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 4,
                                    style:
                                        AppStyle.textStyleLabelColorBlackInfoList,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                  child: SvgPicture.asset(
                                    Assets.next,
                                  ),
                                  onTap: () {
                                    notificationController.pageController
                                        .nextPage(
                                      duration: Duration(milliseconds: 200),
                                      curve: Curves.linear,
                                    );
                                  }),
                            ],
                          ),
                        ),
                      ),
                      Divider(
                        thickness: 1,
                        color: cDivider,
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                                notificationController.notificationMutableDetailsList.value[notificationController.selectedListIndex.value[position]].description.toString(),
                            style: AppStyle.textStyleAbelProTextColor15,),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap : onTap1,
                        child: Container(
                          width: w,
                          color: cBrown,
                          height: h * 0.06,
                          child: Center(
                            child: Text(
                              'back_dialog'.tr,
                              textAlign: TextAlign.center,
                              style: AppStyle.textStyleFamilyAbelPro,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    )
    ..duration = const Duration(milliseconds: 500)
    ..animatedFunc = (child, animation) {
      return ScaleTransition(
          child: child, scale: Tween(begin: 0.0, end: 1.0).animate(animation));
    }
    ..show();
}

YYDialog dialogSelectTime(
  var boxHeight,
  BuildContext c,
  Widget listWidget,
  String reservationText,
  dynamic onTap1,

  // bool changeColorBtn1,
  // bool changeColorBtn2,
) {
  var h = MediaQuery.of(c).size.height;
  var w = MediaQuery.of(c).size.width;
  // var h = MediaQuery.of(Get.context!).size.height;
  // var w = MediaQuery.of(Get.context!).size.width;
  return YYDialog().build(c)
    ..width = w * 0.8
    // ..height = boxHeight
    ..borderRadius = 4.0
    ..borderRadius = 10.0
    ..barrierColor = Colors.black.withOpacity(0.8)
    ..widget(Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      // mainAxisAlignment: MainAxisAlignment.start,
      // mainAxisSize: MainAxisSize.min,
      children: [
        // Expanded(child: listWidget),
        Container(height: boxHeight, child: listWidget),
        GestureDetector(
          onTap: onTap1,
          child: Container(
            width: w,
            color: cBrown,
            child: Padding(
              padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: Text(
                reservationText,
                textAlign: TextAlign.center,
                style: AppStyle.textStyleLabelColorWhiteHome,
              ),
            ),
          ),
        ),
      ],
    ))
    ..duration = const Duration(milliseconds: 500)
    ..animatedFunc = (child, animation) {
      return ScaleTransition(
          child: child, scale: Tween(begin: 0.0, end: 1.0).animate(animation));
    }
    ..show();
}

YYDialog dialogSelectPerson(
  BuildContext c,
  String btn1Title,
  // int btn1TitleValue,
  String btn2Title,
  // int btn2TitleValue,
  String btn3Title,
  String btn3TitleMain,
  // int btn3TitleValue,
  var btn1MinusOnTap1,
  var btn1PlusOnTap1,
  var btn2MinusOnTap2,
  var btn2PlusOnTap2,
  var btn3MinusOnTap3,
  var btn3PlusOnTap3,
  String reservationText,
  dynamic onTap1,

  // bool changeColorBtn1,
  // bool changeColorBtn2,
) {
  var h = MediaQuery.of(c).size.height;
  var w = MediaQuery.of(c).size.width;
  // var h = MediaQuery.of(Get.context!).size.height;
  // var w = MediaQuery.of(Get.context!).size.width;
  var logic = Get.find<BookingDetailsController>();
  return YYDialog().build(c)
    ..width = w * 0.8
    // ..height = h * 0.5
    ..borderRadius = 4.0
    ..borderRadius = 10.0
    ..barrierColor = Colors.black.withOpacity(0.8)
    ..widget(Obx(() {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(btn1Title,
                        textAlign: TextAlign.center,
                        style:
                            AppStyle.textStyleLabelColorBlackReservationTitle),
                    const Spacer(),
                    GestureDetector(
                      onTap: btn1MinusOnTap1,
                      child: SvgPicture.asset(
                        Assets.minus,
                      ),
                    ),
                    SizedBox(
                      width: w * 0.03,
                    ),
                    Text(
                      // btn1TitleValue.toString(),
                      logic.adultValue!.value.toString(),
                      textAlign: TextAlign.center,
                      style: AppStyle.textStyleLabelColorBlackReservationTitle,
                    ),
                    SizedBox(
                      width: w * 0.03,
                    ),
                    GestureDetector(
                      onTap: btn1PlusOnTap1,
                      child: SvgPicture.asset(
                        Assets.plus,
                      ),
                    ),
                  ],
                ),
                Divider(
                  color: cDivider,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      btn2Title,
                      textAlign: TextAlign.center,
                      style: AppStyle.textStyleLabelColorBlackReservationTitle,
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: btn2MinusOnTap2,
                      child: SvgPicture.asset(
                        Assets.minus,
                      ),
                    ),
                    SizedBox(
                      width: w * 0.03,
                    ),
                    Text(
                      // btn2TitleValue.toString(),
                      logic.childrenValue!.value.toString(),
                      textAlign: TextAlign.center,
                      style: AppStyle.textStyleLabelColorBlackInfoList,
                    ),
                    SizedBox(
                      width: w * 0.03,
                    ),
                    GestureDetector(
                      onTap: btn2PlusOnTap2,
                      child: SvgPicture.asset(
                        Assets.plus,
                      ),
                    ),
                  ],
                ),
                Divider(
                  color: cDivider,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      btn3Title,
                      textAlign: TextAlign.center,
                      style: AppStyle.textStyleLabelColorBlackInfoList,
                    ),
                    Text(
                      btn3TitleMain,
                      textAlign: TextAlign.center,
                      style: AppStyle.textStyleLabelColorGreyInfoList,
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: btn3MinusOnTap3,
                      child: SvgPicture.asset(
                        Assets.minus,
                      ),
                    ),
                    SizedBox(
                      width: w * 0.03,
                    ),
                    Text(
                      // btn3TitleValue.toString(),
                      logic.babiesValue!.value.toString(),
                      textAlign: TextAlign.center,
                      style: AppStyle.textStyleLabelColorBlackInfoList,
                    ),
                    SizedBox(
                      width: w * 0.03,
                    ),
                    GestureDetector(
                      onTap: btn3PlusOnTap3,
                      child: SvgPicture.asset(
                        Assets.plus,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: onTap1,
            child: Container(
              width: w,
              color: cBrown,
              child: Padding(
                padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                child: Text(
                  reservationText,
                  textAlign: TextAlign.center,
                  style: AppStyle.textStyleLabelColorWhiteHome,
                ),
              ),
            ),
          ),
        ],
      );
    }))
    ..duration = const Duration(milliseconds: 500)
    ..animatedFunc = (child, animation) {
      return ScaleTransition(
          child: child, scale: Tween(begin: 0.0, end: 1.0).animate(animation));
    }
    ..show();
}

customBottomSheet(
  BuildContext context,
  String number,
  var onTap1,
) {
  var h = MediaQuery.of(context).size.height;
  var w = MediaQuery.of(context).size.width;
  showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        // <-- SEE HERE
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20.0),
        ),
      ),
      builder: (BuildContext context) {
        return Container(
          height: h * 0.25,
          // color: Colors.amber,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Center(
                child: Padding(
                  padding: EdgeInsets.only(top: h * 0.02, bottom: h * 0.01),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(Assets.phoneIcon),
                      SizedBox(
                        width: w * 0.03,
                      ),
                      Text(
                        'call_us'.tr,
                        style: AppStyle.textStyleLabelColorBlack20,
                      )
                    ],
                  ),
                ),
              ),
              Divider(
                color: cDivider,
              ),
              SizedBox(
                height: h * 0.042,
              ),
              GestureDetector(
                onTap: onTap1,
                child: Text(
                  number,
                  style: AppStyle.textStyleLabelColorBrown17,
                ),
              )
            ],
          ),
        );
      });
}

customDialogBottomSheet(
    BuildContext context,
    String heading,
    bool isWebsite,
    List<String> list,
    var onTap1,
    ) {
  var controller = Get.find<CategoryBusDetailsController>();
  var h = MediaQuery.of(context).size.height;
  var w = MediaQuery.of(context).size.width;
  showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            // height: h * 0.25,
            padding: EdgeInsets.only(left: 8.0,right: 8.0,top: 8.0,bottom: 1.0),
            color: Colors.transparent,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  // color: Colors.white,
                  width: double.infinity,
                  // height: h * 0.05,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: h*0.018),
                        child: Center(child: Text(heading,style: AppStyle.textStyleLabelColorGreyTextLightHome18,)),
                      ),
                      Divider(
                        height: 0,
                        color: Colors.grey,
                      ),
                      GestureDetector(
                        onTap: (){
                          if(isWebsite){
                            controller.launchUrl(
                                list[0].toString());
                          }else{
                            controller.launchUrl(
                                'tel:${list[0].toString()}');
                          }
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: h*0.018),
                          child: Text('label1'.tr+":"+list[0],style: AppStyle.textStyleLabelColorBlueLightHome18,),
                        ),
                      ),
                      Divider(
                        height: 0,
                        color: Colors.grey,
                      ),
                      GestureDetector(
                        onTap: (){
                          if(isWebsite){
                            controller.launchUrl(
                                '${list[1].toString()}');
                          }else{
                            controller.launchUrl(
                                'tel:${list[1].toString()}');
                          }

                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: h*0.018),
                          child: Text('label2'.tr+":"+list[1],style: AppStyle.textStyleLabelColorBlueLightHome18,),
                        ),
                      ),
                      Divider(
                        height: 0,
                        color: Colors.grey,
                      ),
                      GestureDetector(
                        onTap: (){
                          if(isWebsite){
                            controller.launchUrl(
                                '${list[2].toString()}');
                          }else{
                            controller.launchUrl(
                                'tel:${list[2].toString()}');
                          }
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: h*0.018),
                          child: Text(('label3'.tr+":"+list[2]),style: AppStyle.textStyleLabelColorBlueLightHome18,),
                        ),
                      ),
                      Divider(
                        height: 0,
                        color: Colors.grey,
                      ),
                      GestureDetector(
                        onTap: (){
                          if(isWebsite){
                            controller.launchUrl(
                                '${list[3].toString()}');
                          }else{
                            controller.launchUrl(
                                'tel:${list[3].toString()}');
                          }
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: h*0.018),
                          child: Text('label4'.tr+":"+list[3],style: AppStyle.textStyleLabelColorBlueLightHome18,),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(

                  height: h * 0.015,
                ),
                GestureDetector(
                  onTap: onTap1,
                  child: Container(
                    // color: Colors.white,
                    width: double.infinity,
                    height: h * 0.07,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: cWhite,
                    ),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: h*0.018),
                        child: Text('cancel_dialog'.tr,style: AppStyle.textStyleLabelColorBlueLightHome18,),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      });
}

YYDialog dialogConfirmDelete(
    BuildContext c,
    String btn1Title,
    String backText,
    String cancelText,
    dynamic onTap1,
    dynamic onTap2,
    // bool changeColorBtn1,
    // bool changeColorBtn2,
    ) {
  var h = MediaQuery.of(c).size.height;
  var w = MediaQuery.of(c).size.width;
  return YYDialog().build(c)
    ..width = w * 0.8
  // ..height = h * 0.5
    ..borderRadius = 4.0
    ..borderRadius = 10.0
    ..barrierColor = Colors.black.withOpacity(0.8)
    ..widget(Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: w * 0.13,horizontal: h * 0.008),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    btn1Title,
                    textAlign: TextAlign.center,
                    style: AppStyle.textStyleLabelColorBlackInfoList,
                  ),
                ],
              ),
            ],
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: GestureDetector(
                onTap: onTap1,
                child: Container(
                  color: cLightBlack,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      backText,
                      textAlign: TextAlign.center,
                      style: AppStyle.textStyleLabelColorWhiteHome,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: onTap2,
                child: Container(
                  color: cRed,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      cancelText,
                      textAlign: TextAlign.center,
                      style: AppStyle.textStyleLabelColorWhiteHome,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    ))
    ..duration = const Duration(milliseconds: 500)
    ..animatedFunc = (child, animation) {
      return ScaleTransition(
          child: child, scale: Tween(begin: 0.0, end: 1.0).animate(animation));
    }
    ..show();
}



YYDialog dialogForgotPassWord(
    BuildContext c,
    String headingText,
    String btn1Title,
    String backText,
    dynamic onTap1,
    // bool changeColorBtn1,
    // bool changeColorBtn2,
    ) {
  var h = MediaQuery.of(c).size.height;
  var w = MediaQuery.of(c).size.width;
  // var h = MediaQuery.of(Get.context!).size.height;
  // var w = MediaQuery.of(Get.context!).size.width;
  return YYDialog().build(c)
    ..width = w * 0.8
  // ..height = h * 0.5
    ..borderRadius = 4.0
    ..borderRadius = 20.0
    ..barrierColor = Colors.black.withOpacity(0.8)
    ..widget(Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: h * 0.02),
        Text(
          headingText,
          textAlign: TextAlign.center,
          style: AppStyle.textStyleLabelColorBlackMain,
        ),
        SizedBox(height: h * 0.02),
        Divider(
          color: cDivider,
          thickness: 1.5,
          height: 0,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: w*0.05, vertical: h*0.05),
          child: Text(
            btn1Title,
            // textAlign: TextAlign.center,
            style: AppStyle.textStyleLabelColorBlackHome14.copyWith(
                letterSpacing: 1.5,
                height: 1.5
            ),
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: GestureDetector(
                onTap: onTap1,
                child: Container(
                  color: cLightBlack,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      backText,
                      textAlign: TextAlign.center,
                      style: AppStyle.textStyleLabelColorWhiteHome.copyWith(
                          letterSpacing: 1.5
                      ),

                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    ))
    ..duration = const Duration(milliseconds: 500)
    ..animatedFunc = (child, animation) {
      return ScaleTransition(
          child: child, scale: Tween(begin: 0.0, end: 1.0).animate(animation));
    }
    ..show();
}



//
// YYDialog dialogCancelSuccessFully(BuildContext c,
//     String header,
//     String btn1Title,
//     dynamic onTap1,
//     // bool changeColorBtn1,
//     // bool changeColorBtn2,
//     ) {
//   var h = MediaQuery
//       .of(c)
//       .size
//       .height;
//   var w = MediaQuery
//       .of(c)
//       .size
//       .width;
//   return YYDialog().build(c)
//     ..width = w * 0.8
//   // ..height = h * 0.5
//     ..borderRadius = 4.0
//     ..borderRadius = 10.0
//     ..widget(
//         Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             SvgPicture.asset(Assets.selectDate,
//               color: cBlack,),
//             SizedBox(width: w * 0.01,),
//             Text(
//               header,
//               textAlign: TextAlign.center,
//               style: AppStyle.textStyleLabelColorBlackInfoList,
//             ),
//             Expanded(
//               child: GestureDetector(
//                 onTap: onTap1,
//                 child: Container(
//                   color: cLightBlack,
//                   child: Padding(
//                     padding: const EdgeInsets.all(15.0),
//                     child: Text(
//                       btn1Title,
//                       textAlign: TextAlign.center,
//                       style: AppStyle.textStyleLabelColorWhiteHome,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//
//         )
//     )
//     ..duration = const Duration(milliseconds: 500)
//     ..animatedFunc = (child, animation) {
//       return ScaleTransition(child: child, scale: Tween(begin: 0.0, end: 1.0).animate(animation));
//     }
//     ..show();
// }

// ..widget(SizedBox(height: h * 0.04))

// ..divider()
//   ..doubleButton(
//       padding: const EdgeInsets.only(top: 10.0),
//       gravity: Gravity.center,
//       // withDivider: true,
//       text1: btn1Title,
//       color1: cGrey,
//       fontSize1: 14.0,
//       fontWeight1: FontWeight.bold,
//       onTap1: onTap1,
//       text2: btn2Title,
//       color2: cGrey,
//       fontSize2: 14.0,
//       fontWeight2: FontWeight.bold,
//       onTap2: onTap2)
// ..widget(SizedBox(height: h * 0.04))
// ..duration = const Duration(milliseconds: 500)
// ..animatedFunc = (child, animation) {
//   return ScaleTransition(
//       child: child, scale: Tween(begin: 0.0, end: 1.0).animate(animation));
// }
// ..show();
// }
