import 'package:get/get.dart';

import '../controllers/auth_controller.dart';
import '../controllers/loading_controller.dart';

class AccountBinding implements Bindings{
  @override
  void dependencies() {
    Get.put<AuthController>(AuthController());
    Get.put<LoadingController>(LoadingController(), permanent: true);
  }
}