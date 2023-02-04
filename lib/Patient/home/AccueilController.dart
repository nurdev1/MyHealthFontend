import 'package:get/get.dart';
import 'package:masante/app_controller.dart';

import '../../modeles/Utilisateur.dart';

class HomeController extends GetxController{
  HomeController(this.appController);

  final AppController appController;

  final User user = Get.arguments as User;

}