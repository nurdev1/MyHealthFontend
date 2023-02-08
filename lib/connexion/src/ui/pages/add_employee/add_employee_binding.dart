
import 'package:get/get.dart';

import '../../../../../app_controller.dart';
import 'add_employee_controller.dart';

class AddEmployeeBinding implements Bindings {
  const AddEmployeeBinding();

  @override
  void dependencies() {
    Get.lazyPut<AddEmployeeController>(
      () => AddEmployeeController(Get.find<AppController>()),
    );
  }
}
