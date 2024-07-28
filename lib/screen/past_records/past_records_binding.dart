import 'package:get/get.dart';
import 'package:greencode/screen/past_records/past_records_controller.dart';


class PastRecordsStatusBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PastRecordsStatusController());
  }
}
