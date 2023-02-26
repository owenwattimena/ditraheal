part of "../pages.dart";

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final authC = Get.find<AuthController>();
  final loadingC = Get.find<LoadingController>();
  final dashC = Get.find<DashboardController>();
  final treatmentC = Get.find<TreatmentController>();
  final periodeC = Get.find<PeriodeController>();

  List<Widget> _tabs = [
    SingleChildScrollView(child: Dashboard()),
    Pemulihan(),
    PemulihanKelompok(),
  ];

  @override
  void initState() {
    authC.auth();
    loadingC.getTreatmentPeriod().then((data) async {
      if (data.success) {
        await periodeC.getSkor();

          treatmentC.periode.value = data.data;
          DateTime today = DateTime.now();
          DateTime dayTreat = (data.data.tanggalSedangTreatment! != "-") ? DateTime.parse(data.data.tanggalSedangTreatment!) : today;
          String treatDay = today.toString();
        if (periodeC.skorTest.value.postTestEfikasi == null) {
          if (today.isBefore(dayTreat)) {
            treatDay = data.data.tanggalSedangTreatment!;
          }
          print(treatmentC.periode.value.tanggalAkhirTreatment);
          treatmentC.treatmentDay.value = treatDay;
          treatmentC.getDayli(tanggal: treatDay);
          treatmentC.getTreatKel();
        } else {
          treatmentC
              .statBar()
              .then((value) => treatmentC.listStatBar.value = value);
          treatmentC.dayDiff.value =
              DateTime.parse(data.data.tanggalAkhirTreatment!)
                  .difference(DateTime.parse(treatDay))
                  .inDays;
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
        body: Stack(
          children: [
            Container(
              height: statusBarHeight,
              color: primaryColor,
            ),
            Obx(() => SafeArea(
                  child: _tabs[dashC.tabIndex.value],
                ))
          ],
        ),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Beranda',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.healing),
                label: 'Pemulihan',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.supervised_user_circle),
                label: 'Kelompok',
              ),
            ],
            currentIndex: dashC.tabIndex.value,
            selectedItemColor: accentColor,
            selectedLabelStyle: primaryTextStyle,
            showUnselectedLabels: false,
            unselectedItemColor: Color(0xffBDBDBD),
            onTap: (index) {
              dashC.tabIndex.value = index;
            },
          ),
        ));
  }
}
