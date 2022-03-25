import 'dart:async';
import 'dart:io';
import '../models/api_return_value.dart';

class Provider {
  static Future<ApiReturnValue> request(Function doSomething) async {
    ApiReturnValue result;
    try {
      result = doSomething as ApiReturnValue;
    } on TimeoutException {
      // print("time out");
      result = ApiReturnValue(
        data: null,
        message: "error. Request timeout",
        statusCode: 408,
      );
    } on SocketException {
      // print("socket");
      result = ApiReturnValue(
        data: null,
        message: "error. SocketException",
        statusCode: 400,
      );
    } catch (e) {
      print("catch : $e");
      result = ApiReturnValue(
        data: null,
        message: "error. ${e.toString()}",
        statusCode: 400,
      );
    }
    return result;
  }
}
