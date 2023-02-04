
import 'package:get/get.dart';
import 'package:masante/page/splash/splash_controller.dart';

import '../../app_controller.dart';

class SplashBinding implements Bindings {
  const SplashBinding();

  @override
  void dependencies() {
    Get.lazyPut<SplashController>(
      () => SplashController(Get.find<AppController>()),
    );
  }
}
