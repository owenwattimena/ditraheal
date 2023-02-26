import 'dart:async';
import '../models/api_return_value.dart';
import '../models/models.dart';
import '../utils/utils.dart';
import 'provider.dart';

class HobbyProvider {
  Future<ApiReturnValue> fetchHobbies() async {
    ApiReturnValue result = await Provider.requestGet(HOBBIES_URL);
    print('HOBI STATUS : ${result.message}');
    if (result.statusCode == REQUEST_SUCCESS) {
      List<Hobby> hobbyList = [];
      print(result);
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
