import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../add_employee_controller.dart';

class LastNameInput extends StatelessWidget {
  const LastNameInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AddEmployeeController controller = Get.find<AddEmployeeController>();
    return TextFormField(
      controller: controller.lastNameController,
      decoration: const InputDecoration(hintText: 'Last name'),
    );
  }
}
