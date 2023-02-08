
import 'package:get/get.dart';
import 'package:masante/connexion/src/ui/pages/sign_in/Connexioncontroller.dart';

import '../../../../../app_controller.dart';

class SignInBinding implements Bindings {
  const SignInBinding();

  @override
  void dependencies() {
    Get.lazyPut<SignInController>(
      () => SignInController(Get.find<AppController>()),
    );
  }
}
