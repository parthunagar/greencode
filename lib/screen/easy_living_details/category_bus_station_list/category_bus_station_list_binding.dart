import 'package:get/get.dart';

import 'category_bus_station_list_controller.dart';

class CategoryBusStationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CategoryBusStationController());
  }
}
