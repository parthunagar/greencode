import 'package:get/get.dart';

import 'category_bus_details_controller.dart';

class CategoryBusDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CategoryBusDetailsController());
  }
}
