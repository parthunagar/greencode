import 'package:get/get.dart';
import 'package:greencode/screen/estate_info/estate_info_controller.dart';


class EstateInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EstateInfoController());
  }
}
