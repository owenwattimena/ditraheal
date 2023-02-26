part of "../../pages.dart";

class LandingTraumaQuiz extends StatefulWidget {
  const LandingTraumaQuiz({Key? key}) : super(key: key);

  @override
  _LandingTraumaQuizState createState() => _LandingTraumaQuizState();
}

class _LandingTraumaQuizState extends State<LandingTraumaQuiz> {

  // final questionC = Get.put(QuestionController());
  final questionC = Get.find<QuestionController>();


  User user = User();
  @override
  void initState() {
    super.initState();
    StoreProvide.getMap('user').then((value) {
      setState((){
        user = User.fromJson(value!);
      });
    });
  }
  
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
                width: deviceWidth - (24 * 2),
                child: Text(
                  "${user.name}, sebelum melakukan pemulihan trauma silahkan isi kuisioner untuk melihat level trauma anda. Pada kuisioner tersedia pilihan jawaban atas suatu pertanyaan. Setiap jawaban memiliki skor masing-masing. Semakin besar skor semakin tinggi tingkat kepercayaan anda terhadap suatu pertanyaan.",
                  style: primaryTextStyle,
                ),
                primaryButtonText: "Mulai Tes",
                primaryButtonOnPressed: gotoTraumaQuiz,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void gotoTraumaQuiz() {
    Get.toNamed('/trauma-quiz');
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => TraumaQuiz(),
    //   ),
    // );
  }
}
