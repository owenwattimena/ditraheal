import 'package:ditraheal/controllers/question_controller.dart';
import 'package:get/get.dart';

import '../controllers/loading_controller.dart';
import '../controllers/treatment_controller.dart';

class QuestionBinding implements Bindings{
  @override
  void dependencies() {
    Get.put<LoadingController>(LoadingController(), permanent: true);
    Get.put<QuestionController>(QuestionController(), permanent: true);
    Get.put<TreatmentController>(TreatmentController(), permanent: true);
  }

}