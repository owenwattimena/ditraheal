
part of "../../pages.dart";

class LandingPostEfficationQuiz extends StatefulWidget {
  const LandingPostEfficationQuiz({Key? key}) : super(key: key);

  @override
  State<LandingPostEfficationQuiz> createState() => _LandingPostEfficationQuizState();
}

class _LandingPostEfficationQuizState extends State<LandingPostEfficationQuiz> {
    final loadingC = Get.find<LoadingController>();
  final questionC = Get.find<QuestionController>();
  // final questionC = Get.lazyPut(()=>QuestionController());

  User user = User();
  @override
  void initState() {
    super.initState();
    // questionC.getScore();
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
                title: "POST TES EFIKASI DIRI",
                width: deviceWidth - (24 * 2),
                child: Text(
                  "${user.name} Anda telah selesai mengerjakan personal treatment dan treatment kelompok.\nSilahkan lakukan Pos Tes Efikasi untuk melihat dampak pengobatan. ", 
                  style: primaryTextStyle,
                ),
                primaryButtonText: "Mulai Tes", primaryButtonOnPressed: gotoPostEfficationQuiz,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void gotoPostEfficationQuiz() {
    questionC.questionIndex.value = 0;

    Get.toNamed('/post-efikasi-quiz');
  }
}