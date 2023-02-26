import 'package:ditraheal/controllers/loading_controller.dart';
import 'package:ditraheal/models/api_return_value.dart';
import 'package:ditraheal/models/kel_berulang.dart';
import 'package:ditraheal/models/kel_sekali.dart';
import 'package:ditraheal/provider/treatment_kelompok_provider.dart';
import 'package:ditraheal/provider/treatment_provider.dart';
import 'package:get/get.dart';

import '../models/models.dart';
import '../models/periode_treatment.dart';
import '../provider/store_provide.dart';

class TreatmentController extends GetxController {
  Rx<int> checked = 0.obs;
  Rx<int> kelChecked = 0.obs;
  Rx<List<DayliTreatment>> listDayli = Rx<List<DayliTreatment>>([]);
  Rx<List<KelSekali>> listKelSekali = Rx<List<KelSekali>>([]);
  Rx<List<KelBerulang>> listKelBerulang = Rx<List<KelBerulang>>([]);
  Rx<int?> dayDiff = Rx<int?>(null);
  Rx<String?> treatmentDay = Rx<String?>(null);
  Rx<PeriodeTreatment> periode = Rx<PeriodeTreatment>(PeriodeTreatment());
  Rx<List<StatBar>?> listStatBar = Rx<List<StatBar>?>(null);
  Rx<int> tabIndex = 0.obs;
  Rx<int> longDayTreatment = Rx<int>(0);



  Future<bool> generateTreatment() async {
    int? _periodeTreatment = await StoreProvide.getInt('periode_treatment');

    final result =
        await TreatmentProvider.postTreatment(_periodeTreatment ?? 0);
    return result.success;
  }

  Future<void> getDayli({String? tanggal}) async {
    int? _periodeTreatment = await StoreProvide.getInt('periode_treatment');

    final dayli =
        await TreatmentProvider.dayli(_periodeTreatment ?? 0, tanggal: tanggal);

    if (dayli.success) {
      listDayli.update((val) {
        listDayli.value = dayli.data;
      });
      checked.value = 0;
      for (var item in listDayli.value) {
        if (item.checklist!) {
          checked.value += 1;
        }
      }
      dayDiff.value = DateTime.parse(periode.value.tanggalAkhirTreatment!)
          .difference(DateTime.parse(treatmentDay.value!))
          .inDays;
    }
  }

  // BUAT PEMANGGILAN TRETATMENT KELOMPOK DISINI
  Future<void> getTreatKel()async{
    int? _periodeTreatment = await StoreProvide.getInt('periode_treatment');
    final _listKelSekali = await TreatmentKelompokProvider.sekali(_periodeTreatment??0);
    final _listKelBerulang = await TreatmentKelompokProvider.berulang(_periodeTreatment??0);

    if ((_listKelSekali.data as List).isNotEmpty )  {
      listKelSekali.update((val) {
        listKelSekali.value = (_listKelSekali.data as List<KelSekali>);
      });
      kelChecked.value = 0;
      for (var item in listKelSekali.value) {
        if (item.checklist) {
          kelChecked.value += 1;
        }
      }
    }
    if ((_listKelBerulang.data as List).isNotEmpty) {
      listKelBerulang.update((val) {
        listKelBerulang.value = (_listKelBerulang.data as List<KelBerulang>);
      });
      kelChecked.value = 0;
      for (var item in listKelBerulang.value) {
        if (item.checklist) {
          kelChecked.value += 1;
        }
      }
    }

  }
  Future<List<StatBar>> statBar() async {

    List<StatBar> _list = [];

    final mulai = DateTime.parse(periode.value.tanggalAwalTreatment!);
    final akhir = DateTime.parse(periode.value.tanggalAkhirTreatment!);
    final difference = akhir.difference(mulai).inDays;
    int? _periodeTreatment = await StoreProvide.getInt('periode_treatment');
    
    for (var i = 0; i <= difference; i++) {
      final tanggal = mulai.add(Duration(days: i)).toString();
      final data = await TreatmentProvider.dayli(_periodeTreatment??0, tanggal: tanggal);
      
      if(data.success)
      {

        final _listDayTreat = data.data as List<DayliTreatment>;
        if(_listDayTreat.length > longDayTreatment.value)
        {
          longDayTreatment.value = _listDayTreat.length;
        }
        _list.add(StatBar(tanggalTreatment: tanggal, totalTreatment: _listDayTreat.length, totalChecked: (_listDayTreat.where((element) => element.checklist == true)).length ));
      }
    }
    return _list;
  }

  Future<bool> checlist(bool val, int treat, bool currVal) async {
    final result =
        await TreatmentProvider.checklistTreatment(val, treat, currVal);
    return result.success;
  }

  Future<bool> kelCheclistSekali(bool val, int treat, bool currVal) async {
    final result =
        await TreatmentKelompokProvider.checklistSekali(val, treat, currVal);
    return result.success;
  }

  Future<bool> kelCheclistBerulang(bool val, int treat, bool currVal, String key) async {
    final result =
        await TreatmentKelompokProvider.checklistBerulang(val, treat, currVal, key);
    return result.success;
  }

  Future<ApiReturnValue> validasiBeforePostTest() async
  {
    int? idTreat = await StoreProvide.getInt('periode_treatment');

    final result = await TreatmentProvider.validasi(idTreat ?? 0);
    print("MESSAGE : ${result.message}");
    return result;
    // if(result.message == "treatment belum lengkap")return false;
    // return true;
  }

}
