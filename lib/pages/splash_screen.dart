part of 'pages.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final authC = Get.find<AuthController>();
  // final periodeC = Get.put(PeriodeController());

  @override
  void initState() {
    super.initState();
    startSplashScreen();
  }

  startSplashScreen() async {
    String route = '';
    final auth = await authC.auth();

    if (auth) {
        route = '/loading-page';
    } else {
      route = '/signup';
    }

    var duration = const Duration(seconds: 5);
    return Timer(duration, () {
      Get.toNamed(route);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('DITRAHEAL',
                style: primaryTextBoldStyle.copyWith(
                    fontSize: 25, color: primaryColor)),
            Text('Digtal Trauma Healing',
                style: primaryTextStyle.copyWith(color: primaryColor))
          ],
        ),
      ),
    );
  }
}
