import 'package:get/get.dart';

import 'category_taxi_details_controller.dart';

class CategoryTaxiDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CategoryTaxiDetailsController());
  }
}
