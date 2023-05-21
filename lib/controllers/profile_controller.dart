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
  RxList<Hobby> listHobby = <Hobby>[].obs;
  Rx<int?> hobi = Rx<int?>(null);

  @override
  void onInit() {
    super.onInit();
    // if (!authC.isSignin.value) {
    //   authC.auth();
    // }
    setUsertoFields();
    getHobbies();
  }



  void setUsertoFields() async {
    User user = User.fromJson((await StoreProvide.getMap('user'))!);
    print("------USER : ${user.toString()}------");
    String? token = await StoreProvide.getString("token");

    final identity = await AuthProvider.user(token??'0', user.id??0);

    if(identity.success){
      user = user.copyWith(address: identity.data['alamat']);
    }

    nameController.value = new TextEditingController(text: user.name);
    birthDate.value = user.birthDate != null ? DateTime.parse(user.birthDate!) : null;
    addressController.value = new TextEditingController(text: user.address);
    facebookValue.value = user.follower.toString();
    hobi.value = user.hobby;
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
    final result = await hobbyProvider.fetchHobbies();
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
        // follower: int.parse(facebookValue.value!),
        // hobby: hobi.value
        );

    String? token = await StoreProvide.getString("token");
    
    final result = await authProvider.updateUser(user.id!, user.toMap(),
        token: token);

    if (result.success) {
      authC.user.value = user;
      StoreProvide.storeMap("user", user.toMap());
      onLoading.value = false;
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
