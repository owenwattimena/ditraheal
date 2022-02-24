part of "../pages.dart";

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: statusBarHeight,
            color: primaryColor,
          ),
          SafeArea(
            child: ListView(
              children: [
                Container(
                  padding: EdgeInsets.only(
                    left: 24,
                    right: 24,
                    bottom: 18,
                    top: 18,
                  ),
                  height: 180,
                  color: primaryColor,
                  child: Stack(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.account_circle_outlined,
                                color: Colors.white,
                                size: 32,
                              ),
                              onPressed: () {
                                Scaffold.of(context).openDrawer();
                              },
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              child: Text("Selamat datang",
                                  style: primaryTextStyle.copyWith(
                                    color: Colors.white,
                                  )),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              child: Text("Owen Wattimena",
                                  style: primaryTextStyle.copyWith(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                        Positioned(
                          top: 124,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: (deviceWidth - (24*2) - 6) / 2,
                                height: 95,
                                color: Colors.white,
                              ),
                              Container(
                                width: (deviceWidth - (24*2) - 6) / 2,
                                height: 95,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ]),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
