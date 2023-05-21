import 'package:ditraheal/models/api_return_value.dart';
import 'package:ditraheal/utils/utils.dart';

import 'provider.dart';

class LinkProvider{
  static Future<ApiReturnValue> getLink(int idHobi)async{
    ApiReturnValue result = await Provider.requestGet(LINK_MEDSOS_URL + "$idHobi");
    if (result.statusCode == REQUEST_SUCCESS) {
      // List<FbFollower> fbFollowerList = [];
      // print("FB : $result");
      // for (var item in result.data) {
      //   print("LINK : $item");
      // }
      // result.data = fbFollowerList;
      result.data = result.data[0];
      return result;
    }
    return result;
  }
}


