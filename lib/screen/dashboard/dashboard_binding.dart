
import 'package:get/get.dart';
import 'package:greencode/screen/booking/booking_controller.dart';
import 'package:greencode/screen/home/home_controller.dart';
import 'package:greencode/screen/notification/notification_controller.dart';
import 'package:greencode/screen/qr_code/qr_code_controller.dart';

import 'dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController());
    Get.put<QrCodeController>(QrCodeController());
    Get.put<BookingController>(BookingController());
    Get.put<NotificationController>(NotificationController());
    Get.put<DashboardController>(DashboardController());
    // Get.lazyPut(() => DashboardController());
    // Get.put(() => DashboardController());
  }
}
