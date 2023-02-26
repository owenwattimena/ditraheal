part of "../../pages.dart";

class TraumaQuiz extends StatefulWidget {
  _TraumaQuizState createState() => _TraumaQuizState();
}

class _TraumaQuizState extends State<TraumaQuiz> {
  final tesController = Get.find<QuestionController>();
  final loadingController = Get.find<LoadingController>();
  Map<String, bool> jawabanTerpilih = {
    "sangat_sering": false,
    "sering": false,
    "kadang_kadang": false,
    "jarang": false,
    "tidak_sama_sekali": false,
  };
  int jawaban = -1;

  @override
  void initState() {
    super.initState();
    tesController.questionIndex.value = 0;

    tesController.questionLoad.listen((value) {
      if (value) {
        context.loaderOverlay.show(widget: LoadingOverlay());
      } else {
        context.loaderOverlay.hide();
      }
    });

    tesController.getTraumaQuestion();
  }

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
                  title: "Sangat Sering",
                  isSelected: jawabanTerpilih['sangat_sering']!,
                  onTap: (val) {
                    setState(() {
                      jawaban = 4;
                      if (!jawabanTerpilih['sangat_sering']!) {
                        jawabanTerpilih['sangat_sering'] = val;
                        jawabanTerpilih['sering'] = !val;
                        jawabanTerpilih['kadang_kadang'] = !val;
                        jawabanTerpilih['jarang'] = !val;
                        jawabanTerpilih['tidak_sama_sekali'] = !val;
                      } else
                        jawabanTerpilih['sangat_sering'] = !val;
                    });
                  },
                ),
                SelectCardWidget(
                  margin: EdgeInsets.only(left: 24, right: 24, bottom: 6),
                  title: "Sering",
                  isSelected: jawabanTerpilih['sering']!,
                  onTap: (val) {
                    setState(() {
                      jawaban = 3;
                      if (!jawabanTerpilih['sering']!) {
                        jawabanTerpilih['sangat_sering'] = !val;
                        jawabanTerpilih['sering'] = val;
                        jawabanTerpilih['kadang_kadang'] = !val;
                        jawabanTerpilih['jarang'] = !val;
                        jawabanTerpilih['tidak_sama_sekali'] = !val;
                      } else
                        jawabanTerpilih['sering'] = !val;
                    });
                  },
                ),
                SelectCardWidget(
                  margin: EdgeInsets.only(left: 24, right: 24, bottom: 6),
                  title: "Kadang-kadang",
                  isSelected: jawabanTerpilih['kadang_kadang']!,
                  onTap: (val) {
                    setState(() {
                      jawaban = 2;
                      if (!jawabanTerpilih['kadang_kadang']!) {
                        jawabanTerpilih['sangat_sering'] = !val;
                        jawabanTerpilih['sering'] = !val;
                        jawabanTerpilih['kadang_kadang'] = val;
                        jawabanTerpilih['jarang'] = !val;
                        jawabanTerpilih['tidak_sama_sekali'] = !val;
                      } else
                        jawabanTerpilih['kadang_kadang'] = !val;
                    });
                  },
                ),
                SelectCardWidget(
                  margin: EdgeInsets.only(left: 24, right: 24, bottom: 6),
                  title: "Jarang",
                  isSelected: jawabanTerpilih['jarang']!,
                  onTap: (val) {
                    setState(() {
                      jawaban = 1;
                      if (!jawabanTerpilih['jarang']!) {
                        jawabanTerpilih['sangat_sering'] = !val;
                        jawabanTerpilih['sering'] = !val;
                        jawabanTerpilih['kadang_kadang'] = !val;
                        jawabanTerpilih['jarang'] = val;
                        jawabanTerpilih['tidak_sama_sekali'] = !val;
                      } else
                        jawabanTerpilih['jarang'] = !val;
                    });
                  },
                ),
                SelectCardWidget(
                  margin: EdgeInsets.only(left: 24, right: 24),
                  title: "Tidak Sama Sekali",
                  isSelected: jawabanTerpilih['tidak_sama_sekali']!,
                  onTap: (val) {
                    setState(() {
                      jawaban = 0;
                      if (!jawabanTerpilih['tidak_sama_sekali']!) {
                        jawabanTerpilih['sangat_sering'] = !val;
                        jawabanTerpilih['sering'] = !val;
                        jawabanTerpilih['kadang_kadang'] = !val;
                        jawabanTerpilih['jarang'] = !val;
                        jawabanTerpilih['tidak_sama_sekali'] = val;
                      } else
                        jawabanTerpilih['tidak_sama_sekali'] = !val;
                    });
                  },
                ),
                ButtonWidget(
                  margin: EdgeInsets.only(top: 24, left: 24, right: 24),
                  text: "Jawab",
                  onPressed: () async {
                    if (jawaban < 0) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Mohon masukan pilihan anda!'),
                      ));
                      return;
                    }
                    context.loaderOverlay.show(widget: LoadingAnswerOverlay());
                    int refSoal = tesController
                        .questions.value[tesController.questionIndex.value]!.id;

                    final success = await tesController.submitTraumaAnswer(
                        refSoal, jawaban);

                    if (success) {
                      if (tesController.questionIndex.value <
                          (tesController.totalQuestion.value - 1)) {
                        tesController.questionIndex.value += 1;
                        setState(() {
                          jawaban = -1;
                          jawabanTerpilih = {
                            "sangat_sering": false,
                            "sering": false,
                            "kadang_kadang": false,
                            "jarang": false,
                            "tidak_sama_sekali": false,
                          };
                        });
                        context.loaderOverlay.hide();
                      } else {
                        if (await tesController.updatePreTestScore()) {
                          await loadingController.getSkor();
                          context.loaderOverlay.hide();
                          this.gotoResult();
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
    );
  }

  void gotoResult() {
    Get.toNamed('trauma-result');
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => TraumaResult(),
    //   ),
    // );
  }
}
