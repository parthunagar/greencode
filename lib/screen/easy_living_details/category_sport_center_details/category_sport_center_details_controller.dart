import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greencode/app_route/NavigationArgs.dart';
import 'package:greencode/constant/app_constant.dart';
import 'package:greencode/screen/easy_living_details/category_sport_center_details/category_sport_center_details_model.dart';
import 'package:greencode/screen/easy_living_details/category_sport_center_details/category_sport_center_details_provider.dart';
import 'package:greencode/utils/preference.dart';
import 'package:greencode/widget/progress_dialog_utils.dart';
import 'package:url_launcher/url_launcher.dart';

class CategorySportCenterDetailsController extends GetxController with StateMixin<dynamic> {

  RxString easyLivingTitle = ''.obs;
  RxBool isPreviousVisible = true.obs;
  RxBool isNextVisible = true.obs;
  RxInt totalLength = 0.obs;
  RxString message = ''.obs;
  RxBool isSportCenterData = false.obs;

  Rx<RxList<SportCenterDatum>> sportCenterDetailsMutableList =
      RxList<SportCenterDatum>.empty().obs;
  GlobalKey<ScaffoldState> scaffoldKeySportCenterDetails = GlobalKey<ScaffoldState>(debugLabel: 'scaffoldKeySportCenterDetails');

  void openDrawer() {
    scaffoldKeySportCenterDetails.currentState?.openEndDrawer();
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
    callApiForSportCenterDetails();
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

  Future<SportCenterModel?> callApiForSportCenterDetails() async {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      ProgressDialogUtils.showProgressDialog(Get.context);
    });
    String token = await Preference().read(Const.prefAPIToken);
    String language =await Preference().read(Const.prefLanguage);
    debugPrint('language => value  :${language}');
    CategorySportCenterDetailsProvider().getSportCenterDetails(token, language).then((value) async {

      final wetMarketResponse = SportCenterModel.fromJson(value);
      change(value, status: RxStatus.success());
      if (wetMarketResponse.status == 1) {
        WidgetsBinding.instance?.addPostFrameCallback((_) {
          ProgressDialogUtils.hideProgressDialog();
        });
        sportCenterDetailsMutableList.value.clear();
        sportCenterDetailsMutableList.value.addAll(wetMarketResponse.sportCenterData!);
        totalLength.value = sportCenterDetailsMutableList.value[0].sportList!.length;
        if(sportCenterDetailsMutableList.value[0].sportList!.isEmpty){
          isSportCenterData.value = true;
        }

      } else {
        WidgetsBinding.instance?.addPostFrameCallback((_) {
          ProgressDialogUtils.hideProgressDialog();
        });
        isSportCenterData.value = true;
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
