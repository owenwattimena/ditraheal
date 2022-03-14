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
  void initState() {
    super.initState();
  }

  void _showDialog() {
    Get.defaultDialog(
      title: 'Selamat',
      titlePadding: EdgeInsets.all(18),
      titleStyle: primaryTextBoldStyle.copyWith(fontSize: 14),
      content: Container(
        decoration: BoxDecoration(
          color: greyColor,
          borderRadius: BorderRadius.circular(12),
        ),
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.symmetric(horizontal: 9, vertical: 16),
        child: Text(
          "Hi, Mr. Survivor, anda telah menyelesaikan semua tugas yang diberikan. Ayo ulangi tes trauma dan efikasimu untuk melihat dampak pengobatannya.",
          style: primaryTextStyle,
        ),
      ),
      actions: [
        ButtonWidget(
          margin: EdgeInsets.only(top: 10, bottom: 8),
          text: "Ulangi Tes",
          padding: EdgeInsets.symmetric(horizontal: 10),
          onPressed: () => Get.back(),
        )
      ],
    );
  }

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
              child: _tabIndex == 0
                    ? SingleChildScrollView(
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
                              border:
                                  Border.all(color: darkGreenColor, width: 1),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            width: double.infinity,
                            margin: const EdgeInsets.symmetric(horizontal: 24),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: Text(
                              "Mr. Survivor anda berada pada level trauma rendah. Anda tidak perlu mengikuti pemulihan trauma. ",
                              style: primaryTextStyle.copyWith(
                                  color: darkGreenColor, fontSize: 12),
                            ),
                          ),
                          SizedBox(height: 12),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            child: DashboardContent(),
                          ),
                          SizedBox(height: 24),
                        ],
                      ),)
                    : Padding(
                        padding: EdgeInsets.all(24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 18, horizontal: 25),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    width: 80,
                                    margin: EdgeInsets.only(right: 12),
                                    child: Image.asset(
                                      "assets/images/clip_board.png",
                                    ),
                                  ),
                                  Expanded(
                                      flex: 1,
                                      child: Text(
                                          "Mr. Survivor, berikut ini adalah tugas yang harus anda selesaikan untuk mengobati trauma anda.",
                                          style: primaryTextStyle.copyWith(
                                              color: Colors.white)))
                                ],
                              ),
                            ),
                            SizedBox(height: 12),
                            Text(
                              "Hobi",
                              style: primaryTextBoldStyle,
                              textAlign: TextAlign.left,
                            ),
                            SizedBox(height: 8),
                            Column(children: [
                              CardWithCheck(
                                onChanged: (val) {
                                  _showDialog();
                                },
                              ),
                            ])
                          ],
                        ),
                      ),
                    /*Container(
                      child:Center(
                        child: Container(
                          child: IntrinsicHeight(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("TRAUMA RENDAH", style: primaryTextBoldStyle.copyWith(fontSize: 18),),
                                SizedBox(height: 12),
                                Text(
                                    "Anda tidak perlu mengikuti pemulihan trauma", style: primaryTextStyle.copyWith(fontSize: 14),),
                                SizedBox(height: 12),
                                ButtonWidget(
                                  text: "Ulangi Tes",
                                  onPressed: () => Get.back(),
                                  fullWidth: false,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      
              ),*/
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
