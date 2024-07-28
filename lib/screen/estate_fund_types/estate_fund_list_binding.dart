import 'package:get/get.dart';
import 'package:greencode/screen/estate_fund_types/estate_fund_list_controller.dart';
import 'package:greencode/screen/estate_info/estate_info_controller.dart';


class EstateFundListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EstateFundListController());
  }
}
