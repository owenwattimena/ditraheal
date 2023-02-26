import 'package:ditraheal/provider/store_provide.dart';
import 'package:get/get.dart';

import '../models/models.dart';
import '../models/periode_treatment.dart';
import '../provider/periode_provider.dart';
import '../provider/tes_provider.dart';
import '../utils/utils.dart';

class QuestionController extends GetxController {
  Rx<List<Question?>> questions = Rx<List<Question>>([]);
  // Rx<List<Question?>> efficationQuestion = Rx<List<Question>>([]);
  RxInt questionIndex = 0.obs;
  RxInt totalQuestion = 0.obs;
  Rx<int?> periodeTreatment = 0.obs;
  Rx<bool> questionLoad = true.obs;
  Rx<int> preTraumaScore = 0.obs;
  Rx<int> preEfikasiScore = 0.obs;
  Rx<int> postEfikasiScore = 0.obs;
  Rx<String?> levelTrauma = ''.obs;
  // Rx<PostTreatment> postTreatment = Rx<PostTreatment>(PostTreatment());

  @override
  void onInit() async {
    super.onInit();
    periodeTreatment.value = await periodeTreatmentId();
    this.getScore();
    print("PI $periodeTreatment");
  }

  Future<int?> periodeTreatmentId() async {
    final _periodeTreatment = await StoreProvide.getInt('periode_treatment');
    print(_periodeTreatment);

    if (_periodeTreatment == null) {
      final result = await PeriodeProvider.periodeTreatment();
      if (result.success) {
        StoreProvide.storeInt(
            'periode_treatment', (result.data as PeriodeTreatment).id!);
        return result.data['id'];
      }
      await this.createPeriode();
      return await this.periodeTreatmentId();
    } else {
      return _periodeTreatment;
    }
  }

  Future<bool> updatePreTestScore() async {
    final _periodeTreatment = await StoreProvide.getInt('periode_treatment');
    final result = await TesProvider.updatePreTestScore(_periodeTreatment ?? 0);
    if (result.success) {
      UpdateScoreTest data = result.data as UpdateScoreTest;
      preTraumaScore.value = data.totalLevelTrauma ?? 0;
      preEfikasiScore.value = data.totalScoreEfikasi ?? 0;
      levelTrauma.value = data.levelTrauma;
      print(data);
      return true;
    }
    return false;
  }

  Future<bool> updatePostTestScore() async {
    int? _periodeTreatment = await StoreProvide.getInt('periode_treatment');
    if (_periodeTreatment != null) {
      final result = await TesProvider.updatePostTestScore(_periodeTreatment);
      if (result.success) {
        UpdateScorePostTest data = result.data as UpdateScorePostTest;
        preTraumaScore.value = data.totalLevelTrauma ?? 0;
        preEfikasiScore.value = data.totalScoreEfikasi ?? 0;
        print(data);
        return true;
      }
    }
    return false;
  }

  Future<bool> getScore() async {
    int? _periodeTreatment = await StoreProvide.getInt('periode_treatment');

    final result = await TesProvider.getScore(_periodeTreatment ?? 0);
    if (result.success) {
      ScoreTest data = result.data as ScoreTest;
      preTraumaScore.value = data.totalLevelTrauma ?? 0;
      preEfikasiScore.value = data.totalScoreEfikasi ?? 0;
      postEfikasiScore.value = data.postTestEfikasi ?? 0;
      print("post = ${data.postTestEfikasi}");
      return true;
    }
    return false;
  }

  // function for get trauma question
  void getTraumaQuestion() async {
    questionLoad.value = true;
    final result = await TesProvider.getQuestion(TRAUMA_QUESTION_URL);
    if (result.success) {
      List<Question> data = result.data;
      totalQuestion.value = data.length;
      questions.update((val) {
        questions.value = data;
      });
    }
    questionLoad.value = false;
  }

  // function for get effication question
  void getEfficationQuestion() async {
    questionLoad.value = true;
    final result = await TesProvider.getQuestion(EFFICATION_QUESTION_URL);
    if (result.success) {
      List<Question> data = result.data;
      totalQuestion.value = data.length;
      questions.update((val) {
        questions.value = data;
      });
    }
    questionLoad.value = false;
  }

  Future<void> createPeriode() async {
    
    //      * BUAT PERIODE TREATMENT DI SINI
    //      * CEK SUCCESS OR NOT
    //      * IF SUCCESS UPDATE EFFICACY QUESTION
    //      * ELSE REDIRECT BACK
    //      
    // String? token = await StoreProvide.getString("token");
    Map<String, dynamic>? jsonUser = await StoreProvide.getMap("user");

    if (jsonUser != null) {
      // User user = User.fromJson(jsonUser);
      final result = await PeriodeProvider.createPeriode();
      if (result.success) {
        StoreProvide.storeInt('periode_treatment', result.data['id']);
      } else {
        Get.showSnackbar(GetSnackBar(
          message: "${result.message}",
          duration: Duration(seconds: 2),
        ));
      }
    }
  }

  Future<bool> submitTraumaAnswer(int refSoal, int jawaban) async {
    if (periodeTreatment.value == null) return false;
    return await TesProvider.postPreTestAnswer(
        periodeTreatment.value!, PRE_TES_LEVEL_TRAUMA_URL, refSoal, jawaban);
  }

  Future<bool> submitEfficationAnswer(int refSoal, int jawaban) async {
    if (periodeTreatment.value == null) return false;
    return await TesProvider.postPreTestAnswer(
        periodeTreatment.value!, PRE_TES_EFFICATION_URL, refSoal, jawaban);
  }

  Future<bool> submitPostEfficationAnswer(int refSoal, int jawaban) async {
    if (periodeTreatment.value == null) return false;
    return await TesProvider.postPreTestAnswer(
        periodeTreatment.value!, POST_TEST_EFFICATION, refSoal, jawaban);
  }

  // Future<void> doPostTreatment() async {
  //   final _postTreatment = await PeriodeProvider.postTreatment();
  //   if (_postTreatment.success) {
  //     print("data = ${_postTreatment.data}");
  //     postTreatment.update((val) {
  //       postTreatment.value =
  //           PostTreatment.fromJson(_postTreatment.data['generate_lvl_trauma']);
  //     });
  //   }else{
  //     print('not success');
  //   }
  // }
}
