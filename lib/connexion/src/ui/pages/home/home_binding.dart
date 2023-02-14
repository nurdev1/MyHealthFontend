
import 'package:get/get.dart';

import '../../../../../Patient/home/AccueilController.dart';
import '../../../../../app_controller.dart';

class HomeBinding implements Bindings {
  const HomeBinding();

  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(Get.find<AppController>()),
    );
  }
}
