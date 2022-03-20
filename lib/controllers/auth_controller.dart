import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/sockets/src/sockets_html.dart';
import 'package:helloworld/provider/auth_provider.dart';
import '../models/models.dart';

class AuthController extends GetxController {
  final AuthProvider authProvider = AuthProvider();
  Rx<TextEditingController> namaController = new TextEditingController().obs;
  Rx<TextEditingController> emailController = new TextEditingController().obs;
  Rx<TextEditingController> noHpController = new TextEditingController().obs;
  Rx<TextEditingController> alamatController = new TextEditingController().obs;
  Rx<DateTime?> tanggalLahir = Rx<DateTime?>(null);
  RxInt hobi = RxInt(0);
  String? facebookValue;

  final List<Hobi> listHobi = [
    Hobi(1, "assets/images/seni_hobi_icon.png", "Seni"),
    Hobi(2, "assets/images/baca_hobi_icon.png", "Baca"),
    Hobi(3, "assets/images/olahraga_hobi_icon.png", "Olahraga"),
  ];

  @override
  void onInit() {
    super.onInit();
    getToken();
  }

  void getToken() async {
    try {
      var response = await authProvider.fetchToken().timeout(
        Duration(seconds: 10)
      );
      print(response.body);
    } 
    on ConnectionStatus{
      Get.showSnackbar(GetSnackBar(
        message: "check_internet_connection".tr,
      ));
    }
    on TimeoutException{
      Get.showSnackbar(GetSnackBar(
        message: "request_token_timeout".tr,
      ));
    }
    catch (e) {
      print(e.toString());
    }
  }

  /// get list of fb followers from [Language] class
  List<String> get fbFollowers => "fb_followers".tr.split(",");

  // set and update tanggal lahir
  set setTanggalLahir(DateTime? value) {
    tanggalLahir.value = value;
  }

  // set and update hobi
  set setHobi(int value) {
    hobi.value = value;
  }

  // set and update FB Followers
  void facabookFollowers(String value) {
    facebookValue = value;
    update();
  }
}
