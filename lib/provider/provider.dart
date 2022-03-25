import 'dart:async';
import 'dart:io';
import '../models/api_return_value.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Provider {
  static Map<String, String> headers = {
    "Content-Type": "application/json; charset=UTF-8",
    "Access-Control-Allow-Origin": "*",
    "Access-Control-Allow-Credentials": "true", // Required for cookies, authorization headers with HTTPS
    "Access-Control-Allow-Headers": "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
    "Access-Control-Allow-Methods": "POST, OPTIONS"
  };

  static Future<ApiReturnValue> request(Future<ApiReturnValue> Function() doSomething) async {
    ApiReturnValue result;
    try {
      result = await doSomething();
    } on TimeoutException {
      result = ApiReturnValue(
        data: null,
        message: "error. Request timeout",
        statusCode: 408,
      );
    } on SocketException {
      result = ApiReturnValue(
        data: null,
        message: "error. SocketException",
        statusCode: 400,
      );
    } catch (e) {
      result = ApiReturnValue(
        data: null,
        message: "error. ${e.toString()}",
        statusCode: 400,
      );
    }
    return result;
  }

  static Future<ApiReturnValue> requestPost(String url, Map body, {String? token}) async {
    Map<String, String> headers = {
      "Content-Type": "application/json; charset=UTF-8",
      "Access-Control-Allow-Origin": "*",
      "Access-Control-Allow-Credentials": "true", // Required for cookies, authorization headers with HTTPS
      "Access-Control-Allow-Headers": "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
      "Access-Control-Allow-Methods": "POST, OPTIONS"
    };
    if (token != null) {
      headers["Authorization"] = "Bearer $token";
    }
    return Provider.request(() async {
      var uri = Uri.parse(url);
      http.Client client = http.Client();
      var response = await client
          .post(
            uri,
            headers: headers,
            body: json.encode(body),
          )
          .timeout(Duration(seconds: 10));
      var jsonResponse = json.decode(response.body);
      print(jsonResponse);
      if (response.statusCode == 200) {
        return ApiReturnValue(
          data: jsonResponse,
          message: "success",
          statusCode: 200,
        );
      } else {
        return ApiReturnValue(
          data: jsonResponse,
          message: "error",
          statusCode: response.statusCode,
        );
      }
    });
  }

  static Future<ApiReturnValue> requestGet(String url, {String? token}) async {
    if (token != null) {
      Provider.headers["Authorization"] = "Bearer $token";
      print(Provider.headers);
    }
    return Provider.request(() async {
      var uri = Uri.parse(url);
      http.Client client = http.Client();
      var response = await client
          .get(
            uri,
            headers: Provider.headers,
          )
          .timeout(Duration(seconds: 10));
      var jsonResponse = json.decode(response.body);
      print(jsonResponse);
      if (response.statusCode == 200) {
        return ApiReturnValue(
          data: jsonResponse,
          message: "success",
          statusCode: 200,
        );
      } else {
        return ApiReturnValue(
          data: jsonResponse,
          message: "error",
          statusCode: response.statusCode,
        );
      }
    });
  }
}
