import 'dart:async';
import '../models/api_return_value.dart';
// import 'https://flutlab.io/root/app/lib/models/models.dart';
import 'provider.dart';
import '../utils/utils.dart';

class AuthProvider {
  /// Fetch API TOKEN data from API
  Future<ApiReturnValue> fetchToken({String username = "adm", String password = "jok742n"}) async {
    Map body = {
      'username': username,
      'password': password
    };
    return Provider.requestPost(LOGIN_URL, body);
  }

  Future<ApiReturnValue> doSignup(Map body, {String? token}) async {
    return Provider.requestPost(IDENTITIES_URL, body, token: token);
  }

  Future<ApiReturnValue> updateUser(int id, Map body, {String? token}) async {
    return Provider.requestPut(IDENTITIES_URL + '/$id', body, token: token);
  }
}
