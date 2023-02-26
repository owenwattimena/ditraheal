import 'package:ditraheal/models/models.dart';

import '../controllers/profile_controller.dart';
import 'package:get/get.dart';

import 'auth_controller.dart';

class DashboardController extends GetxController {
  final authC = Get.find<AuthController>();
  final profileC = Get.put(ProfileController());
  Rx<Hobby> hobby = Rx<Hobby>(Hobby());
  RxInt tabIndex = 0.obs;
}
