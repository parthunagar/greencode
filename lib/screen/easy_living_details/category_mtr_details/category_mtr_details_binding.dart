import 'package:get/get.dart';

import 'category_mtr_details_controller.dart';

class CategoryMtrDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CategoryMtrDetailsController());
  }
}
