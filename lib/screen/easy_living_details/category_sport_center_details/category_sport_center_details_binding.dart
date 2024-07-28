import 'package:get/get.dart';

import 'category_sport_center_details_controller.dart';

class CategorySportCenterDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CategorySportCenterDetailsController());
  }
}
