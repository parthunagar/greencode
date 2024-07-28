import 'package:get/get.dart';
import 'package:greencode/screen/e_resident_card/e_resident_card_logic.dart';


class EResidentCardBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut(() => EResidentCardLogic());
    Get.put<EResidentCardLogic>(EResidentCardLogic());
  }
}
