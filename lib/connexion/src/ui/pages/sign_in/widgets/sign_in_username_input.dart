import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masante/connexion/src/ui/pages/sign_in/Connexioncontroller.dart';


class SignInUsernameInput extends StatelessWidget {
  const SignInUsernameInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SignInController controller = Get.find<SignInController>();
    return TextFormField(
      decoration: const InputDecoration(
        hintText: 'Email',
      ),
      controller: controller.usernameController,
    );
  }
}
