import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../add_employee_controller.dart';

class EmailInput extends StatelessWidget {
  const EmailInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AddEmployeeController controller = Get.find<AddEmployeeController>();
    return TextFormField(
      controller: controller.emailController,
      decoration: const InputDecoration(hintText: 'Email'),
    );
  }
}
