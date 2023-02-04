
import 'package:get/get.dart';
import 'package:masante/Patient/connexion/sign_in_controller.dart';

import '../../app_controller.dart';

class SignInBinding implements Bindings {
  const SignInBinding();

  @override
  void dependencies() {
    Get.lazyPut<SignInController>(
      () => SignInController(Get.find<AppController>()),
    );
  }
}
