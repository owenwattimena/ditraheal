part of "../../pages.dart";

class PostEfficationResult extends StatelessWidget {
  final tesController = Get.find<QuestionController>();

  @override
  Widget build(BuildContext context) {
    tesController.getScore();
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(24),
        color: primaryColor,
        child: Center(
          child: DialogWidget(
            title: "POS TES EFIKASI",
            child: Obx(()=> Text(
              "Hasil skor pos test efikasi anda adalah  ${tesController.postEfikasiScore.value}",
              textAlign: TextAlign.center,
            )),
            primaryButtonText: "Menu Utama",
            primaryButtonOnPressed: () {
              Get.toNamed('/home');
            },
            // secondaryButtonText: "Ulangi Tes",
            // secondaryButtonOnPressed: () {},
          ),
        ),
      ),
    );
  }
}
