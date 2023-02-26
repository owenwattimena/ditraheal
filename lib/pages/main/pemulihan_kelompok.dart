part of "../pages.dart";

class PemulihanKelompok extends StatelessWidget {
  const PemulihanKelompok({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final authC = Get.find<AuthController>();
    // final loadingC = Get.find<LoadingController>();
    // return TreatmentResult();
    final periodeC = Get.find<PeriodeController>();
    final treatmentC = Get.find<TreatmentController>();
    if(periodeC.skorTest.value.postTestEfikasi != null) return Center(child:Text("Treatment Kelompok telah selesai"));
    return Obx(
      () => (periodeC.skorTest.value.levelTrauma == 'rendah')
          ? TreatmentNot()
          : ((treatmentC.listDayli.value.length <= 0)
              /// CEK LIST DAYLI TREATMENT
              ? TreatmentEmpty()
              : TreatmentKelompokView()),
    );
  }

}
