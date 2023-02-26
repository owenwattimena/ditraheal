import '../models/models.dart';
import '../utils/utils.dart';
import 'provider.dart';

import '../models/api_return_value.dart';
import 'store_provide.dart';

class TesProvider {
  static Future<ApiReturnValue> getQuestion(url) async {
    String? token = await StoreProvide.getString("token");
    ApiReturnValue result =
        await Provider.requestGet(url, token: token);

    if (result.statusCode == REQUEST_SUCCESS) {
      List<Question> questionList = [];
      for (var item in result.data) {
        Question question = Question.fromJson(item);
        questionList.add(question);
      }
      result.data = questionList;
      return result;
    } else {
      result.data = [];
    }
    return result;
  }

  // static Future<ApiReturnValue> getQuestion(String token) async {
  //   ApiReturnValue result =
  //       await Provider.requestGet(EFIKASI_URL, token: token);

  //   if (result.statusCode == REQUEST_SUCCESS) {
  //     List<Question> efikasiQuestionList = [];
  //     for (var item in result.data['data']) {
  //       Question question = Question.fromJson(item);
  //       efikasiQuestionList.add(question);
  //     }
  //     result.data = efikasiQuestionList;
  //     return result;
  //   }
  //   return result;
  // }

  static Future<bool> postPreTestAnswer(int periodeTreatment ,String preTestUrl, 
      int refSoal, int jawaban) async {
    // final periodeTreatment = await StoreProvide.getInt('periode_treatment');
    String? token = await StoreProvide.getString("token");

    Map<String, dynamic> body = {
      "referensi_soal": refSoal,
      "jawaban": jawaban
    };
    var url = preTestUrl + "$periodeTreatment";
    print(url);
    ApiReturnValue result = await Provider.requestPost(url, body, token: token);
    print("$periodeTreatment");
    print(body);
    print(result.message);
    return result.success;
  }

  static Future<ApiReturnValue> getScore(int periodeTreatment)async{
    String? token = await StoreProvide.getString("token");
    ApiReturnValue result = await Provider.requestGet(PRE_TEST_SCORE + '/$periodeTreatment', token: token);

    if(result.success)
    {
      result.data = ScoreTest.fromJson(result.data);
    }
    return result;
  }
  
  static Future<ApiReturnValue> updatePreTestScore(int periodeTreatment)async{
    String? token = await StoreProvide.getString("token");
    ApiReturnValue result = await Provider.requestPost(PRE_UPDATE_SCORE + '/$periodeTreatment', {}, token: token);
    print("Update pre test skor : ${result.data}");
    if(result.success)
    {
      result.data = UpdateScoreTest.fromJson(result.data);
    }

    return result;
  }

  static Future<ApiReturnValue> updatePostTestScore(int periodeTreatment)async{

    print("ID = $periodeTreatment");
    String? token = await StoreProvide.getString("token");
    ApiReturnValue result = await Provider.requestPost(POST_UPDATE_SCORE + '$periodeTreatment', {}, token: token);

    if(result.success)
    {
      result.data = UpdateScorePostTest.fromJson(result.data);
    }
    return result;
  }
}
