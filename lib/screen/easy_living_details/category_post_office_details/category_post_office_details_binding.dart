import 'package:get/get.dart';

import 'category_post_office_details_contoller.dart';

class CategoryPostOfficeDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CategoryPostOfficeDetailsController());
  }
}
