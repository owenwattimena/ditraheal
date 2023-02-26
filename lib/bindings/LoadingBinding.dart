import 'package:get/get.dart';

import '../controllers/loading_controller.dart';

class LoadingBinding implements Bindings{
  @override
  void dependencies() {
    Get.put<LoadingController>(LoadingController(), permanent: true);
  }
}