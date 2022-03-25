import 'dart:async';
// import 'dart:io';
// import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ditraheal/widgets/widgets.dart';
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
    // getToken();
    checkConnectivity();
  }

  /// Listen internet status
  void checkConnectivity() {
    // Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
    //   if (result == ConnectivityResult.none) {
    //     internetStatuserror = true;
    Get.bottomSheet(
      Container(
        child: Column(
          children: [
            Row(children: [
              Icon(Icons.wifi_off),
              Text(
                "Internet tidak tersedia...",
                style: primaryTextBoldStyle.copyWith(fontSize: 16),
              )
            ]),
            Text(
              "Cek ulang koneksi internet dan ketersediaan paket data Anda, ya.",
              style: primaryTextStyle,
            )
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
    //   }
    // });
    //-----------------------------------
    // dialog(
    //   title: "internet_error".tr,
    //   description: "check_internet_connection".tr,
    //   btnTitle: "ok".tr,
    //   onPressed: () {
    //     if (internetStatuserror == false) {
    //       Get.back();
    //     }
    //   },
    // );
    //   } else {
    //     if (internetStatuserror) {
    //       internetStatuserror = false;
    //       Get.back();
    //     }
    //   }

    // Get.defaultDialog(
    //   title: "internet_error".tr,
    //   titlePadding: EdgeInsets.all(18),
    //   titleStyle: primaryTextBoldStyle.copyWith(fontSize: 14),
    //   content: Container(
    //     decoration: BoxDecoration(
    //       color: greyColor,
    //       borderRadius: BorderRadius.circular(12),
    //     ),
    //     margin: EdgeInsets.symmetric(horizontal: 10),
    //     padding: EdgeInsets.symmetric(horizontal: 9, vertical: 16),
    //     child: Text(
    //       "check_internet_connection".tr,
    //       style: primaryTextStyle,
    //     ),
    //   ),
    //   actions: [
    //     ButtonWidget(
    //       margin: EdgeInsets.only(top: 10, bottom: 8),
    //       text: "OK",
    //       padding: EdgeInsets.symmetric(horizontal: 10),
    //       onPressed: () {
    //         if (internetStatuserror == false) {
    //         Get.back();
    //       }
    //       },
    //     )
    //   ],
    //   barrierDismissible: false,
    // );
  }

  /// get auth Token from API
  Future<void> getToken() async {
    final result = await authProvider.fetchToken();
    if (result.statusCode == 200) {
      token.value = result.data["token"];
      print(token.value);
      getHobbies();
    } else {
      getToken();
    }
  }

  // get list of hobbies from API
  Future<void> getHobbies() async {
    final result = await hobbyProvider.fetchHobbies(token: token.value);
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
    checkConnectivity();
    return;
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
  void doSignup() {
    Get.to(LandingTraumaQuiz());
  }
}
