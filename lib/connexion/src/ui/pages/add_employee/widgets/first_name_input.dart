import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../add_employee_controller.dart';

class FirstNameInput extends StatelessWidget {
  const FirstNameInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AddEmployeeController controller = Get.find<AddEmployeeController>();
    return TextFormField(
      controller: controller.firstNameController,
      decoration: const InputDecoration(hintText: 'First name'),
    );
  }
}
