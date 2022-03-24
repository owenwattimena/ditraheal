import 'dart:async';
import 'dart:io';
import '../models/api_return_value.dart';

class Provider {
  static Future<ApiReturnValue> request(Function doSomething) async {
    try {
      return doSomething as ApiReturnValue;
    } on TimeoutException {
      return ApiReturnValue(
        data: null,
        message: "error. Request timeout",
        statusCode: 408,
      );
    } on SocketException {
      return ApiReturnValue(
        data: null,
        message: "error. SocketException",
        statusCode: 400,
      );
    } catch (e) {
      return ApiReturnValue(
        data: null,
        message: "error. ${e.toString()}",
        statusCode: 400,
      );
    }
  }
}
