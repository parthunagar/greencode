import 'package:get/get.dart';

import 'easy_living_info_controller.dart';

class EasyLivingInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EasyLivingInfoController());
  }
}
