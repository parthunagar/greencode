import 'package:get/get.dart';

import 'category_library_details_controller.dart';

class CategoryLibraryDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CategoryLibraryDetailsController());
  }
}
