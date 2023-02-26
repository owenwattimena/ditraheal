import 'package:ditraheal/models/models.dart';
import 'package:ditraheal/provider/store_provide.dart';
import 'package:ditraheal/utils/utils.dart';
import 'package:get/get.dart';

import '../pages/pages.dart';
import '../provider/auth_provider.dart';

class AuthController extends GetxController {
  // RxBool isSignin = RxBool(false);
  Rx<User> user = Rx<User>(User());
  // Rx<String?> token = Rx<String?>(null);

  @override
  void onInit() async {
    // await auth();
    super.onInit();
  }

  Future<bool> auth() async {
    try {
      String? token = await StoreProvide.getString("token");

      /// get token in session
      if (token != null) {
        final result = await AuthProvider.checkToken(token);

        /// get user by token
        print("TOKEN: $token");
        if (!result.success) {
          StoreProvide.clearStore();
          return false;
        }

        // final _user = await AuthProvider.user(token, result.data[0]['id']);
        // if (!_user.success) {
        //   StoreProvide.clearStore();
        //   return false;
        // }

        final _user = await StoreProvide.getMap('user');
        user.update((val) {
          user.value = User.fromJson(_user!);
          // user.value = User.fromJson(result.data[0]);
        });
        // StoreProvide.storeMap("user", result.data[0]);
        return true;
      } else {
        StoreProvide.clearStore();
        return false;
      }
    } catch (e) {
      print("Error : $e");
      return false;
    }
  }

  Future<void> logout() async {
    StoreProvide.clearStore();
    Get.offAllNamed('/');
  }
}
