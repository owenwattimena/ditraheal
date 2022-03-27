import 'package:get/get.dart';

import 'auth_controller.dart';

class DashboardController extends GetxController{
  final authC = Get.find<AuthController>();

  @override
  void onInit(){
    super.onInit();
    if(!authC.isSignin.value){
      authC.auth();
    }
  }
}
