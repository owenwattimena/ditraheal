import 'dart:async';
// import 'dart:io';

import '../models/api_return_value.dart';
import 'provider.dart';
import '../utils/constants.dart';
// import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthProvider {
  /// Fetch API TOKEN data from API
  Future<ApiReturnValue> fetchToken({String username = "adm", String password = "jok742n"}) async {
    print("fetch token");
    return Provider.request(() async {
      var url = Uri.parse(LOGIN_URL);
      Map<String, String> body = {
        'username': username,
        'password': password,
      };
      http.Client client = http.Client();
      var response = await client
          .post(
            url,
            headers: {
              "Content-Type": "application/json; charset=UTF-8",
              "Access-Control-Allow-Origin": "*",
              "Access-Control-Allow-Credentials": "true", // Required for cookies, authorization headers with HTTPS
              "Access-Control-Allow-Headers": "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
              "Access-Control-Allow-Methods": "POST, OPTIONS"
            },
            body: json.encode(body),
          )
          .timeout(Duration(seconds: 10));
      var jsonResponse = json.decode(response.body);
      print(jsonResponse);
      if (response.statusCode == 200) {
        // print("success");
        return ApiReturnValue(
          data: jsonResponse,
          message: "success",
          statusCode: 200,
        );
      } else {
        // print("error");
        return ApiReturnValue(
          data: jsonResponse,
          message: "error",
          statusCode: response.statusCode,
        );
      }
    });

    // try {
    //   var url = Uri.parse(LOGIN_URL);
    //   Map<String, String> body = {
    //     'username': username,
    //     'password': password,
    //   };
    //   http.Client client = http.Client();
    //   var response = await client
    //       .post(
    //         url,
    //         headers: {
    //           "Content-Type": "application/json; charset=UTF-8",
    //           "Access-Control-Allow-Origin": "*",
    //           "Access-Control-Allow-Credentials": "true", // Required for cookies, authorization headers with HTTPS
    //           "Access-Control-Allow-Headers": "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
    //           "Access-Control-Allow-Methods": "POST, OPTIONS"
    //         },
    //         body: json.encode(body),
    //       )
    //       .timeout(Duration(seconds: 10));
    //   var jsonResponse = json.decode(response.body);
    //   if (response.statusCode == 200) {
    //     return ApiReturnValue(
    //       data: jsonResponse,
    //       message: "success",
    //       statusCode: 200,
    //     );
    //   } else {
    //     return ApiReturnValue(
    //       data: jsonResponse,
    //       message: "error",
    //       statusCode: response.statusCode,
    //     );
    //   }
    // } on TimeoutException {
    //   return ApiReturnValue(
    //     data: null,
    //     message: "error. Request timeout",
    //     statusCode: 408,
    //   );
    // } on SocketException {
    //   return ApiReturnValue(
    //     data: null,
    //     message: "error. SocketException",
    //     statusCode: 400,
    //   );
    // } catch (e) {
    //   return ApiReturnValue(
    //     data: null,
    //     message: "error. ${e.toString()}",
    //     statusCode: 400,
    //   );
    // }
  }

  // Future<ApiReturnValue> doSignup({String? token}) async {
  //   try {} catch (e) {}
  //   return ApiReturnValue(message: "", statusCode: 200);
  // }
}
