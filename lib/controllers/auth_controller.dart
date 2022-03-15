import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


class AuthController extends GetxController{
  Rx<TextEditingController> namaController = new TextEditingController().obs;
  Rx<TextEditingController> emailController = new TextEditingController().obs;
  Rx<TextEditingController> noHpController = new TextEditingController().obs;
  Rx<TextEditingController> alamatController = new TextEditingController().obs;
  Rx<DateTime?> tanggalLahir = DateTime.now().obs;
  RxString hobi = "".obs;

  set setTanggalLahir(DateTime? value){
    tanggalLahir.value = value;
  }

  set setHobi(String value){
    hobi.value = value;
  }
}