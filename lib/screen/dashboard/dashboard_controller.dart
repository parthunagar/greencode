import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:greencode/app_route/NavigationArgs.dart';
import 'package:greencode/app_route/app_route.dart';
import 'package:greencode/constant/app_constant.dart';
import 'package:greencode/constant/app_image.dart';
import 'package:greencode/main.dart';
import 'package:greencode/screen/booking/booking_controller.dart';
import 'package:greencode/screen/estate_fund_types/estate_fund_list_model.dart';
import 'package:greencode/screen/estate_info/estate_info_model.dart';
import 'package:greencode/screen/estate_info/estate_info_provider.dart';
import 'package:greencode/screen/home/home_controller.dart';
import 'package:greencode/screen/home/home_model.dart';
import 'package:greencode/screen/home/home_provider.dart';
import 'package:greencode/screen/notification/notification_controller.dart';
import 'package:greencode/screen/qr_code/qr_code_controller.dart';
import 'package:greencode/utils/preference.dart';
import 'package:greencode/widget/localization_service.dart';
import 'package:greencode/widget/progress_dialog_utils.dart';
import 'package:permission_handler/permission_handler.dart';

import 'dashboard_provider.dart';
import 'dart:convert';

enum DrawerEnum { myAccount, eResidentCard, setting, review, callUs }

// class DashboardController extends GetxController with StateMixin<dynamic> {
class DashboardController extends FullLifeCycleController
    with FullLifeCycleMixin {
  RxInt tabIndex = 0.obs;

  var scaffoldKey = GlobalKey<ScaffoldState>(debugLabel: 'scaffoldKey');

  void openDrawer() {
    scaffoldKey.currentState?.openEndDrawer();
  }

  void closeDrawer() {
    Get.back();
    // FocusScope.of(Get.context!).unfocus();
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

  Future<void> navigateToNotice(String noticeDocument) async {
    debugPrint('navigateToNotice => $noticeDocument');
    Get.toNamed(AppRoute.noticeDetailsScreen, arguments: {
      NavigationArgs.navigationEstateNoticeLink: noticeDocument,
    });
    var prefNotificationRoutesSet =
        await Preference().readBool(Const.prefNotificationRoutesSet);
    debugPrint(
        'onInit => prefNotificationRoutesSet : $prefNotificationRoutesSet');
    if (prefNotificationRoutesSet == true) {
      await Preference().saveBool(Const.prefNotificationRoutesSet, false);
    }
  }

  Future<void> navigateBooking() async {
    bool prefNotificationRoutesSet;
    try {
      prefNotificationRoutesSet =
          await Preference().readBool(Const.prefNotificationRoutesSet);
      debugPrint(
          'onInit => prefNotificationRoutesSet : $prefNotificationRoutesSet');

        Get.toNamed(AppRoute.reservationRecordsScreen, arguments: {
          NavigationArgs.navigationTabBooking: Const.thirdTabBooking,
        });
        await Preference().saveBool(Const.prefNotificationRoutesSet, false);

    } catch (e) {
      debugPrint('prefNotificationRoutesSet => ERROR : $e');
    }
  }

  void changeTabIndex(int index) async {
    tabIndex.value = index;

    if (index == 1) {
      debugPrint('Qr Code Click $index');
      final logic = Get.find<QrCodeController>();
      logic.checkQrResult!.value = false;

      var status = await Permission.camera.status;
      if (status.isDenied) {
        Permission.camera.request();
      }
    } else if (index == 2) {
      debugPrint('Booking Click $index');
      final logic = Get.find<BookingController>();
      logic.callClubList();
    } else if (index == 3) {
      debugPrint('Notification Click $index');
      final logic = Get.find<NotificationController>();
      logic.callNotificationList();
    } else {
      debugPrint('Home Click $index');
      final logic = Get.find<HomeController>();
      logic.callGetAdvertisementListApi();
      logic.callCurrentApi();
      logic.callGetTomorrowWhether();
    }

    // if(index == 0) {
    //   cu
    // }
    // else if(index == 1){
    //   Get.toNamed(AppRoute.qrCodeScreen);
    // }else if(index == 2){
    //   Get.toNamed(AppRoute.bookingScreen);
    // }else{
    //   Get.toNamed(AppRoute.notificationScreen);
    // }
    update();
  }

  Future<SignOutModel?> callChangeLanguageApi() async {
    // ProgressDialogUtils.showProgressDialog(Get.context);
    int userId = await Preference().readInt(Const.prefUserId);
    String language = await Preference().read(Const.prefLanguage);
    DashboardProvider()
        .callChangeLanguageApi(
            userId, language, await Preference().read(Const.prefAPIToken))
        .then((value) async {
      final signOut = SignOutModel.fromJson(value);
      // change(value, status: RxStatus.success());
      if (signOut.status == 1) {
        // ProgressDialogUtils.hideProgressDialog();
      } else {
        // ProgressDialogUtils.hideProgressDialog();
        // Const().toast(signOut.message);
      }
    }, onError: (error) {
      ProgressDialogUtils.hideProgressDialog();
      debugPrint("Change Language Api => error : $error");
      // change(null, status: RxStatus.error(error.toString()));
    });
  }

  Future<SignOutModel?> callLogOutApi() async {
    ProgressDialogUtils.showProgressDialog(Get.context);
    DashboardProvider()
        .callLogOut(await Preference().read(Const.prefAPIToken))
        .then((value) async {
      final signOut = SignOutModel.fromJson(value);
      // change(value, status: RxStatus.success());
      if (signOut.status == 1) {
        ProgressDialogUtils.hideProgressDialog();
        Const().toast('logOut_successfully'.tr);
        var userDefaultLanguage = await Preference().read(Const.prefLangName);
        debugPrint('Lanaguage Change logout ${userDefaultLanguage}');
        await Preference().clear();
        await Preference().saveBool(Const.prefIsLoggedIn, false);
        if (userDefaultLanguage == LocalLanguages.langChinese) {
          Get.updateLocale(LocalizationService.fallbackLocale);
          await Preference()
              .save(Const.prefLangName, LocalLanguages.langChinese);
          await Preference()
              .save(Const.prefLanguage, Const.prefLangCodeChinese);
        } else if (userDefaultLanguage == LocalLanguages.langSimplified) {
          Get.updateLocale(LocalizationService.simplifiedLocale);
          await Preference()
              .save(Const.prefLangName, LocalLanguages.langSimplified);
          await Preference()
              .save(Const.prefLanguage, Const.prefLangCodeSimplified);
        } else {
          Get.updateLocale(LocalizationService.locale);
          await Preference()
              .save(Const.prefLangName, LocalLanguages.langEnglish);
          await Preference()
              .save(Const.prefLanguage, Const.prefLangCodeEnglish);
        }
        // Get.updateLocale(LocalizationService.fallbackLocale);
        Get.offAllNamed(AppRoute.registerScreen);
      } else {
        ProgressDialogUtils.hideProgressDialog();
        Const().toast(signOut.message);
      }
    }, onError: (error) {
      ProgressDialogUtils.hideProgressDialog();
      debugPrint("LogOut Api => error : $error");
      // change(null, status: RxStatus.error(error.toString()));
    });
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    final android = AndroidInitializationSettings('@mipmap/ic_launcher');
    final iOS = IOSInitializationSettings();
    final initSettings = InitializationSettings(android: android, iOS: iOS);

    flutterLocalNotificationsPlugin!.initialize(initSettings, onSelectNotification: onSelectNotification);

    setupInteractedMessage();

    FirebaseMessaging.onMessage.listen((message) async {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;

      if (notification != null && android != null && !kIsWeb) {
        String action = jsonEncode(message.data);

        flutterLocalNotificationsPlugin!.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel!.id,
                channel!.name,
                channelDescription: channel!.description,
                priority: Priority.high,
                importance: Importance.max,
                setAsGroupSummary: true,
                styleInformation: DefaultStyleInformation(true, true),
                largeIcon: DrawableResourceAndroidBitmap('@mipmap/ic_launcher'),
                channelShowBadge: true,
                autoCancel: true,
                icon: '@mipmap/ic_launcher',
              ),
            ),
            payload: action);
      }
    });

    FirebaseMessaging.onMessageOpenedApp
        .listen((message) => _handleMessage(message.data));

    callChangeLanguageApi();
  }

  Future<dynamic> onSelectNotification(payload) async {
    Map<String, dynamic> action = jsonDecode(payload);
    _handleMessage(action);
  }

  Future<void> setupInteractedMessage() async {
    await FirebaseMessaging.instance
        .getInitialMessage()
        .then((value) {

      _handleMessage(value != null ? value.data : Map());
      // value = null;

    } );
  }

  void _handleMessage(Map<String, dynamic> data) {
    print('_handleMessage : ${data['type']}');
    print('_handleMessage : ${data['document']}');
    if (data['type'] != null) {
      if (data['type'].toLowerCase()=='booking') {
        try {
          // if(payload[0].toString().toLowerCase() == 'notice'){}
          // final logic = Get.find<DashboardController>();
          changeTabIndex(2);
          navigateBooking();
        } catch (e) {
          debugPrint('onSelectNotification => ERROR : $e');
        }
      } else if(data['type'].toLowerCase()=='notice'){
        try {
          // if(payload[0].toString().toLowerCase() == 'notice'){}
          // final logic = Get.find<DashboardController>();
          changeTabIndex(0);
          // var documents = '';
          // var document = '';
          // RegExp exp =
          //     new RegExp(r'(?:(?:https?|ftp):\/\/)?[\w/\-?=%.]+\.[\w/\-?=%.]+');
          // Iterable<RegExpMatch> matches = exp.allMatches(data.entries.toString());
          //
          // matches.forEach((match) {
          //   documents = data.entries.toString().substring(match.start, match.end);
          //   debugPrint(data.entries.toString().substring(match.start, match.end));
          // });
          //
          // document = documents;
          debugPrint(data['document']);
          navigateToNotice(data['document']);
        } catch (e) {
          debugPrint('onSelectNotification => ERROR : $e');
        }
      }else{}
    }
    // if (data['redirect'] == "product") {
    //   // Navigator.push(
    //   //     context,
    //   //     MaterialPageRoute(
    //   //         builder: (context) => ProductPage(message: data['message'])));
    // } else if (data['redirect'] == "product_details") {
    //   // Navigator.push(
    //   //     context,
    //   //     MaterialPageRoute(
    //   //         builder: (context) =>
    //   //             ProductDetailsPage(message: data['message'])));
    // }
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();

    // var one = Get.arguments;
    // debugPrint ("one is $one");
    // // bool isChecked = NavigationArgs.navigationTabBookingIndex == null;
    // tabIndex.value = one == null ? 0 : Get.arguments[NavigationArgs.navigationTabBookingIndex] ;
    // isEmpty(NavigationArgs.navigationTabBookingIndex);
    // if (dairy != null) {
    // if (NavigationArgs.navigationTabBookingIndex ! =  null) {
    //   tabIndex.value = Get.arguments[NavigationArgs.navigationTabBookingIndex];
    // }else{
    //   tabIndex.value = 0;
    // }
    // bool isEmpty;(Get.arguments[NavigationArgs.navigationTabBookingIndex].toString());
    // debugPrint('Get.arguments[NavigationArgs.navigationTabBookingIndex] ' +
    //     Get.arguments[NavigationArgs.navigationTabBookingIndex].toString());
    // int? a = Get.arguments[NavigationArgs.navigationTabBookingIndex];
    // tabIndex.value = a ?? 0 ;
  }

  bool isEmpty(String string) => string.length == 0;

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  @override
  void onDetached() {
    // TODO: implement onDetached
  }

  @override
  void onInactive() {
    // TODO: implement onInactive
  }

  @override
  void onPaused() {
    // TODO: implement onPaused
  }

  @override
  void onResumed() {
    // TODO: implement onResumed
    final logic = Get.find<HomeController>();
    logic.callGetAdvertisementListApi();
    logic.callGetTomorrowWhether();
    logic.callCurrentApi();
  }
}
