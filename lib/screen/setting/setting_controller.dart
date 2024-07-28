import 'dart:io';
import 'dart:math';

// import 'dart:math' as Math;

import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greencode/api/api_url.dart';
import 'package:greencode/constant/app_constant.dart';
import 'package:greencode/screen/dashboard/dashboard_controller.dart';
import 'package:greencode/utils/preference.dart';
import 'package:notification_permissions/notification_permissions.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';


// class SettingLogic extends GetxController with StateMixin<dynamic>  {
class SettingLogic extends FullLifeCycleController with FullLifeCycleMixin {


  // GlobalKey<ScaffoldState>? scaffoldKeySetting;


  // Future<PermissionStatus> permissionStatus = NotificationPermissions.getNotificationPermissionStatus();
    RxBool? notificationStatus = false.obs;

    RxString? totalConvertedSize = ''.obs;

    RxString? version = ''.obs;

  Future<String?>? getCheckNotificationPermStatus() {
    return NotificationPermissions.getNotificationPermissionStatus()
        .then((status) {
          debugPrint('getCheckNotificationPermStatus => status : $status');
      switch (status) {
        case PermissionStatus.denied:
          return NotificationStatus.permDenied;
        case PermissionStatus.granted:
          return NotificationStatus.permGranted;
        case PermissionStatus.unknown:
          return NotificationStatus.permUnknown;
        case PermissionStatus.provisional:
          return NotificationStatus.permProvisional;
        default:
          return null;
      }
    });
  }

  setNotificationStatus() {
    getCheckNotificationPermStatus()!.then((statusValue) {
      debugPrint('statusValue : ${statusValue.toString()}');
      if (statusValue == NotificationStatus.permDenied) {
        notificationStatus!.value = false;
      }
      else
      if (statusValue == NotificationStatus.permProvisional) {
        notificationStatus!.value = true;
      }
      else if (statusValue == NotificationStatus.permUnknown) {
        notificationStatus!.value = false;
      }
      else {
        notificationStatus!.value = true;
      }
    });
  }

  // Future callStatus() async {
  //   // AppSettings.openAppSettings().then((value)  {
  //   //   debugPrint('1');
  //   //   setNotificationStatus();
  //   //   debugPrint('2');
  //   // });
  //     AppSettings.openAppSettings();
  // }


  getFileSize(int decimals) async {

    // var a = await getApplicationDocumentsDirectory();
    // var b = await getApplicationSupportDirectory();
    // var c = await getExternalCacheDirectories();
    // var d = getDownloadsDirectory();
    // var e = await getExternalStorageDirectory();
    // var f = await getTemporaryDirectory();
    // var g = await getLibraryDirectory();
    // debugPrint('a : $a');
    // debugPrint('b : $b');
    // debugPrint('c : $c');
    // debugPrint('d : $d');
    // debugPrint('e : $e');
    // debugPrint('f : $f');
    // debugPrint('g : $g');

    var filepath = await getTemporaryDirectory();
    // var filepath =  Directory('/data/user/0/com.app.greencode/cache');// getTemporaryDirectory();
    debugPrint('filepath : $filepath');
    int fileNum = 0;
    int totalSize = 0;
    var dir = Directory(filepath.path);
    try {
      if (dir.existsSync()) {
        dir.listSync(recursive: true, followLinks: false).forEach((FileSystemEntity entity) {
          if (entity is File) {
            fileNum++;
            totalSize += entity.lengthSync();
          }
        });
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    debugPrint("fileNum : ${fileNum.toString()}");
    debugPrint("totalSize : $totalSize");
    const suffixes = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];
    var i = (log(totalSize) / log(1024)).floor();
    totalConvertedSize!.value = (((totalSize / pow(1024, i)).toStringAsFixed(decimals)) + ' ' + suffixes[i]);
    debugPrint("totalConvertedSize : ${totalConvertedSize.toString()}");
  }

  void openDrawer() {
    // final logic = Get.put(DashboardController());
    // logic.scaffoldKeySetting.currentState?.openEndDrawer();
  }

  void launchUrl() async {
    if (!await launch(Api.privacyPolicyUrl)) throw 'Could not launch ${Api.privacyPolicyUrl}';
  }

  void closeDrawer() {
    Get.back();
    FocusScope.of(Get.context!).unfocus();
  }

  getPackageInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String appName = packageInfo.appName;
    String packageName = packageInfo.packageName;
    version!.value = packageInfo.version;
    String buildNumber = packageInfo.buildNumber;
    debugPrint("\n\n =====> getPackageInfo <==== ");
    debugPrint("appName : $appName");
    debugPrint("packageName : $packageName");
    debugPrint("version!.value : ${version!.value}");
    debugPrint("buildNumber : $buildNumber");
    debugPrint(" =====><==== \n\n ");
  }

  RxString? setDefaultLang = ''.obs;
  getPref() async {
    setDefaultLang!.value = await Preference().read(Const.prefLangName);
    debugPrint("setDefaultLang!.value : ${setDefaultLang!.value}");
    // if(setDefaultLang!.value ==  LocalLanguages.langChinese){}
  }

  @override
  void onInit() {
    // TODO: im plement onInit
    super.onInit();
    // scaffoldKeySetting = GlobalKey<ScaffoldState>(debugLabel: 'scaffoldKeySetting');
    getPref();
    setNotificationStatus();
    getFileSize(2);
    getPackageInfo();
    debugPrint(' =====> SettingLogic onInit <===== ');
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    debugPrint(' =====> SettingLogic onReady <===== ');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    // final logic = Get.put(DashboardController());
    // logic.scaffoldKeySetting.currentState!.dispose();
    super.dispose();
    // scaffoldKeySetting = null;
    debugPrint(' =====> SettingLogic dispose <===== ');
  }

  @override
  void $configureLifeCycle() {
    // TODO: implement $configureLifeCycle
    super.$configureLifeCycle();
    debugPrint(' =====> SettingLogic configureLifeCycle <===== ');
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    // scaffoldKeySetting = null;
    debugPrint(' =====> SettingLogic onClose <===== ');
  }

  @override
  void onDetached() {
    // TODO: implement onDetached
    debugPrint(' =====> SettingLogic onDetached <===== ');
  }

  @override
  void onInactive() {
    // TODO: implement onInactive
    debugPrint(' =====> SettingLogic onInactive <===== ');
  }

  @override
  void onPaused() {
    // TODO: implement onPaused
    debugPrint(' =====> SettingLogic onPaused <===== ');

  }

  @override
  void onResumed() {
    // TODO: implement onResumed
    debugPrint(' =====> SettingLogic onResumed <===== ');
    setNotificationStatus();
    getFileSize(2);
  }

}
