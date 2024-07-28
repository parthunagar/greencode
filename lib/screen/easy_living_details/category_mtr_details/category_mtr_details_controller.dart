import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greencode/app_route/NavigationArgs.dart';
import 'package:greencode/constant/app_constant.dart';
import 'package:greencode/screen/easy_living_details/category_mtr_details/category_mtr_details_provider.dart';
import 'package:greencode/utils/preference.dart';
import 'package:greencode/widget/progress_dialog_utils.dart';
import 'package:url_launcher/url_launcher.dart';

import 'category_mtr_details_model.dart';

class CategoryMtrDetailsController extends GetxController with StateMixin<dynamic> {
  RxString easyLivingTitle = ''.obs;
  RxBool isMtrDetailsLoad = false.obs;
  RxBool isPreviousVisible = true.obs;
  RxBool isNextVisible = true.obs;
  RxInt totalLength = 0.obs;
  RxString message = ''.obs;
  Rx<RxList<MtrDetailsDatum>> mtrDetailsMutableList =
      RxList<MtrDetailsDatum>.empty().obs;
  CarouselController carouselController = CarouselController();
  GlobalKey<ScaffoldState> scaffoldKeyMTR = GlobalKey<ScaffoldState>(debugLabel: 'scaffoldKeyMTR');

  RxInt? isDefault = 0.obs;

  void openDrawer() {
    scaffoldKeyMTR.currentState?.openEndDrawer();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    easyLivingTitle.value = Get.arguments[NavigationArgs.navigationEasyLivingTitle];
    callApiForMTRDetails();
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

  void launchUrl(String url) async {
    if (!await launch(url)) throw 'Could not launch $url';
  }


  Future<MtrDetailsModel?> callApiForMTRDetails() async {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      ProgressDialogUtils.showProgressDialog(Get.context);
    });
    String token = await Preference().read(Const.prefAPIToken);
    String language = await Preference().read(Const.prefLanguage);
    debugPrint('language => value  :${language}');
    CategoryMtsDetailsProvider().getMTREssentialDetails(token, language)
        .then((value) async {
      final mtrDetailsResponse = MtrDetailsModel.fromJson(value);
      change(value, status: RxStatus.success());
      if (mtrDetailsResponse.status == 1) {
        WidgetsBinding.instance?.addPostFrameCallback((_) {
          ProgressDialogUtils.hideProgressDialog();
        });

        mtrDetailsMutableList.value.clear();
        mtrDetailsMutableList.value.addAll(mtrDetailsResponse.mtrDetailsData!);
        totalLength.value = mtrDetailsMutableList.value[0].stationList!.length;
        if(mtrDetailsMutableList.value[0].stationList!.isEmpty){
          isMtrDetailsLoad.value = true;
        }

        // mtrDetailsMutableList.value = mtrDetailsResponse.mtrDetailsData!;
        // if (busDetailsData.value.categoryDetails!.isNotEmpty) {
        //   isEasyLivingDetailsLoad.value = true;
      } else {
        // }
        isMtrDetailsLoad.value = true;
        WidgetsBinding.instance?.addPostFrameCallback((_) {
          ProgressDialogUtils.hideProgressDialog();
        });
        message.value = mtrDetailsResponse.message.toString();
        // Const().toast(mtrDetailsResponse.message);
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
