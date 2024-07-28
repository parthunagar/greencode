import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greencode/app_route/NavigationArgs.dart';
import 'package:greencode/constant/app_constant.dart';
import 'package:greencode/screen/easy_living_details/category_post_office_details/category_post_office_details_model.dart';
import 'package:greencode/screen/easy_living_details/category_post_office_details/category_post_office_details_provider.dart';
import 'package:greencode/utils/preference.dart';
import 'package:greencode/widget/progress_dialog_utils.dart';
import 'package:url_launcher/url_launcher.dart';

class CategoryPostOfficeDetailsController extends GetxController with StateMixin<dynamic> {

  RxString easyLivingTitle = ''.obs;
  RxBool isPreviousVisible = true.obs;
  RxBool isNextVisible = true.obs;
  RxInt totalLength = 0.obs;
  RxString message = ''.obs;
  RxBool isPostOfficeData = false.obs;

  Rx<RxList<PostOfficeDatum>> postOfficeDetailsMutableList =
      RxList<PostOfficeDatum>.empty().obs;


  GlobalKey<ScaffoldState> scaffoldKeyPostOfficeDetails = GlobalKey<ScaffoldState>(debugLabel: 'scaffoldKeyPostOfficeDetails');

  void openDrawer() {
    scaffoldKeyPostOfficeDetails.currentState?.openEndDrawer();
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
    callApiForGetPostOfficeDetails();
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

  Future<PostOfficeModel?> callApiForGetPostOfficeDetails() async {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      ProgressDialogUtils.showProgressDialog(Get.context);
    });
    String token = await Preference().read(Const.prefAPIToken);
    String language =await Preference().read(Const.prefLanguage);
    debugPrint('language => value  :${language}');
    CategoryPostOfficeDetailsProvider().getPostOfficeDetails(token, language).then((value) async {

      final libraryDetailsResponse = PostOfficeModel.fromJson(value);
      change(value, status: RxStatus.success());
      if (libraryDetailsResponse.status == 1) {
        WidgetsBinding.instance?.addPostFrameCallback((_) {
          ProgressDialogUtils.hideProgressDialog();
        });
        postOfficeDetailsMutableList.value.clear();
        postOfficeDetailsMutableList.value.addAll(libraryDetailsResponse.postOfficeData!);
        totalLength.value = postOfficeDetailsMutableList.value[0].postOfficeList!.length;
        if(postOfficeDetailsMutableList.value[0].postOfficeList!.isEmpty){
          isPostOfficeData.value = true;
        }

      } else {
        WidgetsBinding.instance?.addPostFrameCallback((_) {
          ProgressDialogUtils.hideProgressDialog();
        });
        isPostOfficeData.value = true;
        message.value = libraryDetailsResponse.message.toString();
        // Const().toast(libraryDetailsResponse.message);
      }
    }, onError: (error) {
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        ProgressDialogUtils.hideProgressDialog();
      });
      debugPrint("Post Office Details Api => error : $error");
      change(null, status: RxStatus.error(error.toString()));
    });
  }
}
