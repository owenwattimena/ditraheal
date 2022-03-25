import 'dart:async';
// import 'dart:io';
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:ditraheal/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import "../utils/utils.dart";

// import 'package:get/get_connect/sockets/src/sockets_html.dart';
import '../provider/auth_provider.dart';
import '../provider/hobby_provider.dart';
import '../models/models.dart';
import '../shared/shared.dart';
import '../pages/pages.dart';

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
  bool internetStatuserror = false;
  Rx<User> user = Rx<User>(User());

  RxList<Hobby> listHobby = <Hobby>[
    // Hobby(1, "assets/images/seni_hobi_icon.png", "Seni"),
    // Hobby(2, "assets/images/baca_hobi_icon.png", "Baca"),
    // Hobby(3, "assets/images/olahraga_hobi_icon.png", "Olahraga"),
  ].obs;

  @override
  void onInit() {
    super.onInit();
    print("ON INIT");
  }

  @override
  void onReady() {
    super.onReady();
    getToken();
    // checkConnectivity();
  }

  /// Listen internet status
  void checkConnectivity() {
    // Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
    //   if (result == ConnectivityResult.none) {
    //     internetStatuserror = true;
    Get.bottomSheet(
      Container(
        padding: EdgeInsets.all(24),
        height: 150,
        child: Column(
          children: [
            Row(children: [
              Icon(Icons.wifi_off, size: 40),
              SizedBox(width: 12),
              Text(
                "Internet tidak tersedia...",
                style: primaryTextBoldStyle.copyWith(fontSize: 16),
              )
            ]),
            SizedBox(height: 12),
            Text(
              "Cek ulang koneksi internet dan ketersediaan paket data Anda, ya.",
              style: primaryTextStyle,
            )
          ],
        ),
      ),
      backgroundColor: Colors.white,
      isDismissible: false,
      enableDrag: false,
    );
  }

  /// get auth Token from API
  Future<void> getToken() async {
    final result = await authProvider.fetchToken();
    print(result.message);
    print(result.statusCode);
    if (result.statusCode == 200) {
      token.value = result.data["token"];
      getHobbies();
    } else {
      getToken();
    }
  }

  // get list of hobbies from API
  Future<void> getHobbies() async {
    final result = await hobbyProvider.fetchHobbies(token: token.value);
    print(result.message);
    if (result.statusCode == 200) {
      listHobby.value = result.data!;
    } else {
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

  void goToHobySignupPage() {
    if (facebookValue == "Tidak ada") {
      Get.showSnackbar(GetSnackBar(
        message: "follower_minimum".tr,
        duration: Duration(seconds: 2),
      ));
      return;
    }
    user.update((_) {
      user.value = new User(
        name: namaController.value.text,
        phoneNumber: noHpController.value.text,
        birthDate: DateFormat('yyyy-MM-dd').format(tanggalLahir.value!),
        address: alamatController.value.text,
        follower: int.parse(facebookValue!),
      );
    });
    Get.to(HobiSignupPage());
  }

  void checkHobby() {
    String? message = Validate.select(hobi.value);
    if (message != null) {
      Get.showSnackbar(GetSnackBar(
        message: message,
        duration: Duration(seconds: 2),
      ));
    } else {
      user.update((_) {
        user.value = user.value.copyWith(hobby: hobi.value);
      });
      doSignup();
    }
  }

  // do signup
  Future<void> doSignup() async {
    final result = await authProvider.doSignup(user.value.toMap(), token: token.value);
    if (result.statusCode == REQUSET_SUCCESS) {
      final userData = result.data[0]["data"];
      user.update((val) {
        user.value = User.fromJson(userData);
      });
      Get.to(LandingTraumaQuiz());
    } else {
      Get.showSnackbar(GetSnackBar(
        message: "something_gone_wrong".tr,
        duration: Duration(seconds: 2),
      ));
    }
  }
}
