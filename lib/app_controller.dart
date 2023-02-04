
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:masante/routes/route_names.dart';
import 'package:masante/snackbars/error_snackbar.dart';

class AppController extends GetxController {
  void manageError(final String error) {
    if (error == 'security-token-required' ||
        error == 'invalid-token' ||
        error == 'token-has-expired' ||
        error == 'Your credentials are incorrect') {
      Get.offAllNamed(RouteNames.signIn);
      Get.showSnackbar(ErrorSnackbar(error));
    } else {
      Get.showSnackbar(ErrorSnackbar(error));
    }
  }
}
