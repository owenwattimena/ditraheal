import 'dart:async';
// import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
// import 'package:get/get_connect/sockets/src/sockets_html.dart';
import 'package:helloworld/provider/auth_provider.dart';
import 'package:helloworld/provider/hobby_provider.dart';
import '../models/models.dart';

class AuthController extends GetxController {
  RxString token = "".obs;
  final AuthProvider authProvider = AuthProvider();
  final HobbyProvider hobbyProvider = HobbyProvider();
  Rx<TextEditingController> namaController = new TextEditingController().obs;
  Rx<TextEditingController> emailController = new TextEditingController().obs;
  Rx<TextEditingController> noHpController = new TextEditingController().obs;
  Rx<TextEditingController> alamatController = new TextEditingController().obs;
  Rx<DateTime?> tanggalLahir = Rx<DateTime?>(null);
  RxInt hobi = RxInt(0);
  String? facebookValue;

  RxList<Hobby> listHobby = <Hobby>[
    // Hobby(1, "assets/images/seni_hobi_icon.png", "Seni"),
    // Hobby(2, "assets/images/baca_hobi_icon.png", "Baca"),
    // Hobby(3, "assets/images/olahraga_hobi_icon.png", "Olahraga"),
  ].obs;

  @override
  void onInit() {
    super.onInit();
    getToken();
  }

  Future<void> getToken() async {
    final result = await authProvider.fetchToken();
    if (result.statusCode == 200) {
      token.value = result.data["token"];
      getHobbies();
    } else{
      getToken();
    }
  }

  Future<void> getHobbies()async{
    final result = await hobbyProvider.fetchHobbies(token: token.value);
    print(result.message);
    if (result.statusCode == 200) {
      listHobby.value = result.data!;
    } else{
      getHobbies();
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
