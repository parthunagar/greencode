import 'package:get/get.dart';

import 'category_web_market_details_controller.dart';

class CategoryWebMarketDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CategoryWebMarketDetailsController());
  }
}
