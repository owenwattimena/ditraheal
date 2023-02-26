import 'package:ditraheal/models/api_return_value.dart';
import 'package:ditraheal/models/models.dart';
import 'package:ditraheal/models/periode_treatment.dart';
import 'package:ditraheal/provider/tes_provider.dart';
import 'package:get/get.dart';

// import '../pages/pages.dart';
import '../provider/periode_provider.dart';
import '../provider/store_provide.dart';
// import '../provider/treatment_provider.dart';

class LoadingController extends GetxController {
  Rx<ScoreTest> scoreTest = Rx<ScoreTest>(ScoreTest());
  Rx<bool> loading = false.obs;

  @override
  void onInit() async {
    super.onInit();
    // await this.periodeTreatmentId();
  }

  Future<ApiReturnValue> getTreatmentPeriod()async{
    return await PeriodeProvider.periodeTreatment();
  }


  Future<void> onLoading() async {
    // int? _periodeTreatment = await StoreProvide.getInt('periode_treatment');
    // print('periode  $_periodeTreatment');

    // if (_periodeTreatment == null) {
    final result = await getTreatmentPeriod();
    if (result.success) {
      StoreProvide.storeInt('periode_treatment', (result.data as PeriodeTreatment).id!);
      final skor = await TesProvider.getScore((result.data as PeriodeTreatment).id!);
      if (skor.success) {
        ScoreTest scoreTest = skor.data;
        if (scoreTest.totalLevelTrauma == 0 ||
            scoreTest.totalLevelTrauma == null) {
          Get.toNamed('landing-trauma');
        } else if (scoreTest.totalScoreEfikasi == 0 ||
            scoreTest.totalScoreEfikasi == null) {
          Get.toNamed('landing-efikasi');
        } else {
          Get.offAllNamed('home');
        }
      } else {
        Get.toNamed('landing-trauma');
      }
    } else {
      await this.createPeriode();
    }
    // return await this.periodeTreatmentId();
    // }
    // else {
    //   print('not null');
    //   final skor = await TesProvider.getScore(_periodeTreatment);
    //   if (skor.success) {
    //     ScoreTest scoreTest = skor.data;
    //     if (scoreTest.totalLevelTrauma == null) {
    //       // jangan lupa ganti != => ==
    //       Get.toNamed('landing-trauma');
    //     }
    //     else if(scoreTest.totalLevelTrauma! <= 0){
    //       Get.toNamed('landing-trauma');
    //     }
    //      else if (scoreTest.totalScoreEfikasi == null) {
    //       await this.getSkor();
    //       Get.toNamed('landing-efikasi');
    //     }
    //     else if(scoreTest.totalScoreEfikasi! <= 0){
    //       await this.getSkor();
    //       Get.toNamed('landing-efikasi');
    //     }
    //     else {
    //       Get.offAllNamed('home');
    //     }
    //   } else {
    //     Get.toNamed('landing-trauma');
    //   }
    // }
  }

  Future<void> createPeriode() async {
    /**
    //      * BUAT PERIODE TREATMENT DI SINI
    //      * CEK SUCCESS OR NOT
    //      * IF SUCCESS UPDATE EFFICACY QUESTION
    //      * ELSE REDIRECT BACK
    //      */
    // String? token = await StoreProvide.getString("token");
    Map<String, dynamic>? jsonUser = await StoreProvide.getMap("user");

    if (jsonUser != null) {
      // User user = User.fromJson(jsonUser);
      final result = await PeriodeProvider.createPeriode();
      if (result.success) {
        StoreProvide.storeInt('periode_treatment', result.data['id']);
        Get.toNamed('landing-trauma');
      } else {
        Get.showSnackbar(GetSnackBar(
          message: "${result.message}",
          duration: Duration(seconds: 2),
        ));
        Get.toNamed('home');
      }
    }
  }

  Future<void> getSkor() async {
    int? _periodeTreatment = await StoreProvide.getInt('periode_treatment');

    final _scoreTest = await TesProvider.getScore(_periodeTreatment ?? 0);
    if (_scoreTest.success) {
      scoreTest.update((val) {
        scoreTest.value = _scoreTest.data;
      });
    } else {
      print('not success');
    }
  }
}
