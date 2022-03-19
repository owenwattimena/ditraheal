import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  Rx<TextEditingController> namaController = new TextEditingController().obs;
  Rx<TextEditingController> emailController = new TextEditingController().obs;
  Rx<TextEditingController> noHpController = new TextEditingController().obs;
  Rx<TextEditingController> alamatController = new TextEditingController().obs;
  Rx<DateTime?> tanggalLahir = DateTime.now().obs;
  RxString hobi = "".obs;
  String? facebookValue;

  @override
  void dispose() {
    super.dispose();

  }

  List<String> get fbFollowers => "fb_followers".tr.split(",");

  set setTanggalLahir(DateTime? value) {
    tanggalLahir.value = value;
  }

  set setHobi(String value) {
    hobi.value = value;
  }

  void facabookFollowers(String value) {
    facebookValue = value;
    update();
  }

  /// Validation
  String? nullCheck(val, {String? label}) {
    if (val.isEmpty) return (label != null ? label + " " : "") + 'can_not_be_empty'.tr;
  }

  String? phoneValidate(val, {String? label}) {
    String pattern = r"^(^08)(\d{3,4}){2}\d{3,4}$";
    RegExp regex = RegExp(pattern);
    if (val.isEmpty)
      return (label != null ? label + " " : "") + 'can_not_be_empty'.tr;
    else if (!regex.hasMatch(val)) return 'invalid_phone_number'.tr;
  }

  String? dateValidate(datetime, {String? label}) {
    if (datetime == null) return (label != null ? label + " " : "") + 'can_not_be_empty'.tr;
  }

  String? optionCheck(val, {String? label}) {
    // if (val.isEmpty) return 'please_select_option'.tr;
    return val == null ? (label != null ? label + " " : "") + 'please_select_option'.tr : null;
  }
}
