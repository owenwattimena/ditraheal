import 'package:ditraheal/models/models.dart';

import '../utils/utils.dart';
import 'provider.dart';
import 'store_provide.dart';

import '../models/api_return_value.dart';

class TreatmentProvider {
  static Future<ApiReturnValue> postTreatment(int periodeId) async {
    String? token = await StoreProvide.getString("token");
    ApiReturnValue result = await Provider.requestPost(
        POST_TREATMENT + periodeId.toString(), {},
        token: token);
    result.data = [];
    return result;
  }

  static Future<ApiReturnValue> dayli(int periodeId, {String? tanggal})async {
    String? token = await StoreProvide.getString("token");

    String url = DAYLI_TREATMENT + periodeId.toString();

    if(tanggal != null)
    {
      url = DAYLI_TREATMENT + periodeId.toString() + "&tanggal=\"$tanggal\"";
    }
    print(url);
    ApiReturnValue result = await Provider.requestGet(
        url,
        token: token);

    if (result.success) {
      List<DayliTreatment> list = [];

      for (var item in result.data) {
        DayliTreatment dayli = DayliTreatment.fromMap(item);
        list.add(dayli);
      }
      result.data = list;
      return result;
    }
    result.data = [];
    return result;
  }

  static Future<ApiReturnValue> checklistTreatment(bool val, int treat, bool currVal) async {

    if(val == currVal)
    return ApiReturnValue(message: 'Berhasil Checklist', statusCode: 200, success: true);

    String? token = await StoreProvide.getString("token");
    ApiReturnValue result = await Provider.requestPost(
        CHECKLIST_TREATMENT + '/' + treat.toString(), {},
        token: token);
    
    return result;
  }

  static Future<ApiReturnValue> validasi(int idTreat) async 
  {
    String? token = await StoreProvide.getString("token");

    ApiReturnValue result = await Provider.requestPost(
      VALIDASI_BEFORE_POST_TEST + idTreat.toString(), {}, token: token!);

    return result;
  }
}
