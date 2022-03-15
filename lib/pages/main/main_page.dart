part of "../pages.dart";

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // AuthController authC = Get.put(AuthController());
  AuthController authC = Get.find<AuthController>();
  int _tabIndex = 0;

  List<Widget> _tabs = [
    SingleChildScrollView(child: Dashboard()),
    Pemulihan(),
  ];

  @override
  void initState() {
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
          SafeArea(
            child: _tabIndex == 0 ? _tabs[_tabIndex] : _tabs[_tabIndex],
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
        },
      ),
    );
  }
}
