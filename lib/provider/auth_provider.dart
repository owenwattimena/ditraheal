import '../utils/constants.dart';
import 'package:get/get.dart';
class AuthProvider extends GetConnect{
  /// Fetch API TOKEN data from API
  Future<Response> fetchToken({String username = "adm", String password = "jok724n"}) {
    final form = {
      'username' : username,
      'password' : password,
    };
    return post(LOGIN_URL, form, contentType: 'JSON');
  }
}