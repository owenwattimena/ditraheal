part of '../../pages.dart';

class EfficationQuiz extends StatefulWidget {
  const EfficationQuiz({Key? key}) : super(key: key);

  @override
  State<EfficationQuiz> createState() => _EfficationQuizState();
}

class _EfficationQuizState extends State<EfficationQuiz> {
  final tesController = Get.find<QuestionController>();
  final treatC = Get.find<TreatmentController>();
  Map<String, bool> jawabanTerpilih = {
    "benar_sekali": false,
    "cukup_benar": false,
    "hampir_tidak_benar": false,
    "sama_sekali_tidak_benar": false,
  };
  int jawaban = -1;

  @override
  void initState() {
    super.initState();
    tesController.questionLoad.listen((value) {
      if (value) {
        context.loaderOverlay.show(widget: LoadingOverlay());
      } else {
        context.loaderOverlay.hide();
      }
    });
    tesController.getEfficationQuestion();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: "Tes Efikasi Diri",
        titleCenter: true,
        showBackButton: false,
      ),
      body: LoaderOverlay(
        useDefaultLoading: false,
        overlayWidget: Center(
          child: Container(
            height: 60,
            width: 200,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              SpinKitFadingCircle(
                color: Colors.blue[400],
                size: 35.0,
              ),
              SizedBox(width: 20),
              Text("Menyimpan jawaban",
                  style: TextStyle(
                      color: Colors.blue[400], fontWeight: FontWeight.w300))
            ]),
          ),
        ),
        child: Stack(
          children: [
            Container(color: Colors.white),
            SafeArea(
              child: ListView(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    height: 180,
                    color: primaryColor,
                    child: Obx(
                      () => Center(
                        child: tesController.questions.value.isNotEmpty
                            ? AutoSizeText(
                                tesController
                                    .questions
                                    .value[tesController.questionIndex.value]!
                                    .question,
                                style: primaryTextStyle.copyWith(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              )
                            : Text('No Data'),
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
                        jawaban = 4;
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
                        jawaban = 3;
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
                        jawaban = 2;
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
                        jawaban = 1;
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
                    margin: EdgeInsets.only(top: 24, left: 24, right: 24),
                    text: "Jawab",
                    onPressed: () async {
                      if (jawaban <= 0) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Mohon masukan pilihan anda!'),
                        ));
                        return;
                      }

                      context.loaderOverlay
                          .show(widget: LoadingAnswerOverlay());
                      int refSoal = tesController.questions
                          .value[tesController.questionIndex.value]!.id;

                      final success = await tesController
                          .submitEfficationAnswer(refSoal, jawaban);
                      if (success) {
                        if (tesController.questionIndex.value <
                            (tesController.totalQuestion.value - 1)) {
                          tesController.questionIndex.value += 1;
                          setState(() {
                            jawaban = -1;
                            jawabanTerpilih = {
                              "benar_sekali": false,
                              "cukup_benar": false,
                              "hampir_tidak_benar": false,
                              "sama_sekali_tidak_benar": false,
                            };
                          });
                          context.loaderOverlay.hide();
                        } else {
                          if (await tesController.updatePreTestScore()) {

                            await treatC.generateTreatment();
                            context.loaderOverlay.hide();
                            Get.toNamed('/efikasi-result');
                            // this.gotoResult();
                          }
                          // print('Ambil hasil dan pindah halaman');
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                              'Gagal menyimpan jawaban. Silahkan coba lagi!'),
                        ));
                        context.loaderOverlay.hide();
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void gotoResult()async {
    await treatC.generateTreatment();
    Get.offAndToNamed('/efikasi-result');

    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => EfficationResult(),
    //   ),
    // );
  }
}
