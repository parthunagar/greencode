import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greencode/app_route/NavigationArgs.dart';
import 'package:greencode/constant/app_constant.dart';
import 'package:greencode/screen/easy_living_details/category_taxi_details/category_taxi_details_provider.dart';
import 'package:greencode/utils/preference.dart';
import 'package:greencode/widget/progress_dialog_utils.dart';
import 'package:url_launcher/url_launcher.dart';

import 'category_taxi_details_model.dart';

class CategoryTaxiDetailsController extends GetxController with StateMixin<dynamic> {

  RxString easyLivingTitle = ''.obs;
  RxBool isTaxiDetailsLoad = false.obs;
  RxString message = ''.obs;

  GlobalKey<ScaffoldState> scaffoldKeyTaxiDetails = GlobalKey<ScaffoldState>(debugLabel: 'scaffoldKeyTaxiDetails');

  Rx<RxList<TaxiDatum>> taxiDetailsMutableList =
      RxList<TaxiDatum>.empty().obs;

  void openDrawer() {
    scaffoldKeyTaxiDetails.currentState?.openEndDrawer();
  }

  void closeDrawer() {
    Get.back();
    FocusScope.of(Get.context!).unfocus();
  }

  void launchUrl(String url) async {
    if (!await launch(url)) throw 'Could not launch $url';
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    easyLivingTitle.value = Get.arguments[NavigationArgs.navigationEasyLivingTitle];
    callApiForTaxiDetails();
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

  Future<TaxiModel?> callApiForTaxiDetails() async {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      ProgressDialogUtils.showProgressDialog(Get.context);
    });
    String token = await Preference().read(Const.prefAPIToken);
    String language = await Preference().read(Const.prefLanguage);
    debugPrint('language => value  :${language}');
    CategoryTaxiDetailsProvider().getTaxiDetails(token, language)
        .then((value) async {
      final taxiModelResponse = TaxiModel.fromJson(value);
      change(value, status: RxStatus.success());
      if (taxiModelResponse.status == 1) {
        WidgetsBinding.instance?.addPostFrameCallback((_) {
          ProgressDialogUtils.hideProgressDialog();
        });

        taxiDetailsMutableList.value.clear();
        taxiDetailsMutableList.value.addAll(taxiModelResponse.taxiData!);
        // totalLength.value = taxiDetailsMutableList.value[0].c!.length;
        if(taxiDetailsMutableList.value[0].cmsCategoryDetails!.isEmpty){
          isTaxiDetailsLoad.value = true;
        }

        // mtrDetailsMutableList.value = mtrDetailsResponse.mtrDetailsData!;
        // if (busDetailsData.value.categoryDetails!.isNotEmpty) {
        //   isEasyLivingDetailsLoad.value = true;
      } else {
        // }
        WidgetsBinding.instance?.addPostFrameCallback((_) {
          ProgressDialogUtils.hideProgressDialog();
        });
        isTaxiDetailsLoad.value = true;
        message.value = taxiModelResponse.message.toString();
        // Const().toast(taxiModelResponse.message);
      }
    }, onError: (error) {
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        ProgressDialogUtils.hideProgressDialog();
      });
      debugPrint("Get Taxi Details => error : $error");
      change(null, status: RxStatus.error(error.toString()));
    });
  }
}
