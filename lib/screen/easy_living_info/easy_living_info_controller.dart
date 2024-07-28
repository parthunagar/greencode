import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greencode/constant/app_constant.dart';
import 'package:greencode/constant/colors.dart';
import 'package:greencode/screen/easy_living_info/easy_living_info_model.dart';
import 'package:greencode/screen/easy_living_info/easy_living_info_provider.dart';
import 'package:greencode/utils/preference.dart';
import 'package:greencode/widget/progress_dialog_utils.dart';

class EasyLivingInfoController extends GetxController with StateMixin<dynamic> {

  Rx<RxList<EssentialDatum>> easyLivingInfoList =
      RxList<EssentialDatum>.empty().obs;
  RxBool isEssentialInfoLoad = false.obs;
  RxString message = ''.obs;
  GlobalKey<ScaffoldState> scaffoldKeyEasyLivingInfo = GlobalKey<ScaffoldState>(debugLabel: 'scaffoldKeyEasyLivingInfo');

  Rx<Color> background = cBackgroundLiving.obs;
  Rx<bool> changeBg = false.obs;

  RxInt? findIndex = 10000.obs;

  void openDrawer() {
    scaffoldKeyEasyLivingInfo.currentState?.openEndDrawer();
  }

  void closeDrawer() {
    Get.back();
    // FocusScope.of(Get.context!).unfocus();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    callApiForGetEssentialList();
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

  Future<EssentialListModel?> callApiForGetEssentialList() async {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      ProgressDialogUtils.showProgressDialog(Get.context);
    });
    String token = await Preference().read(Const.prefAPIToken);
    String language =await Preference().read(Const.prefLanguage);
    debugPrint('language => value  :${language}');
    EasyLivingInfoProvider().getEssentialList(token, language).then((value) async {

      final essentialListResponse = EssentialListModel.fromJson(value);
      change(value, status: RxStatus.success());
      if (essentialListResponse.status == 1) {
        WidgetsBinding.instance?.addPostFrameCallback((_) {
          ProgressDialogUtils.hideProgressDialog();
        });
        easyLivingInfoList.value.clear();
        easyLivingInfoList.value.addAll(essentialListResponse.essentialData!);
        if(easyLivingInfoList.value.isEmpty){
          isEssentialInfoLoad.value = true;
        }

      } else {
        isEssentialInfoLoad.value = true;
        WidgetsBinding.instance?.addPostFrameCallback((_) {
          ProgressDialogUtils.hideProgressDialog();
        });
        message.value = essentialListResponse.message.toString();
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
