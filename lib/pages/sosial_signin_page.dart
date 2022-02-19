part of 'pages.dart';

class SosialSigninPage extends StatefulWidget {
  _SosialSigninPageState createState() => _SosialSigninPageState();
}

class _SosialSigninPageState extends State<SosialSigninPage> {
  String? _facebookValue;
  List _followerFb = [
    "Tidak ada",
    "1 s/d 1K",
    "1K s/d 10K",
    "10K s/d 100K",
    "100K s/d 1Jt",
    "Lebih dari 1Jt"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        iconPath: "assets/icons/ArrowLeft.png",
        title: "Media Sosial",
      ),
      body: Stack(
        children: [
          Container(color: Colors.white),
          SafeArea(
            child: ListView(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(24, 0, 24, 4),
                  child: Text("Jumlah Folower FB"),
                ),
                Container(
                  height: 50,
                  margin: EdgeInsets.fromLTRB(24, 0, 24, 4),
                  padding: EdgeInsets.symmetric(horizontal: 11),
                  decoration: BoxDecoration(
                    color: greyColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(3),
                    ),
                  ),
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: _facebookValue,
                    underline: SizedBox(),
                    hint: Text("Jumlah Follower Facebook"),
                    items: _followerFb.map((val) {
                      return DropdownMenuItem<String>(
                        child: Text(val),
                        value: val,
                      );
                    }).toList(),
                    onChanged: (String? val) {
                      setState(() => _facebookValue = val!);
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
