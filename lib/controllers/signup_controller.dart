import 'dart:async';

import 'package:ditraheal/provider/store_provide.dart';
import 'package:ditraheal/shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import "../utils/utils.dart";
import '../provider/auth_provider.dart';
import '../provider/hobby_provider.dart';
import '../models/models.dart';
import '../pages/pages.dart';
import 'signin_controller.dart';

class SignupController extends GetxController {
  final AuthProvider authProvider = AuthProvider();
  final HobbyProvider hobbyProvider = HobbyProvider();

  Rx<TextEditingController> namaController = new TextEditingController().obs;
  Rx<TextEditingController> emailController = new TextEditingController().obs;
  Rx<TextEditingController> noHpController = new TextEditingController().obs;
  Rx<TextEditingController> alamatController = new TextEditingController().obs;
  Rx<DateTime?> tanggalLahir = Rx<DateTime?>(null);
  RxInt hobi = RxInt(0);
  RxList<Hobby> listHobby = <Hobby>[].obs;
  RxBool onLoading = false.obs;
  User user = User();
  String? facebookValue;
  String token = "";
  bool internetStatuserror = false;

  @override
  void onInit() {
    super.onInit();
    getHobbies();
  }

  /// get auth Token from API
  // Future<void> getToken() async {
  //   final result = await authProvider.fetchToken();
  //   print(result.statusCode);
  //   if (result.statusCode == 200) {
  //     token = result.data["token"];
  //     StoreProvide.storeString("token", token);
  //     getHobbies();
  //   } else {
  //     getToken();
  //   }
  // }

  // get list of hobbies from API
  Future<void> getHobbies() async {
    final result = await hobbyProvider.fetchHobbies();
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
    user = new User(
      name: namaController.value.text,
      phoneNumber: noHpController.value.text,
      birthDate: DateFormat('yyyy-MM-dd').format(tanggalLahir.value!),
      address: alamatController.value.text,
      follower: int.parse(facebookValue!),
    );
    Get.toNamed('hobi-signup');
  }

  void checkHobby() {
    String? message = Validate.select(hobi.value);
    if (message != null) {
      Get.showSnackbar(GetSnackBar(
        message: message,
        duration: Duration(seconds: 2),
      ));
    } else {
      user = user.copyWith(hobby: hobi.value);
      // print(user.toString());
      // return;
      doSignup();
    }
  }

  /// signup to create new user
  Future<void> doSignup() async {
    onLoading.value = true;

    /// post user data to API
    print(user.toMap());
    final result = await authProvider.doSignup(user.toMap());
    if (result.statusCode == REQUEST_SUCCESS) {
      final userData = result.data;
      
      String userPhoneNumber = userData["no_hp"];
      String userBirthDate = userData["tanggal_lahir"];

      final signin = await authProvider.doSignin({
        "no_hp" : userPhoneNumber,
        "tanggal_lahir" : userBirthDate
      });
      if (signin.statusCode == REQUEST_SUCCESS) {
        /// store user data to SharedPreferences
        StoreProvide.storeMap("user", signin.data[0]);
        final token = signin.data[0]['token'];
        print(token);
        StoreProvide.storeString("token", token);
        /// update user
        Get.offAndToNamed('landing-trauma');
        // Get.offAll(() => LandingTraumaQuiz());
      }
    } else if (result.statusCode == INTERNET_ERROR) {
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
      );
    } else {
      Get.showSnackbar(GetSnackBar(
        message: "${result.message}",
        duration: Duration(seconds: 2),
      ));
    }
    onLoading.value = false;
  }
}
