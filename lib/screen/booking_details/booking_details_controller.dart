import 'package:carousel_slider/carousel_controller.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:greencode/app_route/NavigationArgs.dart';
import 'package:greencode/app_route/app_route.dart';
import 'package:greencode/constant/app_constant.dart';
import 'package:greencode/constant/appstyle.dart';
import 'package:greencode/constant/colors.dart';
import 'package:greencode/screen/booking_details/booking_details_provider.dart';
import 'package:greencode/utils/preference.dart';
import 'package:greencode/widget/customDialog.dart';
import 'package:greencode/widget/progress_dialog_utils.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import 'booking_details_model.dart';

class BookingDetailsController extends GetxController with StateMixin<dynamic> {
  GlobalKey<ScaffoldState> scaffoldKeyBookingMain =
      GlobalKey<ScaffoldState>(debugLabel: 'scaffoldKeyBookingMain');

  void openDrawer() {
    scaffoldKeyBookingMain.currentState?.openEndDrawer();
  }

  void closeDrawer() {
    Get.back();
    // FocusScope.of(Get.context!).unfocus();
  }

  // GlobalKey<ScaffoldState> scaffoldKeyOne = GlobalKey<ScaffoldState>(debugLabel: 'scaffoldKeyOne');
  //
  // void openDrawer() {
  //   scaffoldKeyOne.currentState?.openEndDrawer();
  // }
  //
  // void closeDrawer() {
  //   Get.back();
  //   FocusScope.of(Get.context!).unfocus();
  // }

  var h = MediaQuery.of(Get.context!).size.height;
  var w = MediaQuery.of(Get.context!).size.width;

  Rx<RxList<ClubDatum>> clubDetailsMutableDetails =
      RxList<ClubDatum>.empty().obs;

  TextEditingController cDate = TextEditingController();
  TextEditingController cTime = TextEditingController();
  TextEditingController cPerson = TextEditingController();
  RxBool isBookingDetailsLoad = false.obs;
  RxBool timeVisible = false.obs;
  bool selected = false;
  RxString date = DateTime.now().toString().obs;
  RxString dateValue = DateTime.now().toString().obs;
  RxString dateValueApi = DateTime.now().toString().obs;
  RxString cDay = DateTime.now().toString().obs;
  RxString initialDate = DateTime.now().toString().obs;
  RxString day = ''.obs;
  RxString message = ''.obs;

  Rx<RxList<TimeModel>> times = RxList<TimeModel>.empty().obs;
  Rx<RxList<TimeModel>> timesMainList = RxList<TimeModel>.empty().obs;
  Rx<RxList<ClubHour>> mainList = RxList<ClubHour>.empty().obs;
  Rx<RxList<TableRow>> tableList = RxList<TableRow>.empty().obs;

  RxInt? adultValue = 0.obs;
  RxInt? childrenValue = 0.obs;
  RxInt? babiesValue = 0.obs;

  RxInt? listIndex = 0.obs;

  CarouselController carouselController = CarouselController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    DateTime now = DateTime.now();
    // cDate.text = DateFormat('yyyy-MM-dd – hh:mm').format(now);
    cDate.text = DateFormat('dd/MM/yyyy').format(DateTime.now()).toString();
    date.value = DateFormat('dd/MM/yyyy').format(DateTime.now()).toString();
    dateValue.value =
        DateFormat('yyyy-MM-dd').format(DateTime.now()).toString();
    dateValueApi.value =
        DateFormat('dd-MM-yyyy').format(DateTime.now()).toString();
    cDay.value = DateFormat('EEEE').format(DateTime.now()).toString();
    day.value = DateFormat('EEEE').format(DateTime.now()).toString();

    times.value.clear();
    timesMainList.value.clear();
    callBookingDetailsApi();
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

  void selectionChanged(DateRangePickerSelectionChangedArgs args) {
    SchedulerBinding.instance!.addPostFrameCallback((duration) {
      initialDate.value = args.value.toString();
      debugPrint('args is ${args.value}');
      date.value = DateFormat('dd/MM/yyyy').format(args.value).toString();
      dateValue.value = DateFormat('yyyy-MM-dd').format(args.value).toString();
      dateValueApi.value =
          DateFormat('dd-MM-yyyy').format(args.value).toString();
      day.value = DateFormat('EEEE').format(args.value).toString();
      debugPrint('date is ${date.value}');
      debugPrint('date is ${day.value}');
    });
  }

  void mainLogicTime() {
    times.value.clear();
    timesMainList.value.clear();
    selected = false;
    if(clubDetailsMutableDetails.value[0].sectionTime == 1) {
      for (var i = 0;
      i < clubDetailsMutableDetails.value[0].clubHours!.length;
      i++) {
        if (cDay.value ==
            clubDetailsMutableDetails.value[0].clubHours![i].days![0]) {
          for (var j = 0;
          j < clubDetailsMutableDetails.value[0].clubHours![i].time!.length;
          j++) {

              times.value.addAll({
                TimeModel(
                    selected: false.obs,
                    title: clubDetailsMutableDetails
                        .value[0].clubHours![i].time![j].obs,
                    maintanance: clubDetailsMutableDetails
                        .value[0].clubHours![i].maintenance![j].maintenance!
                        .obs)
              });

              timesMainList.value.addAll({
                TimeModel(
                    selected: false.obs,
                    title: clubDetailsMutableDetails
                        .value[0].clubHours![i].time![j].obs,
                    maintanance: clubDetailsMutableDetails
                        .value[0].clubHours![i].maintenance![j].maintenance!
                        .obs)
              });

              debugPrint("timeValue ${times} ${timesMainList}");

          }
        }
      }
    }else{
    for (var i = 0;
        i < clubDetailsMutableDetails.value[0].clubHours!.length;
        i++) {
      if (cDay.value ==
          clubDetailsMutableDetails.value[0].clubHours![i].days![0]) {
        for (var j = 0;
        j < clubDetailsMutableDetails.value[0].clubHours![i].time!.length;
        j++) {
          if (j == 0) {
            times.value.add(TimeModel(
                selected: true.obs,
                title: clubDetailsMutableDetails
                    .value[0].clubHours![i].time![j].obs,
                maintanance: clubDetailsMutableDetails
                    .value[0].clubHours![i].maintenance![j].maintenance!.obs));
          } else {
            times.value.addAll({
              TimeModel(
                  selected: false.obs,
                  title: clubDetailsMutableDetails
                      .value[0].clubHours![i].time![j].obs,
                  maintanance: clubDetailsMutableDetails
                      .value[0].clubHours![i].maintenance![j].maintenance!.obs)
            });
          }
          var splitted = clubDetailsMutableDetails.value[0].clubHours![i]
              .time![j].split('-');
          var splittedOne = splitted[0].split(":");
          var splittedTwo = splitted[1].split(":");
          if (int.parse(splittedTwo[0]) == 24) {
            splittedTwo[0] = "24";
            debugPrint("end value is ${splittedTwo[0]}");
          }
          var difference = int.parse(splittedTwo[0]) -
              int.parse(splittedOne[0]);

          debugPrint(
              'timePeriod  $splitted - ${splittedOne[0]} - ${splittedTwo[0]} - $difference');
          int startTime = int.parse(splittedOne[0]);
          for (int k = 0; k < difference; k++) {
            timesMainList.value.add(TimeModel(
                selected: selected.obs,
                title: '$startTime:00 - ${startTime + 1}:00'.obs,
                maintanance: 0.obs));
            selected = false;
            startTime = startTime + 1;
          }
        }
      }
    }
    }

    debugPrint('controller.times.value.isEmpty ${times.value.isEmpty}');
    if (times.value.isEmpty) {
      timeVisible.value = true;
    } else {
      timeVisible.value = false;
    }
  }

  void addTableValue() {
    mainList.value.clear();
    tableList.value.clear();
    mainList.value.addAll(clubDetailsMutableDetails.value[0].clubHours!);
    tableList.value.add(
      TableRow(
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(color: cLightGreyBorder),
            right: BorderSide(color: cLightGreyBorder),
            //  bottom: BorderSide(color: Colors.grey),
          ),
        ),
        children: [
          Container(
            height: h * 0.05,
            alignment: Alignment.center,
            child: Text(
              'days'.tr,
              style: AppStyle.textStyleFamilyRobotoRegular,
            ),
          ),
          Container(
            height: h * 0.05,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(color: cLightGreyBorder),
                right: BorderSide(color: cLightGreyBorder),
              ),
            ),
            child: Text(
              'opening_hours'.tr,
              style: AppStyle.textStyleFamilyRobotoRegular,
            ),
          ),
          Container(
            height: h * 0.05,
            alignment: Alignment.center,
            child: Text(
              'charge'.tr,
              style: AppStyle.textStyleFamilyRobotoRegular,
            ),
          ),
        ],
      ),
    );

    tableList.value.addAll(
      mainList.value.map((e) => TableRow(
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(color: cLightGreyBorder),
                  right: BorderSide(color: cLightGreyBorder),
                  top: BorderSide(color: cLightGreyBorder),
                ),
              ),
              children: [
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(top: h * 0.012, bottom: h * 0.012),
                  decoration: BoxDecoration(
                      border: Border(
                    left: BorderSide(color: cLightGreyBorder),
                  )),
                  child: Text(e.days![0].toLowerCase().tr),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: e.time!
                      .map((e) => Container(
                            width: double.infinity,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border: Border(
                                left: BorderSide(color: cLightGreyBorder),
                                right: BorderSide(color: cLightGreyBorder),
                              ),
                            ),
                            padding: EdgeInsets.only(
                                top: h * 0.012, bottom: h * 0.012),
                            child: Text(e),
                          ))
                      .toList(),
                ),
                Column(
                  children: e.charge!
                      .map((e) => Padding(
                            padding: EdgeInsets.only(
                                top: h * 0.012, bottom: h * 0.012),
                            child: Text(String.fromCharCodes(Runes('\u0024')) +
                                e.toString()),
                          ))
                      .toList(),
                ),
              ])),
    );

    tableList.value.add(
      TableRow(
        children: [
          Stack(
            children: [
              Container(
                height: 2,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    border: Border.all(color: cLightGreyBorder),
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(15))),
              ),
              Positioned(
                left: 1.2,
                right: 0.9,
                child: Container(
                  color: cBackground,
                  height: 1,
                ),
              ),
            ],
          ),
          Stack(
            children: [
              Container(
                height: 2,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: cLightGreyBorder),
                    bottom: BorderSide(color: cLightGreyBorder),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                child: Container(
                  color: cBackground,
                  height: 1,
                ),
              ),
            ],
          ),
          Stack(
            children: [
              Container(
                height: 2,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(color: cLightGreyBorder),
                  borderRadius:
                      const BorderRadius.only(bottomRight: Radius.circular(15)),
                ),
              ),
              Positioned(
                left: 0.9,
                right: 1,
                child: Container(
                  color: cBackground,
                  height: 1,
                ),
              ),
            ],
          ),
        ],
      ),
    );

    // tableList.value.addAll(mainList.value.map((e) => TableRow(children: [
    //   Container(
    //     alignment: Alignment.center,
    //     child: Text(e.days![0]),
    //   ),
    //   Column(
    //     crossAxisAlignment: CrossAxisAlignment.center,
    //     children: e.time!
    //         .map((e) => Container(
    //       width: double.infinity,
    //       alignment: Alignment.center,
    //       /*decoration: BoxDecoration(
    //                 border: Border(
    //                   left: BorderSide(color: Colors.grey),
    //                   right: BorderSide(color: Colors.grey),
    //                 ),
    //               ),*/
    //       child: Text(e),
    //     ))
    //         .toList(),
    //   ),
    //   Column(
    //     children: e.charge!
    //         .map((e) => Container(
    //       child: Text(e.toString()),
    //     ))
    //         .toList(),
    //   ),
    // ])));
  }

  Future<ClubDetailsModel?> callBookingDetailsApi() async {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      ProgressDialogUtils.showProgressDialog(Get.context);
    });
    int clubId = await Preference().readInt(Const.prefClubId);
    String token = await Preference().read(Const.prefAPIToken);
    String language = await Preference().read(Const.prefLanguage);
    debugPrint('language => value  :${language}');
    BookingDetailsProvider().callClubDetails(token, language, clubId).then(
        (value) async {
      final clubDetailsList = ClubDetailsModel.fromJson(value);

      if (clubDetailsList.status == 1) {
        // clubDetailsMutableList.value.clear();
        clubDetailsMutableDetails.value.addAll(clubDetailsList.clubData!);
        mainLogicTime();
        addTableValue();

        if (clubDetailsList.clubData!.isEmpty) {
          isBookingDetailsLoad.value = true;
        }
        change(value, status: RxStatus.success());
        WidgetsBinding.instance?.addPostFrameCallback((_) {
          ProgressDialogUtils.hideProgressDialog();
        });
      } else {
        isBookingDetailsLoad.value = true;
        message.value = clubDetailsList.message.toString();
        // Const().toast(clubDetailsList.message);
        WidgetsBinding.instance?.addPostFrameCallback((_) {
          ProgressDialogUtils.hideProgressDialog();
        });
      }
    }, onError: (error) {

      WidgetsBinding.instance?.addPostFrameCallback((_) {
        ProgressDialogUtils.hideProgressDialog();
      });
      debugPrint("Get Club Details Api => error : $error");
      change(null, status: RxStatus.error(error.toString()));
    });
  }

  Future<ClubDetailsModel?> callClubBookingApi(String date, String time,
      String adult, String children, String babies) async {
    var deviceToken = await FirebaseMessaging.instance.getToken();
    // WidgetsBinding.instance?.addPostFrameCallback((_) {
    //   ProgressDialogUtils.showProgressDialog(Get.context);
    // });
    int userId = await Preference().readInt(Const.prefUserId);
    int clubId = await Preference().readInt(Const.prefClubId);
    String token = await Preference().read(Const.prefAPIToken);
    String language = await Preference().read(Const.prefLanguage);

    debugPrint('language booking => value  :${language} ${userId} ${clubId} ${date} ${time} ${adult} ${children} ${babies} ${deviceToken}');
    BookingDetailsProvider()
        .callClubBooking(token, language, userId, clubId, date, time, adult,
            children, babies,deviceToken!)
        .then((value) async {
      final clubBookingResponse = ClubBookingModel.fromJson(value);
      change(value, status: RxStatus.success());
      // WidgetsBinding.instance?.addPostFrameCallback((_) {
      //   ProgressDialogUtils.hideProgressDialog();
      // });
      if (clubBookingResponse.status == 1) {
        dialogBookSuccessfully(
          Get.context!,
          'booked_successfully'.tr,
          'pay_by_date'.tr,
          'back_dialog'.tr,
          'reservation_record'.tr,
          () {
            // reservationController.callReservationClubList();
            Get.back();
            // Const().toast(reservationClubListResponse.message);
          },
          () {
            Get.back();
            Get.toNamed(AppRoute.reservationRecordsScreen, arguments: {
              NavigationArgs.navigationTabBooking: Const.thirdTabBooking,
            });
          },
        );

        // clubDetailsMutableList.value.clear();
        // clubDetailsMutableDetails.value.addAll(clubDetailsList.clubData!);
        // mainLogicTime();
        //
        // if(clubDetailsList.clubData!.isEmpty){
        //   isBookingDetailsLoad.value = true;
        // }

      } else {
        Const().toast(clubBookingResponse.message);
        WidgetsBinding.instance?.addPostFrameCallback((_) {
          ProgressDialogUtils.hideProgressDialog();
        });
      }
    }, onError: (error) {
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        ProgressDialogUtils.hideProgressDialog();
      });
      debugPrint("Get Booking Api => error : $error");
      change(null, status: RxStatus.error(error.toString()));
    });
  }
}
