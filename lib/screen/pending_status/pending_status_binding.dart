import 'package:get/get.dart';
import 'package:greencode/screen/pending_status/pending_status_controller.dart';


class PendingStatusWidgetBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PendingStatusController());
  }
}
