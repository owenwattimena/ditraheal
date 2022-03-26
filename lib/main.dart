import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'pages/pages.dart';
import 'utils/utils.dart';
import 'widgets/widgets.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

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

// class Test extends StatelessWidget {
//   const Test({ Key? key }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Center(child: Text('test')),
//     );
//   }
// }
