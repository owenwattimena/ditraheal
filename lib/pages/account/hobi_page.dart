part of "../pages.dart";

class HobiPage extends StatefulWidget {
  const HobiPage({Key? key}) : super(key: key);

  @override
  _HobiPageState createState() => _HobiPageState();
}

class _HobiPageState extends State<HobiPage> {
  final SignupController SignupC = Get.find<SignupController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: "Hobi",
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 24,
          ),
          Column(
            children: SignupC.listHobby.map((hobi) {
              return Obx(
                () => SelectCardWidget(
                  margin: EdgeInsets.only(left: 24, right: 24, bottom: 12),
                  title: hobi.title,
                  isSelected: (SignupC.hobi.value == hobi.id) ? true : false,
                  imagePath: hobi.imagePath,
                  onTap: (val) {
                    SignupC.setHobi = hobi.id;
                  },
                ),
              );
            }).toList(),
          ),
          // SelectCardWidget(
          //   margin: EdgeInsets.only(left: 24, right: 24, bottom: 12),
          //   title: "Seni",
          //   isSelected: _selectedSeni,
          //   imagePath: "assets/images/seni_hobi_icon.png",
          //   onTap: (val) {
          //     SignupC.setHobi = "SENI";
          //     setState(() {
          //       _selectedSeni = val;
          //     });
          //   },
          // ),
          // SelectCardWidget(
          //   margin: EdgeInsets.only(left: 24, right: 24, bottom: 12),
          //   title: "Baca",
          //   isSelected: _selectedBaca,
          //   imagePath: "assets/images/baca_hobi_icon.png",
          //   onTap: (val) {
          //     SignupC.setHobi = "BACA";
          //     setState(() {
          //       _selectedBaca = val;
          //     });
          //   },
          // ),
          // SelectCardWidget(
          //   margin: EdgeInsets.only(left: 24, right: 24),
          //   title: "Olahraga",
          //   isSelected: _selectedOlahraga,
          //   imagePath: "assets/images/olahraga_hobi_icon.png",
          //   onTap: (val) {
          //     SignupC.setHobi = "OLAHRAGA";
          //     setState(() {
          //       _selectedOlahraga = val;
          //     });
          //   },
          // ),
          ButtonWidget(
            margin: EdgeInsets.only(top: 24, left: 24, right: 24),
            text: "Simpan",
            onPressed: () {
              Get.back();
            },
          ),
        ],
      ),
    );
  }
}
