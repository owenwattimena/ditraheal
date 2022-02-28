part of "../../pages.dart";

class TraumaQuiz extends StatefulWidget {
  _TraumaQuizState createState() => _TraumaQuizState();
}

class _TraumaQuizState extends State<TraumaQuiz> {
  Map<String, bool> jawabanTerpilih = {
    "benar_sekali": false,
    "cukup_benar": false,
    "hampir_tidak_benar": false,
    "sama_sekali_tidak_benar": false,
  };
  String jawaban = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: "Tes Level Trauma",
        titleCenter: true,
        showBackButton: false,
      ),
      body: Stack(
        children: [
          Container(color: Colors.white),
          SafeArea(
            child: ListView(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  height: 180,
                  color: primaryColor,
                  child: Center(
                    child: AutoSizeText(
                      "Masalah kesulitan untuk tidur akibat sering mengingat peristiwa bencana  yang telah terjadi tidak akan terjadi lagi kepada saya karena saya akan mampu mengabaikan kenangan buruk tersebut.",
                      style: primaryTextStyle.copyWith(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(height: 24),
                SelectCardWidget(
                  margin: EdgeInsets.only(left: 24, right: 24, bottom: 6),
                  title: "Benar Sekali",
                  isSelected: jawabanTerpilih['benar_sekali']!,
                  onTap: (val) {
                    setState(() {
                      if (!jawabanTerpilih['benar_sekali']!) {
                        jawabanTerpilih['benar_sekali'] = val;
                        jawabanTerpilih['cukup_benar'] = !val;
                        jawabanTerpilih['hampir_tidak_benar'] = !val;
                        jawabanTerpilih['sama_sekali_tidak_benar'] = !val;
                      } else
                        jawabanTerpilih['benar_sekali'] = !val;
                    });
                  },
                ),
                SelectCardWidget(
                  margin: EdgeInsets.only(left: 24, right: 24, bottom: 6),
                  title: "Cukup Benar",
                  isSelected: jawabanTerpilih['cukup_benar']!,
                  onTap: (val) {
                    setState(() {
                      if (!jawabanTerpilih['cukup_benar']!) {
                        jawabanTerpilih['benar_sekali'] = !val;
                        jawabanTerpilih['cukup_benar'] = val;
                        jawabanTerpilih['hampir_tidak_benar'] = !val;
                        jawabanTerpilih['sama_sekali_tidak_benar'] = !val;
                      } else
                        jawabanTerpilih['cukup_benar'] = !val;
                    });
                  },
                ),
                SelectCardWidget(
                  margin: EdgeInsets.only(left: 24, right: 24, bottom: 6),
                  title: "Hampir Tidak Benar",
                  isSelected: jawabanTerpilih['hampir_tidak_benar']!,
                  onTap: (val) {
                    setState(() {
                      if (!jawabanTerpilih['hampir_tidak_benar']!) {
                        jawabanTerpilih['benar_sekali'] = !val;
                        jawabanTerpilih['cukup_benar'] = !val;
                        jawabanTerpilih['hampir_tidak_benar'] = !val;
                        jawabanTerpilih['hampir_tidak_benar'] = val;
                        jawabanTerpilih['sama_sekali_tidak_benar'] = !val;
                      } else
                        jawabanTerpilih['hampir_tidak_benar'] = !val;
                    });
                  },
                ),
                SelectCardWidget(
                  margin: EdgeInsets.only(left: 24, right: 24),
                  title: "Sama Sekali Tidak Benar",
                  isSelected: jawabanTerpilih['sama_sekali_tidak_benar']!,
                  onTap: (val) {
                    setState(() {
                      if (!jawabanTerpilih['sama_sekali_tidak_benar']!) {
                        jawabanTerpilih['benar_sekali'] = !val;
                        jawabanTerpilih['cukup_benar'] = !val;
                        jawabanTerpilih['hampir_tidak_benar'] = !val;
                        jawabanTerpilih['hampir_tidak_benar'] = !val;
                        jawabanTerpilih['sama_sekali_tidak_benar'] = val;
                      } else
                        jawabanTerpilih['sama_sekali_tidak_benar'] = !val;
                    });
                  },
                ),
                ButtonWidget(
                  margin: EdgeInsets.only(top: 24, left:24, right:24),
                  text: "Jawab",
                  onPressed: gotoResult,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void gotoResult() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TraumaResult(),
      ),
    );
  }
}
