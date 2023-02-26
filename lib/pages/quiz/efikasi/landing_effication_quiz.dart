part of "../../pages.dart";

class LandingEfficationQuiz extends StatefulWidget {
  LandingEfficationQuiz({Key? key}) : super(key: key);

  @override
  State<LandingEfficationQuiz> createState() => _LandingEfficationQuizState();
}

class _LandingEfficationQuizState extends State<LandingEfficationQuiz> {
  final loadingC = Get.find<LoadingController>();
  final questionC = Get.find<QuestionController>();
  // final questionC = Get.lazyPut(()=>QuestionController());

  User user = User();
  @override
  void initState() {
    super.initState();
    questionC.getScore();
    StoreProvide.getMap('user').then((value) {
      setState(() {
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
                title: "TES EFIKASI DIRI",
                width: deviceWidth - (24 * 2),
                child: Obx(() => RichText(
                      text: TextSpan(
                        style: primaryTextStyle.copyWith(color:Colors.black),
                        children: [
                        TextSpan(
                            text:
                                "${user.name}, Anda telah melewati tes level trauma dan hasil tes tersebut menunjukan anda berada pada Level "),
                        loadingC.scoreTest.value.levelTrauma == 'tinggi'
                    ? TextSpan(
                        text: "TINGGI",
                        style: primaryTextStyle.copyWith(fontWeight: FontWeight.bold ,color: redColor))
                    : loadingC.scoreTest.value.levelTrauma == 'sedang'
                        ? TextSpan(
                            text: "SEDANG",
                            style:
                                primaryTextStyle.copyWith(fontWeight: FontWeight.bold ,color: primaryColor))
                        : TextSpan(
                            text: "RENDAH",
                            style: primaryTextStyle.copyWith(fontWeight: FontWeight.bold ,
                                color: darkGreenColor)),
                        TextSpan(
                            text: loadingC.scoreTest.value.levelTrauma !=
                                    'rendah'
                                ? "\n\nSelanjutnya anda akan mengikuti Tes Efikasi Diri. Pada tes ini telah di sediakan beberapa pertanyaan sehubungan dengan peristiwa bencana yang telah terjadi. \n\nUntuk menjawab pertanyaan tersebut telah disediakan pilihlah jawaban. Setiap jawaban memiliki skor masing-masing. Semakin tinggi skor semakin besar keyakinan anda terhadap pertanyaan tersebut."
                                : ""),
                      ]),
                      // style: primaryTextStyle,
                    )),
                primaryButtonText:
                    loadingC.scoreTest.value.levelTrauma == "rendah"
                        ? "Beranda"
                        : "Mulai Tes",
                primaryButtonOnPressed:
                    loadingC.scoreTest.value.levelTrauma == "rendah"
                        ? gotoHome
                        : gotoEfficationQuiz,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void gotoHome() {
    questionC.questionIndex.value = 0;
    Get.offAllNamed('home');
  }

  void gotoEfficationQuiz() {
    questionC.questionIndex.value = 0;

    Get.toNamed('/efikasi-quiz');
  }
}
