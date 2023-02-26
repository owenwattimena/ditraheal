import 'package:ditraheal/models/models.dart';
import 'package:ditraheal/models/periode_treatment.dart';
import 'package:ditraheal/provider/periode_provider.dart';
import 'package:ditraheal/provider/tes_provider.dart';
import "package:get/get.dart";

import '../provider/store_provide.dart';

class PeriodeController extends GetxController {
  Rx<int?> periodeId = Rx<int?>(null);
  Rx<ScoreTest> skorTest = Rx<ScoreTest>(ScoreTest());


  Future<void> createPeriode() async {
    Map<String, dynamic>? jsonUser = await StoreProvide.getMap("user");

    if (jsonUser != null) {
      final result = await PeriodeProvider.createPeriode();
      if (result.success) {
        periodeId.value = result.data['id'];
      }
    }
  }

  Future<void> getPeriode() async {
    final result = await PeriodeProvider.periodeTreatment();

    if (result.success) {

      periodeId.value = (result.data as PeriodeTreatment).id;
    }
    periodeId.value = null;
  }

  Future<void> getSkor() async {
    int? _periodeTreatment = await StoreProvide.getInt('periode_treatment');

    final result = await TesProvider.getScore(_periodeTreatment ?? 0);
    if (result.success) {
      skorTest.update((val) {
        skorTest.value = result.data as ScoreTest;
      });
    }
  }
}
