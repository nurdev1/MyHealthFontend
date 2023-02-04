
import 'dart:io';

import 'package:get/get.dart';

import '../../app_controller.dart';
import '../../http/src/user_http.dart';
import '../../local/secure_storage_local.dart';
import '../../routes/route_names.dart';
import '../../snackbars/error_snackbar.dart';

class SplashController extends GetxController {
  SplashController(this.appController);
  final AppController appController;

  final RxBool _loading = RxBool(true);

  @override
  void onInit() {
    _load();
    super.onInit();
  }

  Future<void> _load() async {
    try {
      final String? token = await const SecureStorageLocal().jwtToken;
      if (token == null) {
        return Get.offNamed(RouteNames.signIn);
      }
      return await const UserHttp().user.then((value) {
        if (value.status == 200) {
          Get.offNamed(RouteNames.home, arguments: value.user);
        } else {
          appController.manageError(value.message);
        }
      });
    } on HttpException catch (e) {
      appController.manageError(e.message);
    } catch (e) {
      Get.showSnackbar(ErrorSnackbar(e.toString()));
    } finally {
      _loading(false);
    }
  }

  bool get loading => _loading.value;
}
