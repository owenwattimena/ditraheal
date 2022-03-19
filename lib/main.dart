import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'pages/pages.dart';
import 'utils/utils.dart';
import 'widgets/widgets.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return DismissKeyboard(
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
        // A widget which will be started on application startup
        home: SignupPage(),
      ),
    );
  }
}
