import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greencode/app_route/NavigationArgs.dart';
import 'package:greencode/constant/app_constant.dart';
import 'package:greencode/screen/easy_living_details/category_bus_station_list/category_bus_station_list_provider.dart';
import 'package:greencode/utils/preference.dart';
import 'package:greencode/widget/progress_dialog_utils.dart';
import 'package:url_launcher/url_launcher.dart';

import 'category_bus_station_list_model.dart';

class CategoryBusStationController extends GetxController with StateMixin<dynamic> {
  RxString easyLivingTitle = ''.obs;
  RxBool isBusStationListLoad = false.obs;
  RxString message = ''.obs;
  Rx<RxList<BusStationDatum>> busStationMutableList =
      RxList<BusStationDatum>.empty().obs;

  CarouselController carouselController = CarouselController();
  GlobalKey<ScaffoldState> scaffoldKeyBusStationList = GlobalKey<ScaffoldState>(debugLabel: 'scaffoldKeyBusStationList');
  RxInt? findIndex = 10000.obs;

  void openDrawer() {
    scaffoldKeyBusStationList.currentState?.openEndDrawer();
  }



  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    easyLivingTitle.value = Get.arguments[NavigationArgs.navigationEasyLivingTitle];
    callApiForGetBusStationList();
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

  Future<BusStationListModel?> callApiForGetBusStationList() async {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      ProgressDialogUtils.showProgressDialog(Get.context);
    });
    String token = await Preference().read(Const.prefAPIToken);
    String language =await Preference().read(Const.prefLanguage);
    debugPrint('language => value  :${language}');
    CategoryBusStationListInfoProvider().getBusStationList(token, language).then((value) async {

      final essentialListResponse = BusStationListModel.fromJson(value);
      change(value, status: RxStatus.success());
      if (essentialListResponse.status == 1) {
        WidgetsBinding.instance?.addPostFrameCallback((_) {
          ProgressDialogUtils.hideProgressDialog();
        });
        busStationMutableList.value.clear();
        busStationMutableList.value.addAll(essentialListResponse.busStationData!);
        if(busStationMutableList.value[0].stationList!.isEmpty){
          isBusStationListLoad.value = true;
        }

      } else {
        isBusStationListLoad.value = true;
        message.value = essentialListResponse.message.toString();
        WidgetsBinding.instance?.addPostFrameCallback((_) {
          ProgressDialogUtils.hideProgressDialog();
        });
        // Const().toast(essentialListResponse.message);
      }
    }, onError: (error) {
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        ProgressDialogUtils.hideProgressDialog();
      });
      debugPrint("Get Advertisement Api => error : $error");
      change(null, status: RxStatus.error(error.toString()));
    });
  }
}
