import 'package:ditraheal/models/kel_sekali.dart';
import 'package:ditraheal/models/models.dart';

import '../models/kel_berulang.dart';
import '../utils/utils.dart';
import 'provider.dart';
import 'store_provide.dart';

import '../models/api_return_value.dart';

class TreatmentKelompokProvider {
  static Future<ApiReturnValue> sekali(int periodeId)async {
    String? token = await StoreProvide.getString("token");

    String url = TREAT_KEL_SEKALI + periodeId.toString();

    print(url);
    ApiReturnValue result = await Provider.requestGet(
        url,
        token: token);

    if (result.success == true && result.data != null) {
      List<KelSekali> list = [];

      for (var item in result.data) {
        KelSekali value = KelSekali.fromMap(item);
        list.add(value);
      }
      result.data = list;
      return result;
    }
    result.data = [];
    return result;
  }
  
  static Future<ApiReturnValue> berulang(int periodeId)async {
    String? token = await StoreProvide.getString("token");

    String url = TREAT_KEL_BERULANG + periodeId.toString();

    print(url);
    ApiReturnValue result = await Provider.requestGet(
        url,
        token: token);

    if (result.success && result.data != null) {
      List<KelBerulang> list = [];

      for (var item in result.data) {
        KelBerulang value = KelBerulang.fromMap(item);
        list.add(value);
      }
      result.data = list;
      return result;
    }
    result.data = [];
    return result;
  }

  static Future<ApiReturnValue> checklistSekali(bool val, int treat, bool currVal) async {

    if(val == currVal)
    return ApiReturnValue(message: 'Berhasil Checklist', statusCode: 200, success: true);

    String? token = await StoreProvide.getString("token");
    ApiReturnValue result = await Provider.requestPost(
        CHECLIST_TREAT_KEL_SEKALI + treat.toString(), {},
        token: token);
    
    return result;
  }
  
  static Future<ApiReturnValue> checklistBerulang(bool val, int treat, bool currVal, String key) async {

    if(val == currVal)
    return ApiReturnValue(message: 'Berhasil Checklist', statusCode: 200, success: true);

    Map<String, dynamic> post = {
      "treat" : {
        key : val == true ? 1 : 0,
      }
    };

    String? token = await StoreProvide.getString("token");
    ApiReturnValue result = await Provider.requestPost(
        CHECLIST_TREAT_KEL_BERULANG + treat.toString(), post,
        token: token);
    
    return result;
  }

}