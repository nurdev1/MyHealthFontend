
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masante/connexion/src/ui/pages/home/home_controller.dart';

import '../../../../../app_controller.dart';
import '../../../../../snackbars/info_snackbar.dart';
import '../../../data/http/src/employee_http.dart';
import '../../../domain/entities/employee.dart';
import '../../../domain/responses/add_employee_response.dart';

class AddEmployeeController extends GetxController {
  AddEmployeeController(this.appController);

  final AppController appController;

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  void onClose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    super.onClose();
  }

  void save() {
    Get.showOverlay(
      loadingWidget: const CircularProgressIndicator.adaptive(),
      asyncFunction: () async {
        try {
          final AddEmployeeResponse res =
              await const EmployeeHttp().addEmployee(
            Employee(
              id: 0,
              firstName: firstNameController.text.trim(),
              lastName: lastNameController.text.trim(),
              email: emailController.text.trim(),
            ),
          );
          if (res.status == 200) {
            Get.showSnackbar(InfoSnackbar(res.temporalPassword ?? ''));
            Get.find<HomeController>().addEmployee(res.user!.employee);
            Get.until((route) => route.isFirst);
          } else {
            appController.manageError(res.message);
          }
        } on HttpException catch (e) {
          appController.manageError(e.message);
        } catch (e) {
          appController.manageError(e.toString());
        }
      },
    );
  }
}
