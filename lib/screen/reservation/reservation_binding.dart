import 'package:get/get.dart';

import 'reservation_controller.dart';

class ReservationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ReservationController());

  }
}
