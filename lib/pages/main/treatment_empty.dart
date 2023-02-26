import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/loading_controller.dart';
import '../../controllers/treatment_controller.dart';
import '../../shared/shared.dart';
import '../../widgets/widgets.dart';

class TreatmentEmpty extends StatelessWidget {
  const TreatmentEmpty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loadingC = Get.find<LoadingController>();
    final treatmentC = Get.find<TreatmentController>();
    return Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(
        'BELUM ADA TREATMENT',
        style: headlineTextStyle.copyWith(color: primaryColor),
      ),
      SizedBox(
        height: 12,
      ),
      Text(
        "Klik pada tombol \'Buat Treatment\' untuk membuat treatment anda.",
        style: primaryTextStyle.copyWith(color: darkGreyColor),
        textAlign: TextAlign.center,
      ),
      SizedBox(
        height: 36,
      ),
      Obx(()=>ButtonWidget(
          text: loadingC.loading.value ? 'Loading' : "Buat Treatment",
          fullWidth: false,
          onPressed: loadingC.loading.value
              ? null
              : () async {
                  loadingC.loading.value = true;
                  if (await treatmentC.generateTreatment()) {
                    await treatmentC.getDayli();
                  } else {
                    Get.showSnackbar(GetSnackBar(
                      message: "Kesalahan saat membuat treatment.",
                      duration: Duration(seconds: 2),
                    ));
                  }
                  loadingC.loading.value = false;
                }))
    ]));
  }
}
