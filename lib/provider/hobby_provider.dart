import 'dart:async';
// import 'dart:io';

import '../models/api_return_value.dart';
import '../models/models.dart';

import '../utils/constants.dart';
import 'provider.dart';

// import 'package:get/get.dart';
import 'dart:convert';
// import 'package:http/http.dart' as http;

class HobbyProvider {
  Future<ApiReturnValue> fetchHobbies({required String token}) async {
    ApiReturnValue result = await Provider.requestGet(HOBBIES_URL, token: token);
    if (result.statusCode == REQUSET_SUCCESS) {
      List<Hobby> hobbyList = [];
      for (var item in result.data) {
        Hobby hobi = Hobby.fromJson(item);
        hobbyList.add(hobi);
      }
      result.data = hobbyList;
      return result;
    }
    return result;
    // try {
    //   var url = Uri.parse(HOBBIES_URL);
    //   http.Client client = http.Client();
    //   var response = await client
    //       .get(
    //         url,
    //         headers: {
    //           "Authorization" : "Bearer $token",
    //           "Content-Type": "application/json; charset=UTF-8",
    //         },
    //       )
    //       .timeout(Duration(seconds: 10));
    //   var jsonResponse = json.decode(response.body);
    //   if (response.statusCode == 200) {
    //     List<Hobby> hobbyList = [];
    //     for (var item in jsonResponse) {
    //       Hobby hobi = Hobby.fromJson(item);
    //       hobbyList.add(hobi);
    //     }

    //     return ApiReturnValue(
    //       data: hobbyList,
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
}
