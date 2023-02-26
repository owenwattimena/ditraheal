part of "../../pages.dart";

class EfficationResult extends StatelessWidget {
  final tesController = Get.find<QuestionController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(24),
        color: primaryColor,
        child: Center(
          child: DialogWidget(
            title: "PRE TEST EFFICACY",
            child: Obx(()=> Text(
              "Hasil pre test skor ${tesController.preEfikasiScore.value}",
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
