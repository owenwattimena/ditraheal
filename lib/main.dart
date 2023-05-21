// 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

import 'package:ditraheal/bindings/SignupBinding.dart';
import 'package:flutter/material.dart';
// import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'bindings/AccountBinding.dart';
import 'bindings/HomeBinding.dart';
import 'bindings/LoadingBinding.dart';
import 'bindings/QuestionBinding.dart';
import 'bindings/SplashBinding.dart';
import 'pages/pages.dart';
import 'utils/utils.dart';
import 'widgets/widgets.dart';
import 'controllers/auth_controller.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final authC = Get.put(AuthController(), permanent: true);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GlobalLoaderOverlay(
      child: DismissKeyboard(
        child: GetMaterialApp(
          // Application name
          translations: Language(),
          locale: Locale("id"),
          title: 'app_name'.tr,
          // Application theme data, you can set the colors for the application as
          // you want
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          initialRoute: '/',
          getPages: [
            GetPage(name: '/', page: ()=> const SplashScreen(), binding: SplashBinding()),
            GetPage(name: '/signup', page: ()=> SignupPage(), binding: SignupBinding()),
            GetPage(name: '/hobi-signup', page: ()=> HobiSignupPage(), binding: SignupBinding()),
            GetPage(name: '/signin', page: ()=> SigninPage()),
            GetPage(name: '/loading-page', page: ()=> LoadingPage(), binding: LoadingBinding()),
            GetPage(name: '/landing-trauma', page: ()=> LandingTraumaQuiz(), binding: QuestionBinding()),
            GetPage(name: '/trauma-quiz', page: ()=> TraumaQuiz(), binding: QuestionBinding()),
            GetPage(name: '/trauma-result', page: ()=> TraumaResult(), binding: QuestionBinding()),
            GetPage(name: '/landing-efikasi', page: ()=> LandingEfficationQuiz(), binding: QuestionBinding()),
            GetPage(name: '/efikasi-quiz', page: ()=> EfficationQuiz(), binding: QuestionBinding()),
            GetPage(name: '/efikasi-result', page: ()=> EfficationResult(), binding: QuestionBinding()),
            GetPage(name: '/home', page: ()=> MainPage(), binding: HomeBinding()),
            GetPage(name: '/account-page', page: ()=> AccountPage(), binding: AccountBinding()),
            GetPage(name: '/landing-post-efikasi', page: ()=> LandingPostEfficationQuiz(), binding: QuestionBinding()),
            GetPage(name: '/post-efikasi-quiz', page: ()=> PostEfficationQuiz(), binding: QuestionBinding()),
            GetPage(name: '/post-efikasi-result', page: ()=> PostEfficationResult(), binding: QuestionBinding()),

          ]
          // A widget which will be started on application startup
          // home: Obx(() => (authC.isSignin.value) ? LandingTraumaQuiz() : SignupPage()),
          // home: SplashScreen(),
        ),
      ),
    );
  }
}
