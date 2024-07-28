import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:greencode/constant/app_constant.dart';
import 'package:greencode/screen/notification/notification_model.dart';
import 'package:greencode/utils/preference.dart';
import 'package:greencode/widget/progress_dialog_utils.dart';
import 'package:intl/intl.dart';

import 'notification_provider.dart';

class NotificationController extends GetxController with StateMixin<dynamic> {
  // Rx<RxList<ClubDatum>> clubMutableList = RxList<ClubDatum>.empty().obs;
  // Rx<RxList<NotificationListModel>> checkBoxListTileModel = RxList<NotificationListModel>.empty().obs;
  Rx<RxList<NotificationDatum>> notificationMutableDetailsList =
      RxList<NotificationDatum>.empty().obs;
  RxBool checkboxStatus = false.obs;
  RxBool isNotificationLoad = false.obs;
  RxString titleValue = ''.obs;
  RxString messageValue = ''.obs;

  // String get date => null;

  bool valOf(int index) => notificationMutableDetailsList.value[index].isCheck;

  void changeValue(bool? value, int index) {
    notificationMutableDetailsList.value[index].isCheck = value!;
    if (value == true) {
      selectedListIndex.add(index);
      selectId.add(notificationMutableDetailsList.value[index].id);
      // selectNotification.value = notificationMutableDetailsList.value[index].id.toString().splitMapJoin(",") ;
    } else {
      selectedListIndex.remove(index);
      selectId.remove(notificationMutableDetailsList.value[index].id);
      // selectNotification.value = notificationMutableDetailsList.value[index].id.toString().splitMapJoin(",") ;
    }
    update();
  }

  PageController pageController = PageController();

  // RxInt count = 0.obs;
  RxList selectedListIndex = [].obs;
  RxList selectId = [].obs;

  void removeIndex() {
    print('selectedListIndex : ' + selectedListIndex.length.toString());
    selectedListIndex.clear();
    print('selectedListIndex : ' + selectedListIndex.length.toString());
    print('selectId.length : ' + selectId.length.toString());
    selectId.clear();

    for (var i = 0; i < notificationMutableDetailsList.value.length; i++) {
      debugPrint(
          'isCheck 1 : ${notificationMutableDetailsList.value[i].isCheck}');
      notificationMutableDetailsList.value[i].isCheck = false;
      debugPrint(
          'isCheck 2 : ${notificationMutableDetailsList.value[i].isCheck}');
    }
    update();
  }

  get selectedItemCount {
    selectedListIndex.clear();
    for (var i = 0; i < notificationMutableDetailsList.value.length; i++) {
      if (notificationMutableDetailsList.value[i].isCheck == true) {
        selectedListIndex.add(i);
      }
    }
    return selectedListIndex.length;
  }

  RxString dateTimeFormat(String date) {
    DateTime parseDate = DateFormat("yyyy-MM-dd HH:mm:ss.SSS'Z").parse(date);
    var inputDate = DateTime.parse(parseDate.toString());
    var outputFormat = DateFormat('dd/MM/yyyy HH:mm');
    RxString outputDate = outputFormat.format(inputDate).obs;
    return outputDate;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    notificationMutableDetailsList.value.clear();
    titleValue.value = 'edit'.tr;
    selectId.clear();
    // callNotificationList();
    // checkBoxListTileModel.value.addAll(CheckBoxListTileModel.getUsers());
    //  debugPri nt('Length is ${checkBoxListTileModel.value.length}');
    var t = selectedItemCount;
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

  Future<NotificationListModel?> callNotificationList() async {

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      ProgressDialogUtils.showProgressDialog(Get.context);
    });
    String token = await Preference().read(Const.prefAPIToken);
    int userId = await Preference().readInt(Const.prefUserId);
    String language = await Preference().read(Const.prefLanguage);
    debugPrint('languageKey => token : ${language} $userId');
    NotificationProvider().callNotificationList(token, userId, language).then(
        (value) async {
      final notificationListData = NotificationListModel.fromJson(value);
      change(value, status: RxStatus.success());
      if (notificationListData.status == 1) {
        WidgetsBinding.instance?.addPostFrameCallback((_) {
          ProgressDialogUtils.hideProgressDialog();
        });

        notificationMutableDetailsList.value.clear();
        selectedListIndex.clear();
        selectId.clear();
        notificationMutableDetailsList.value
            .addAll(notificationListData.notificationData!);
        if (notificationMutableDetailsList.value.isEmpty) {
          isNotificationLoad.value = true;
          // debugPrint('isDetailsLoad $isContactDetailsLoad');
        }else{
          isNotificationLoad.value = false;
        }
      } else {
        WidgetsBinding.instance?.addPostFrameCallback((_) {
          ProgressDialogUtils.hideProgressDialog();
        });
        isNotificationLoad.value = true;
        messageValue.value = notificationListData.message.toString();
        // Const().toast(notificationListData.message);
      }
    }, onError: (error) {
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        ProgressDialogUtils.hideProgressDialog();
      });
      debugPrint("ContactDetails Api => error : $error");
      change(null, status: RxStatus.error(error.toString()));
    });
  }

  Future<NotificationListModel?> callApiForDeleteNotification(
      String notificationId) async {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      ProgressDialogUtils.showProgressDialog(Get.context);
    });
    String token = await Preference().read(Const.prefAPIToken);
    NotificationProvider().callDeleteNotification(token, notificationId).then(
        (value) async {
      final notificationListData = NotificationListModel.fromJson(value);
      change(value, status: RxStatus.success());
      if (notificationListData.status == 1) {
        WidgetsBinding.instance?.addPostFrameCallback((_) {
          ProgressDialogUtils.hideProgressDialog();
        });
        callNotificationList();
        update();
        // notificationMutableDetailsList.
      } else {
        WidgetsBinding.instance?.addPostFrameCallback((_) {
          ProgressDialogUtils.hideProgressDialog();
        });
        messageValue.value = notificationListData.message.toString();
        // Const().toast(notificationListData.message);
      }
    }, onError: (error) {
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        ProgressDialogUtils.hideProgressDialog();
      });
      debugPrint("DeleteNotification Api => error : $error");
      change(null, status: RxStatus.error(error.toString()));
    });
  }
}
