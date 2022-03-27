import '../provider/hobby_provider.dart';
import '../provider/store_provide.dart';

import '../models/models.dart';
import '../utils/utils.dart';
import '../provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'auth_controller.dart';

class ProfileController extends GetxController {
  final authC = Get.find<AuthController>();
  final authProvider = AuthProvider();
  final hobbyProvider = HobbyProvider();
  Rx<TextEditingController> nameController = new TextEditingController().obs;
  Rx<DateTime?> birthDate = Rx<DateTime?>(null);
  Rx<TextEditingController> addressController = new TextEditingController().obs;
  Rx<String?> facebookValue = Rx<String?>(null);
  RxBool onLoading = false.obs;
  RxList listHobby = <Hobby>[].obs;
  RxInt hobi = 0.obs;
  @override
  void onInit() {
    super.onInit();
    setUsertoFields();
    getHobbies();
  }

  void setUsertoFields() {
    User user = authC.user.value;
    nameController.value = new TextEditingController(text: user.name);
    birthDate.value = DateTime.parse(user.birthDate!);
    addressController.value = new TextEditingController(text: user.address);
    facebookValue.value = user.follower.toString();
    hobi.value = user.hobby!;
  }

  /// get list of fb followers from [Language] class
  List<String> get fbFollowers => "fb_followers".tr.split(",");
  // set and update FB Followers
  void facabookFollowers(String value) {
    facebookValue.value = value;
  }

   // set and update hobi
  set setHobi(int value) {
    hobi.value = value;
  }

  // get list of hobbies from API
  Future<void> getHobbies() async {
    final result = await hobbyProvider.fetchHobbies(token: authC.token.value!);
    print(result.message);
    if (result.statusCode == 200) {
      listHobby.value = result.data!;
    } else {
      getHobbies();
    }
  }

  void updateUser() async {
    onLoading.value = true;
    User user = authC.user.value.copyWith(
        name: nameController.value.text,
        birthDate: DateFormat('yyyy-MM-dd').format(birthDate.value!),
        address: addressController.value.text,
        follower: int.parse(facebookValue.value!),
        hobby: hobi.value);
    final result = await authProvider.updateUser(user.id!, user.toMap(),
        token: authC.token.value);
    if (result.statusCode == REQUSET_SUCCESS) {
      authC.user.value = user;
      StoreProvide.storeMap("user", user.toMap());
      Get.back();
    } else {
      onLoading.value = false;
      Get.showSnackbar(GetSnackBar(
        message: result.message,
        duration: Duration(seconds: 2),
      ));
    }
  }
  
}
