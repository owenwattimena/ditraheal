import 'dart:async';
import '../models/api_return_value.dart';
import '../models/models.dart';
import '../utils/utils.dart';
import 'provider.dart';

class FbFollowerProvider {
  static Future<ApiReturnValue> fetchFollower() async {
    ApiReturnValue result = await Provider.requestGet(FB_FOLLOWER_URL);
    if (result.statusCode == REQUEST_SUCCESS) {
      List<FbFollower> fbFollowerList = [];
      print("FB : $result");
      for (var item in result.data["data"]) {
        FbFollower follower = FbFollower.fromMap(item);
        fbFollowerList.add(follower);
      }
      result.data = fbFollowerList;
      return result;
    }
    return result;
  }
}