import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greencode/app_route/NavigationArgs.dart';
import 'package:greencode/constant/app_constant.dart';
import 'package:greencode/screen/easy_living_details/category_library_details/category_library_details_model.dart';
import 'package:greencode/screen/easy_living_details/category_library_details/category_library_details_provider.dart';
import 'package:greencode/utils/preference.dart';
import 'package:greencode/widget/progress_dialog_utils.dart';
import 'package:url_launcher/url_launcher.dart';

class CategoryLibraryDetailsController extends GetxController with StateMixin<dynamic>{

  RxString easyLivingTitle = ''.obs;
  RxBool isPreviousVisible = true.obs;
  RxBool isNextVisible = true.obs;
  RxInt totalLength = 0.obs;
  RxString message = ''.obs;
  RxBool isLibraryData = false.obs;

  Rx<RxList<LibraryDatum>> libraryDetailsMutableList =
      RxList<LibraryDatum>.empty().obs;

  GlobalKey<ScaffoldState> scaffoldKeyLibraryDetails = GlobalKey<ScaffoldState>(debugLabel: 'scaffoldKeyLibraryDetails');

  void openDrawer() {
    scaffoldKeyLibraryDetails.currentState?.openEndDrawer();
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
    callApiForCategoryLibraryDetails();
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
  Future<LibraryDataModel?> callApiForCategoryLibraryDetails() async {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      ProgressDialogUtils.showProgressDialog(Get.context);
    });
    String token = await Preference().read(Const.prefAPIToken);
    String language =await Preference().read(Const.prefLanguage);
    debugPrint('language => value  :${language}');
    CategoryLibraryDetailsProvider().getLibraryDetails(token, language).then((value) async {

      final libraryDetailsResponse = LibraryDataModel.fromJson(value);
      change(value, status: RxStatus.success());
      if (libraryDetailsResponse.status == 1) {
        WidgetsBinding.instance?.addPostFrameCallback((_) {
          ProgressDialogUtils.hideProgressDialog();
        });
        libraryDetailsMutableList.value.clear();
        libraryDetailsMutableList.value.addAll(libraryDetailsResponse.libraryData!);
        totalLength.value = libraryDetailsMutableList.value[0].libraryList!.length;
        if(libraryDetailsMutableList.value[0].libraryList!.isEmpty){
          isLibraryData.value = true;
        }

      } else {
        isLibraryData.value = true;
        WidgetsBinding.instance?.addPostFrameCallback((_) {
          ProgressDialogUtils.hideProgressDialog();
        });
        message.value = libraryDetailsResponse.message.toString();
        // Const().toast(libraryDetailsResponse.message);
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
