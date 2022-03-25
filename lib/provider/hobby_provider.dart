import 'dart:async';
import '../models/api_return_value.dart';
import '../models/models.dart';
import '../utils/utils.dart';
import 'provider.dart';

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
  }
}
