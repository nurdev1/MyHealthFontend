import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../AllFile/responses/sign_in_response.dart';
import '../../app_controller.dart';
import '../../http/src/sign_in_http.dart';
import '../../local/secure_storage_local.dart';
import '../../routes/route_names.dart';

class SignInController extends GetxController {
  SignInController(this.appController);

  final AppController appController;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void signIn() {
    if (formKey.currentState!.validate()) {
      Get.showOverlay(
        asyncFunction: () async {
          try {
            final SignInResponse res =
                await const SignInHttp().signInWithUsernameAndPassword(
              usernameController.text.trim(),
              passwordController.text,
            );
            if (res.status == 200) {
              await const SecureStorageLocal().saveToken(res.token);
              Get.offNamed(RouteNames.home, arguments: res.user);
            } else {
              appController.manageError(res.message);
            }
          } on HttpException catch (e) {
            appController.manageError(e.message);
          }
        },
      );
    }
  }

  String? validateUsername(String? value) {
    if (value == null || value.trim().length < 5) {
      return "Mauvais nom d'utilisateur";
    }
    return null;
  }

  /// Validate secure password [value].
  String? validatePassword(String? value) {
    if (value == null) {
      return 'Mot de passe incorrect';
    } else if (value.length < 6) {
      return 'Mot de passe min longueur 6';
    }
    return null;
  }
}
