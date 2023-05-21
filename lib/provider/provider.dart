import 'dart:async';
import 'dart:io';
import 'package:ditraheal/utils/utils.dart';

import '../models/api_return_value.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Provider {
  static Map<String, String> headers = {
    "Content-Type": "application/json; charset=UTF-8",
    "Access-Control-Allow-Origin": "*",
    "Access-Control-Allow-Credentials":
        "true", // Required for cookies, authorization headers with HTTPS
    "Access-Control-Allow-Headers":
        "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
    "Access-Control-Allow-Methods": "POST, OPTIONS",
    "Accept": "application/json"
  };

  static Future<ApiReturnValue> request(
      Future<ApiReturnValue> Function() doSomething) async {
    ApiReturnValue result;
    try {
      result = await doSomething();
    } on TimeoutException {
      result = ApiReturnValue(
          data: null,
          message: "error. Request timeout",
          statusCode: 408,
          success: false);
    } on SocketException {
      result = ApiReturnValue(
          data: null,
          message: "error. SocketException",
          statusCode: INTERNET_ERROR,
          success: false);
    } catch (e) {
      print("Catch error. ${e.toString()}");
      result = ApiReturnValue(
          data: null,
          message: "Catch error. ${e.toString()}",
          statusCode: 400,
          success: false);
    }
    return result;
  }

  static Future<ApiReturnValue> requestPost(String url, Map? body,
      {String? token}) async {
    if (token != null) {
      Provider.headers["Authorization"] = "Bearer $token";
    }
    return Provider.request(() async {
      var uri = Uri.parse(url);
      http.Client client = http.Client();

      var response = await client
          .post(
            uri,
            headers: Provider.headers,
            body: body != null ? json.encode(body) : body,
          )
          .timeout(Duration(seconds: REQUEST_TIME));
      var jsonResponse = json.decode(response.body);
      print("POST = $jsonResponse");
      final statusCode = jsonResponse['code'] ?? response.statusCode;
      print("$statusCode");

      if (statusCode == REQUEST_SUCCESS) {
        return ApiReturnValue(
            data: jsonResponse['data'],
            message: jsonResponse['messages'],
            statusCode: 200,
            success: true);
      } else {
        return ApiReturnValue(
            data: jsonResponse,
            message: jsonResponse['messages'],
            statusCode: jsonResponse['code'],
            success: false);
      }
    });
  }

  static Future<ApiReturnValue> requestGet(String url, {String? token}) async {
    if (token != null) {
      Provider.headers["Authorization"] = "Bearer $token";
    }
    return Provider.request(() async {
      var uri = Uri.parse(url);
      http.Client client = http.Client();
      var response = await client
          .get(
            uri,
            headers: Provider.headers,
          )
          .timeout(Duration(seconds: REQUEST_TIME));
      var jsonResponse = json.decode(response.body);
      print("GET RESPONSE : $jsonResponse");
      final statusCode = jsonResponse['code'] ?? response.statusCode;
      bool success = jsonResponse['success'] ?? jsonResponse['status'];
      if (statusCode == REQUEST_SUCCESS) {
        return ApiReturnValue(
            data: jsonResponse['data'],
            message: jsonResponse['messages'],
            statusCode: 200,
            success: success);
      } else {
        return ApiReturnValue(
            data: null,
            message: jsonResponse['messages'],
            statusCode: jsonResponse['code'],
            success: success);
      }
    });
  }

  static Future<ApiReturnValue> requestPut(String url, Map body,
      {String? token}) async {
    if (token != null) {
      Provider.headers["Authorization"] = "Bearer $token";
    }
    return Provider.request(() async {
      var uri = Uri.parse(url);
      http.Client client = http.Client();
      var response = await client
          .put(
            uri,
            headers: Provider.headers,
            body: json.encode(body),
          )
          .timeout(Duration(seconds: REQUEST_TIME));
      var jsonResponse = json.decode(response.body);
      // print(jsonResponse);
      if (response.statusCode == 200) {
        return ApiReturnValue(
            data: jsonResponse['data'],
            message: jsonResponse['messages'],
            statusCode: 200,
            success: jsonResponse['success']);
      } else {
        return ApiReturnValue(
            data: null,
            message: jsonResponse['messages'],
            statusCode: response.statusCode,
            success: jsonResponse['success']);
      }
    });
  }
}
