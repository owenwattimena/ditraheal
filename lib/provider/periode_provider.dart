import 'package:ditraheal/models/api_return_value.dart';
import 'package:ditraheal/models/periode_treatment.dart';
import 'package:intl/intl.dart';
import '../models/models.dart';
import '../utils/utils.dart';
import 'provider.dart';
import 'store_provide.dart';

class PeriodeProvider {

  static Future<ApiReturnValue> createPeriode() async {
    Map<String, dynamic>? _user = await StoreProvide.getMap("user");
    String? token = await StoreProvide.getString("token");
    final user = User.fromJson(_user!);
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter.format(now);

    ApiReturnValue result = await Provider.requestPost(PERIODE_TREATMENT_URL,
        {"identitas_id": user.id, "status": 1, "tanggal_awal": formatted},
        token: token);

    return result;
  }


  static Future<ApiReturnValue> periodeTreatment()async {
    Map<String, dynamic>? _user = await StoreProvide.getMap("user");
    String? token = await StoreProvide.getString("token");
    final user = User.fromJson(_user!);
    print('user id $_user');
    ApiReturnValue result = await Provider.requestGet(PERIODE_TREATMENT_URL + '?identitas_id=${user.id}', token: token);
    if(result.success){
      result.data = PeriodeTreatment.fromJson(result.data);
    }
    return result;
  }

  static Future<ApiReturnValue> postTreatment()async{
    String? token = await StoreProvide.getString("token");
    int? periodeTreatment = await StoreProvide.getInt("periode_treatment");
    ApiReturnValue result = await Provider.requestPost(POST_TREATMENT + '$periodeTreatment!', null, token: token);
    print("DATA : ${result.statusCode}");
    return result;
  }

}
