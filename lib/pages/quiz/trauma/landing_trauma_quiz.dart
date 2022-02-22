part of "../../pages.dart";

class LandingTraumaQuiz extends StatefulWidget {
  const LandingTraumaQuiz({Key? key}) : super(key: key);

  @override
  _LandingTraumaQuizState createState() => _LandingTraumaQuizState();
}

class _LandingTraumaQuizState extends State<LandingTraumaQuiz> {
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: primaryColor,
            child: Center(
              child: DialogWidget(
                title: "TES LEVEL TRAUMA",
                width:deviceWidth - (24 * 2),
                child: Text(
                  "Sebelum melakukan pemulihan trauma silahkan isi kuisioner untuk melihat level trauma anda. Pada kuisioner tersedia pilihan jawaban atas suatu pertanyaan. Setiap jawaban memiliki skor masing-masing. Semakin besar skor semakin tinggi tingkat kepercayaan anda terhadap suatu pertanyaan.",
                  style: primaryTextStyle,
                ),
                primaryButtonText: "Mulai Tes",
                primaryButtonOnPressed: (){},
              ),
              
            ),
          ),
        ],
      ),
    );
  }
}
