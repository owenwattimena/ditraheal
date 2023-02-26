part of "../pages.dart";

class Pemulihan extends StatefulWidget {
  const Pemulihan({Key? key}) : super(key: key);

  @override
  State<Pemulihan> createState() => _PemulihanState();
}

class _PemulihanState extends State<Pemulihan> {
  final periodeC = Get.find<PeriodeController>();
  final treatmentC = Get.find<TreatmentController>();
  @override
  Widget build(BuildContext context) {
    // final authC = Get.find<AuthController>();
    // final loadingC = Get.find<LoadingController>();
    if(periodeC.skorTest.value.postTestEfikasi != null) return TreatmentResult();
    return Obx(
      () => (periodeC.skorTest.value.levelTrauma == 'rendah')
          ? TreatmentNot()
          : ((treatmentC.listDayli.value.length <= 0)
              /// CEK LIST DAYLI TREATMENT
              ? TreatmentEmpty()
              : TreatmentView(context)),
    );
  }
}
