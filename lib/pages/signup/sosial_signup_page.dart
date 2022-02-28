part of '../pages.dart';

class SosialSignupPage extends StatefulWidget {
  _SosialSignupPageState createState() => _SosialSignupPageState();
}

class _SosialSignupPageState extends State<SosialSignupPage> {
  String? _facebookValue, _instagramValue, _tiktokValue;
  List _folowers = [
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
                SizedBox(height: 24),
                InputSelectWidget(
                  value: _facebookValue,
                  label: "Follower Facebook",
                  hint: "Jumlah Folllower Facebook",
                  options: _folowers,
                  onChanged: (val) => setState(() => _facebookValue = val),
                ),
                InputSelectWidget(
                  value: _instagramValue,
                  label: "Follower Instagram",
                  hint: "Jumlah Folllower Instagram",
                  options: _folowers,
                  onChanged: (val) => setState(() => _instagramValue = val),
                ),
                InputSelectWidget(
                  value: _tiktokValue,
                  label: "Follower Tiktok",
                  hint: "Jumlah Folllower Tiktok",
                  options: _folowers,
                  onChanged: (val) => setState(() => _tiktokValue = val),
                ),
                ButtonWidget(
                  margin: EdgeInsets.only(top: 24, left:24, right:24),
                    text: "Selanjutnya",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HobiSignupPage(),
                        ),
                      );
                    },
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
