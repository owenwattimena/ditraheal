part of "../pages.dart";

class HobiSignupPage extends StatefulWidget {
  const HobiSignupPage({Key? key}) : super(key: key);

  @override
  _HobiSignupPageState createState() => _HobiSignupPageState();
}

class _HobiSignupPageState extends State<HobiSignupPage> {
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
                  onPressed: () {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
