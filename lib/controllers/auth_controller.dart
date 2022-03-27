import 'package:ditraheal/models/models.dart';
import 'package:ditraheal/provider/store_provide.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  RxBool isSignin = RxBool(false);
  Rx<User> user = Rx<User>(User());
  Rx<String?> token = Rx<String?>(null);

  @override
  void onInit() {
    auth();
    super.onInit();
  }

  Future<void> auth() async {
    try {
      token.value = await StoreProvide.getString("token");
      print("token : ${token.value}");
      Map<String, dynamic>? _user = await StoreProvide.getMap("user");
      if (_user != null) {
        user.update((val) {
          user.value = User.fromJson(_user);
        });
      }
      /// check if token is not epmty and user data is not empty
      if (token.value != null && user.value.id != null) {
        isSignin.value = true;
      } else
        StoreProvide.clearStore();
    } catch (e) {
      print("Error : $e");
    }
  }
}
