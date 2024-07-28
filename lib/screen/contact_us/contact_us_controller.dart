import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greencode/constant/app_constant.dart';
import 'package:greencode/screen/contact_us/contact_us_model.dart';
import 'package:greencode/utils/preference.dart';
import 'package:greencode/widget/progress_dialog_utils.dart';
import 'package:url_launcher/url_launcher.dart';

import 'contact_us_provider.dart';

class ContactUsController extends GetxController with StateMixin<dynamic> {


  RxString languageKey = ''.obs;
  Rx<RxList<ContactDetailsDatum>> contactMutableDetailsList =
      RxList<ContactDetailsDatum>.empty().obs;
  // Rx<Color> background = cBackgroundLiving.obs;
  Rx<bool> changeBg = false.obs;
  RxBool isContactDetailsLoad = false.obs;
  RxString messageValue = ''.obs;

  RxInt? findIndex = 10000.obs;

  void openDrawer() {
    // scaffoldKeyContactUs.currentState?.openEndDrawer();
  }

  void closeDrawer() {
    Get.back();
    // FocusScope.of(Get.context!).unfocus();
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

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    languageKey.value = await Preference().read(Const.prefLanguage);
    callGetContactDetailsApi();
    // getPrefData();
  }


  Future<ContactDetailsModel?> callGetContactDetailsApi() async {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      ProgressDialogUtils.showProgressDialog(Get.context);
    });
    String token = await Preference().read(Const.prefAPIToken);
    debugPrint('languageKey => token : ${languageKey.value}');
    ContactUsProvider().callContactDetails(token, languageKey.value).then((value) async {
      final contactListData = ContactDetailsModel.fromJson(value);
      change(value, status: RxStatus.success());
      if (contactListData.status == 1) {
        WidgetsBinding.instance?.addPostFrameCallback((_) {
          ProgressDialogUtils.hideProgressDialog();
        });

        contactMutableDetailsList.value.clear();
        contactMutableDetailsList.value.addAll(contactListData.contactDetailsData!);
        if (contactMutableDetailsList.value.isEmpty) {
            isContactDetailsLoad.value = true;
            debugPrint('isDetailsLoad $isContactDetailsLoad');
        }
      } else {
        WidgetsBinding.instance?.addPostFrameCallback((_) {
          ProgressDialogUtils.hideProgressDialog();
        });
        messageValue.value = contactListData.message.toString();
        Const().toast(contactListData.message);
      }
    }, onError: (error) {
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        ProgressDialogUtils.hideProgressDialog();
      });
      debugPrint("ContactDetails Api => error : $error");
      change(null, status: RxStatus.error(error.toString()));
    });
  }
}
