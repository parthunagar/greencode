import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greencode/app_route/NavigationArgs.dart';
import 'package:greencode/constant/app_constant.dart';
import 'package:greencode/screen/easy_living_details/category_bus_details/category_bus_details_model.dart';
import 'package:greencode/screen/easy_living_details/category_bus_details/category_bus_details_provider.dart';
import 'package:greencode/utils/preference.dart';
import 'package:greencode/widget/progress_dialog_utils.dart';
import 'package:url_launcher/url_launcher.dart';

class CategoryBusDetailsController extends GetxController
    with StateMixin<dynamic> {
  RxString easyLivingTitle = ''.obs;
  RxInt busStationId = 0.obs;
  RxBool isEasyLivingDetailsLoad = false.obs;
  RxBool isDataLoad = false.obs;
  RxString messageValue = ''.obs;
  List<String> labelList = [
    'label1'.tr,
    'label2'.tr,
    'label3'.tr,
    'label4'.tr,
  ];
  List<String> phoneList = [
    '27454466',
    '28730818',
    '21368888',
    '28042600',
  ];
  List<String> linkList = [
    'http://www.kmb.hk/',
    'http://www.nwstbus.com.hk/',
    'http://www.nwstbus.com.hk/',
    'http://www.td.gov.hk/',
  ];


  CarouselController carouselController = CarouselController();
  Rx<BusDetailsData> busDetailsData = BusDetailsData().obs;

  void launchUrl(String url) async {
    if (!await launch(url)) throw 'Could not launch $url';
  }

  GlobalKey<ScaffoldState> scaffoldKeyBus =
      GlobalKey<ScaffoldState>(debugLabel: 'scaffoldKeyBus');

  void openDrawer() {
    scaffoldKeyBus.currentState?.openEndDrawer();
  }

  void closeDrawer() {
    Get.back();
    // FocusScope.of(Get.context!).unfocus();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    easyLivingTitle.value =
        Get.arguments[NavigationArgs.navigationEasyLivingTitle];
    busStationId.value = Get.arguments[NavigationArgs.navigationBusStationId];
    callApiForBusDetails();
  }

  Future<BusDetailsModel?> callApiForBusDetails() async {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      ProgressDialogUtils.showProgressDialog(Get.context);
    });
    String token = await Preference().read(Const.prefAPIToken);
    String language = await Preference().read(Const.prefLanguage);
    debugPrint('language => value  :${language}');
    CategoryBusDetailsProvider()
        .getBusDetails(token, language, busStationId.value)
        .then((value) async {
      final busDetailsResponse = BusDetailsModel.fromJson(value);
      change(value, status: RxStatus.success());
      if (busDetailsResponse.status == 1) {
        WidgetsBinding.instance?.addPostFrameCallback((_) {
          ProgressDialogUtils.hideProgressDialog();
        });

        busDetailsData.value = busDetailsResponse.busDetailsData!;
        if (busDetailsData.value.categoryDetails!.isNotEmpty) {
          isEasyLivingDetailsLoad.value = true;
          isDataLoad.value = false;
        }else{
          isDataLoad.value = true;
          isEasyLivingDetailsLoad.value = false;
        }

      } else {
        WidgetsBinding.instance?.addPostFrameCallback((_) {
          ProgressDialogUtils.hideProgressDialog();
        });
        isEasyLivingDetailsLoad.value = true;
        isDataLoad.value = true;
        messageValue.value = busDetailsResponse.message.toString();
        // Const().toast(busDetailsResponse.message);
      }
    }, onError: (error) {
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        ProgressDialogUtils.hideProgressDialog();
      });
      debugPrint("Get Bus Details Api => error : $error");
      change(null, status: RxStatus.error(error.toString()));
    });
  }
}
