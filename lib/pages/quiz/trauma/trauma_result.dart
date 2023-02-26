part of "../../pages.dart";

class TraumaResult extends StatelessWidget {
  final loadingController = Get.find<LoadingController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(24),
        color: primaryColor,
        child: Center(
            child: Obx(
          () => DialogWidget(
            title: "LEVEL TRAUMA",
            child: RichText(
              text: TextSpan(
                style: primaryTextStyle.copyWith(color:Colors.black),
                children: [
                TextSpan(text: "Pre Skor Level Trauma anda adalah "),
                loadingController.scoreTest.value.levelTrauma == 'tinggi'
                    ? TextSpan(
                        text: "TINGGI",
                        style: primaryTextStyle.copyWith(fontWeight: FontWeight.bold ,color: redColor))
                    : loadingController.scoreTest.value.levelTrauma == 'sedang'
                        ? TextSpan(
                            text: "SEDANG",
                            style:
                                primaryTextStyle.copyWith(fontWeight: FontWeight.bold ,color: primaryColor))
                        : TextSpan(
                            text: "RENDAH",
                            style: primaryTextStyle.copyWith(fontWeight: FontWeight.bold ,
                                color: darkGreenColor)),
              ]),
              textAlign: TextAlign.center,
            ),
            primaryButtonText:
                loadingController.scoreTest.value.levelTrauma == 'rendah'
                    ? 'Halaman Utama'
                    : "Lanjut Ke Tes Efikasi",
            primaryButtonOnPressed: () {
              if (loadingController.scoreTest.value.levelTrauma == 'rendah') {
                Get.offAndToNamed('home');
              } else {
                Get.offAndToNamed('landing-efikasi');
                // Navigator.push(context, MaterialPageRoute(builder:(context)=>LandingEfficationQuiz()));
              }
            },
            // secondaryButtonText: "Ulangi Tes",
            // secondaryButtonOnPressed: () {},
          ),
        )),
      ),
    );
  }
}
