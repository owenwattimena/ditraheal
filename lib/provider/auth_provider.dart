import 'dart:async';
import '../models/api_return_value.dart';
// import 'https://flutlab.io/root/app/lib/models/models.dart';
import 'provider.dart';
import '../utils/utils.dart';

class AuthProvider {
  /// Fetch API TOKEN data from API
  static Future<ApiReturnValue> checkToken(String token) async {
    return await Provider.requestGet(CHECK_TOKEN_URL + token, token: token);
  }

  static Future<ApiReturnValue> user(String token, int id) async {
    return await Provider.requestGet(IDENTITIES_URL + '/' + id.toString(), token: token);
  }

  Future<ApiReturnValue> doSignup(Map body) async {
    return Provider.requestPost(IDENTITIES_URL, body);
  }

  Future<ApiReturnValue> doSignin(Map body) async {
    return Provider.requestPost(LOGIN_URL, body);
  }

  Future<ApiReturnValue> updateUser(int id, Map body, {String? token}) async {
    return Provider.requestPut(IDENTITIES_URL + '/$id', body, token: token);
  }
}
