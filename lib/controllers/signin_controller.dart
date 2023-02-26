import 'package:ditraheal/models/api_return_value.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../pages/pages.dart';
import '../provider/auth_provider.dart';
import '../provider/periode_provider.dart';
import '../provider/store_provide.dart';
import '../utils/utils.dart';

class SigninController extends GetxController{
  final AuthProvider authProvider = AuthProvider();
  RxBool onLoading = false.obs;
  String token = "";
  bool internetStatuserror = false;

  /// Proses Login
  /// 1. cek nomor hp dan tgl lahir
  /// 2. jika benar cek periode user
  /// 3. jika tidak ada
  Future<void> signin(String noHp, String tanggalLahir) async{

    onLoading.value = true;
    final result = await authProvider.doSignin({
      "no_hp" : noHp,
      "tanggal_lahir" : tanggalLahir
     });

    if(result.statusCode == REQUEST_SUCCESS){
        StoreProvide.storeMap("user", result.data[0]);
        final token = result.data[0]['token'];
        StoreProvide.storeString("token", token);
        Get.offAllNamed('loading-page');
    }else{
      Get.showSnackbar(GetSnackBar(
        message: "${result.message}",
        duration: Duration(seconds: 2),
      ));
    }
    onLoading.value = false;
  }
}