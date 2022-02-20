part of "../pages.dart";

class HobiSigninPage extends StatefulWidget {
  const HobiSigninPage({Key? key}) : super(key: key);

  @override
  _HobiSigninPageState createState() => _HobiSigninPageState();
}

class _HobiSigninPageState extends State<HobiSigninPage> {
  bool _selectedSeni = false;
  bool _selectedBaca = false;
  bool _selectedOlahraga = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: "Hobi",
      ),
      body: Stack(
        children: [
          Container(),
          SafeArea(
            child: ListView(
              children: [
                SizedBox(
                  height: 24,
                ),
                SelectCardWidget(
                  title: "Seni",
                  isSelected: _selectedSeni,
                  imagePath: "assets/images/seni_hobi_icon.png",
                  onTap: (val) {
                    setState(() {
                      _selectedSeni = val;
                    });
                  },
                ),
                SelectCardWidget(
                  title: "Baca",
                  isSelected: _selectedBaca,
                  imagePath: "assets/images/baca_hobi_icon.png",
                  onTap: (val) {
                    setState(() {
                      _selectedBaca = val;
                    });
                  },
                ),
                SelectCardWidget(
                  title: "Olahraga",
                  isSelected: _selectedOlahraga,
                  imagePath: "assets/images/olahraga_hobi_icon.png",
                  onTap: (val) {
                    setState(() {
                      _selectedOlahraga = val;
                    });
                  },
                ),
                ButtonWidget(
                  text: "Daftar",
                  onPresed: () {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
