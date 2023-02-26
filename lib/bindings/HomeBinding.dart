import 'package:ditraheal/controllers/treatment_controller.dart';
import 'package:get/get.dart';

import '../controllers/auth_controller.dart';
import '../controllers/loading_controller.dart';
import '../controllers/periode_controller.dart';
import '../controllers/dashboard_controller.dart';

class HomeBinding implements Bindings{
  @override
  void dependencies() {
    Get.put<AuthController>(AuthController());
    Get.put<PeriodeController>(PeriodeController(), permanent: true);
    Get.put<LoadingController>(LoadingController(), permanent: true);
    Get.put<DashboardController>(DashboardController());
    Get.put<TreatmentController>(TreatmentController(), permanent: true);
  }
}