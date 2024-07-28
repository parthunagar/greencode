import 'package:get/get.dart';

import 'register_with_email_controller.dart';

class RegisterWithEmailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterWithEmailController());
  }
}
