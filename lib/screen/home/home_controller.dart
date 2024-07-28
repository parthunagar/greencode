import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:greencode/app_route/app_route.dart';
import 'package:greencode/constant/app_constant.dart';
import 'package:greencode/constant/app_image.dart';
import 'package:greencode/constant/colors.dart';
import 'package:greencode/screen/home/home_model.dart';
import 'package:greencode/utils/preference.dart';
import 'package:greencode/widget/progress_dialog_utils.dart';
import 'package:url_launcher/url_launcher.dart';

import 'home_provider.dart';

class HomeController extends GetxController with StateMixin<dynamic> {
  RxInt? selectedIndex = 0.obs;
  Rx<RxList<AdvertiseData>> advertisementList =
      RxList<AdvertiseData>.empty().obs;
  Rx<RxList<Widget>> children = RxList<Widget>.empty().obs;
  Rx<Color> background = Colors.white.obs;
  Rx<Color> iconColor = cBrown.obs;
  Rx<bool> changeBg = false.obs;
  Rx<Color> backgroundBooking = Colors.white.obs;
  Rx<Color> iconColorBooking = cBrown.obs;
  Rx<bool> changeBgBooking = false.obs;
  Rx<Color> backgroundEasyLiving = Colors.white.obs;
  Rx<Color> iconColorEasyLiving = cBrown.obs;
  Rx<bool> changeBgEasyLiving = false.obs;
  Rx<Color> backgroundMyAccount = Colors.white.obs;
  Rx<Color> iconColorMyAccount = cBrown.obs;
  Rx<bool> changeBgMyAccount = false.obs;
  Rx<Color> backgroundEResidenceCard = Colors.white.obs;
  Rx<Color> iconColorEResidenceCard = cBrown.obs;
  Rx<bool> changeBgEResidenceCard = false.obs;
  Rx<Color> backgroundNotification = Colors.white.obs;
  Rx<Color> iconColorNotification = cBrown.obs;
  Rx<bool> changeBgMyNotification = false.obs;

  RxString minTemp = ''.obs;
  RxString maxTemp = ''.obs;
  RxString currentTemp = ''.obs;
  RxInt iconValue = 52.obs;

  RxString languageKey = ''.obs;
  // RxInt tabIndex = 0.obs;
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
    // languageKey.value = await Preference().read(Const.prefLanguage);

    super.onInit();
    // getPrefData();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    callGetTomorrowWhether();
    callCurrentApi();
    callGetAdvertisementListApi();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void launchUrl(String url) async {
    if (!await launch(url)) throw 'Could not launch $url';
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
        color: Colors.black,
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



  Future<AdvertisementModel?> callCurrentApi() async {
    languageKey.value = await Preference().read(Const.prefLanguage);
    String token = await Preference().read(Const.prefAPIToken);
    debugPrint('languageKey => token : ${languageKey.value}');
    HomeProvider().currentTempratureApi().then((value) async {
      final tempratureData = CurrentTempratureModel.fromJson(value);
      // debugPrint('advertisement => token : ${tempratureData.data}');
      for(int j=0;j<tempratureData.temperature.data.length;j++){
        if(tempratureData.temperature.data[j].place.toLowerCase() == 'tai po'){
          currentTemp.value = tempratureData.temperature.data[j].value.toString();
        }

      }
      // currentTemp.value = tempratureData.temperature.data.;
      // maxTemp.value = tempratureData.weatherForecast[0].forecastMaxtemp!.value.toString();
      iconValue.value = tempratureData.icon[0];
      debugPrint('icon_value ===============callCurrentApi: ${currentTemp.value}');
      change(value, status: RxStatus.success());

    }, onError: (error) {
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        ProgressDialogUtils.hideProgressDialog();
      });
      debugPrint("LogOut Api => error : $error");
      change(null, status: RxStatus.error(error.toString()));
    });
  }
  Future<AdvertisementModel?> callGetTomorrowWhether() async {
    languageKey.value = await Preference().read(Const.prefLanguage);
    String token = await Preference().read(Const.prefAPIToken);
    debugPrint('languageKey => token : ${languageKey.value}');
    HomeProvider().tempratureApi().then((value) async {
      final tempratureData = Temprature.fromJson(value);
      // debugPrint('advertisement => token : ${tempratureData.data}');

      minTemp.value = tempratureData.weatherForecast[0].forecastMintemp!.value.toString();
      maxTemp.value = tempratureData.weatherForecast[0].forecastMaxtemp!.value.toString();
      // iconValue.value = tempratureData.weatherForecast[0].forecastIcon!;
      debugPrint('icon_value ===============: ${iconValue.value}');
      change(value, status: RxStatus.success());

    }, onError: (error) {
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        ProgressDialogUtils.hideProgressDialog();
      });
      debugPrint("LogOut Api => error : $error");
      change(null, status: RxStatus.error(error.toString()));
    });
  }

  Future<AdvertisementModel?> callGetAdvertisementListApi() async {
    advertisementList.value.clear();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      ProgressDialogUtils.showProgressDialog(Get.context);
    });
    languageKey.value = await Preference().read(Const.prefLanguage);
    String token = await Preference().read(Const.prefAPIToken);
    debugPrint('languageKey => token : ${languageKey.value}');
    HomeProvider().callAdvertisementList(token, languageKey.value).then((value) async {
      final advertisementListData = AdvertisementModel.fromJson(value);
      debugPrint('advertisement => token : ${advertisementListData.data}');
      change(value, status: RxStatus.success());
      if (advertisementListData.status == 1) {
        WidgetsBinding.instance?.addPostFrameCallback((_) {
          ProgressDialogUtils.hideProgressDialog();
        });

        advertisementList.value.clear();
        advertisementList.value.addAll(advertisementListData.data!);
        // if(advertisementList.value.isEmpty) {
        //   children.value.add(
        //     const SizedBox()
        //   );
        // }
        //else {
        children.value.clear();
        for (var item in advertisementList.value) {
          debugPrint('SaveSignInDate => advertiseImage : ${item.advertiseImage}');
          children.value.add(
            GestureDetector(
              onTap: (){
                launchUrl(item.advertiseLink.toString());
              },
              child: Container(
                // height: 50,
                decoration: BoxDecoration(
                  // color: Colors.red[100],
                    border: Border.all(color: cBlack),
                    borderRadius:  const BorderRadius.all(Radius.circular(10)),
                    image: DecorationImage(

                        image: NetworkImage(item.advertiseImage,),//fit: BoxFit.cover
                        fit: BoxFit.fill
                    )
                ),
                // child: Image.network(item.advertiseImage,fit: BoxFit.cover,),
              ),
            ),
          );
        }
      } else {
        WidgetsBinding.instance?.addPostFrameCallback((_) {
          ProgressDialogUtils.hideProgressDialog();
        });
        Const().toast(advertisementListData.message);
      }
    }, onError: (error) {
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        ProgressDialogUtils.hideProgressDialog();
      });
      debugPrint("LogOut Api => error : $error");
      change(null, status: RxStatus.error(error.toString()));
    });
  }
}
