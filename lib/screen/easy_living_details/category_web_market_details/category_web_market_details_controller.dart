import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greencode/app_route/NavigationArgs.dart';
import 'package:greencode/constant/app_constant.dart';
import 'package:greencode/screen/easy_living_details/category_web_market_details/category_web_market_details_model.dart';
import 'package:greencode/screen/easy_living_details/category_web_market_details/category_web_market_details_provider.dart';
import 'package:greencode/utils/preference.dart';
import 'package:greencode/widget/progress_dialog_utils.dart';
import 'package:url_launcher/url_launcher.dart';

class CategoryWebMarketDetailsController extends GetxController with StateMixin<dynamic> {


  RxString easyLivingTitle = ''.obs;
  RxBool isPreviousVisible = true.obs;
  RxBool isNextVisible = true.obs;
  RxInt totalLength = 0.obs;
  RxString message = ''.obs;

  RxBool isWetMarketData = false.obs;

  Rx<RxList<WetMarketDatum>> wetMarketDetailsMutableList =
      RxList<WetMarketDatum>.empty().obs;


  GlobalKey<ScaffoldState> scaffoldKeyWetMarketDetails = GlobalKey<ScaffoldState>(debugLabel: 'scaffoldKeyWetMarketDetails');

  void openDrawer() {
    scaffoldKeyWetMarketDetails.currentState?.openEndDrawer();
  }

  void closeDrawer() {
    Get.back();
    FocusScope.of(Get.context!).unfocus();
  }

  RxInt? isDefault = 0.obs;

  void launchUrl(String url) async {
    if (!await launch(url)) throw 'Could not launch $url';
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    easyLivingTitle.value = Get.arguments[NavigationArgs.navigationEasyLivingTitle];
    callApiForWetMarketDetails();
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

  Future<WetMarketModel?> callApiForWetMarketDetails() async {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      ProgressDialogUtils.showProgressDialog(Get.context);
    });
    String token = await Preference().read(Const.prefAPIToken);
    String language =await Preference().read(Const.prefLanguage);
    debugPrint('language => value  :${language}');
    CategoryWetMarketDetailsProvider().getWetMarketDetails(token, language).then((value) async {

      final wetMarketResponse = WetMarketModel.fromJson(value);
      change(value, status: RxStatus.success());
      if (wetMarketResponse.status == 1) {
        WidgetsBinding.instance?.addPostFrameCallback((_) {
          ProgressDialogUtils.hideProgressDialog();
        });
        wetMarketDetailsMutableList.value.clear();
        wetMarketDetailsMutableList.value.addAll(wetMarketResponse.wetMarketData!);
        totalLength.value = wetMarketDetailsMutableList.value[0].stationList!.length;
        if(wetMarketDetailsMutableList.value[0].stationList!.isEmpty){
          isWetMarketData.value = true;
        }

      } else {
        isWetMarketData.value = true;
        WidgetsBinding.instance?.addPostFrameCallback((_) {
          ProgressDialogUtils.hideProgressDialog();
        });
        message.value = wetMarketResponse.message.toString();
        // Const().toast(wetMarketResponse.message);
      }
    }, onError: (error) {
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        ProgressDialogUtils.hideProgressDialog();
      });
      debugPrint("Wet Market Details Api => error : $error");
      change(null, status: RxStatus.error(error.toString()));
    });
  }
}
