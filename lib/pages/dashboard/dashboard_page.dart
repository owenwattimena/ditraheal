part of "../pages.dart";

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  // AuthController authC = Get.put(AuthController());
  AuthController authC = Get.find<AuthController>();
  int _tabIndex = 0;
  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    double deviceWidth = MediaQuery.of(context).size.width;
    // double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Stack(
          children: [
            Container(
              height: statusBarHeight,
              color: primaryColor,
            ),
            SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeaderWithCard(
                        onAccountTap: () => Get.to(AccountPage()),
                        user: authC.namaController.value.text,
                        cardWidth: (deviceWidth / 2) - 24 - 6),
                    SizedBox(height: 70),
                    Container(
                      decoration: BoxDecoration(
                        color: lightGreenColor,
                        border: Border.all(color: darkGreenColor, width: 1),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 24),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Text(
                        "Mr. Survivor anda berada pada level trauma rendah. Anda tidak perlu mengikuti pemulihan trauma. ",
                        style: primaryTextStyle.copyWith(color: darkGreenColor, fontSize: 12),
                      ),
                    ),
                    SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: DashboardContent(),
                    ),
                    SizedBox(height: 24),
                    ButtonWidget(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      text: "Expert System",
                      onPressed: () {},
                    ),
                    SizedBox(height: 24),
                  ],
                ),
              ),
            )
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Beranda',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.healing),
                label: 'Pemulihan',
              ),
            ],
            currentIndex: _tabIndex,
            selectedItemColor: accentColor,
            selectedLabelStyle: primaryTextStyle,
            showUnselectedLabels: false,
            unselectedItemColor: Color(0xffBDBDBD),
            onTap: (index) {
              setState(() => _tabIndex = index);
            }));
  }
}
