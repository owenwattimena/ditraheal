import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../../controllers/auth_controller.dart';
import '../../controllers/treatment_controller.dart';
import '../../shared/shared.dart';
import '../../widgets/widgets.dart';

class TreatmentView extends StatefulWidget {
  final BuildContext context;
  const TreatmentView(this.context,{Key? key}) : super(key: key);

  @override
  State<TreatmentView> createState() => _TreatmentViewState();
}

class _TreatmentViewState extends State<TreatmentView> {
  final authC = Get.find<AuthController>();
  final treatmentC = Get.find<TreatmentController>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 18, horizontal: 25),
              width: double.infinity,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Container(
                    width: 80,
                    margin: EdgeInsets.only(right: 12),
                    child: Image.asset(
                      "assets/images/clip_board.png",
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: Text(
                          "${authC.user.value.name}, berikut ini adalah tugas yang harus anda selesaikan untuk mengobati trauma anda.",
                          style:
                              primaryTextStyle.copyWith(color: Colors.white)))
                ],
              ),
            ),
            SizedBox(height: 12),
            Text(treatmentC.checked.value == treatmentC.listDayli.value.length
                ? "Anda telah menyelesaikan tugas hari ini. Silahkan lanjutkan besok."
                : "${treatmentC.checked.value}/${treatmentC.listDayli.value.length} tugas selesai. Ayo kerjakan"),
            SizedBox(height: 8),
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 8,
                  decoration: BoxDecoration(
                    color: lightGreyColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                Container(
                  width: (treatmentC.checked.value /
                          treatmentC.listDayli.value.length) *
                      (MediaQuery.of(context).size.width - 24),
                  height: 8,
                  decoration: BoxDecoration(
                    color: darkGreenColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(children: [
              Icon(
                Icons.hourglass_top,
                size: 16,
              ),
              Text("${treatmentC.dayDiff.value} hari tersisa.")
            ]),
            SizedBox(height: 12),
            Text(
              "Tugas",
              style: primaryTextBoldStyle,
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 12),
            Column(
                children: treatmentC.listDayli.value
                    .asMap()
                    .entries
                    .map((data) => CardWithCheck(
                        checked: data.value.checklist!,
                        text: data.value.deskripsi!,
                        onChanged: (val) async {
                          context.loaderOverlay
                              .show(widget: LoadingAnswerOverlay());
                          int idx = data.key;
                          bool result = await treatmentC.checlist(
                              val!, data.value.id!, data.value.checklist!);
                          if (result) {
                            /// Jika Check
                            treatmentC.listDayli.update((v) {
                              treatmentC.listDayli.value[idx].checklist = val;
                              treatmentC.listDayli.refresh();
                            });
                            if (val == true) {
                              treatmentC.checked.value += 1;
                            }

                            /// Jika Un check
                            else {
                              treatmentC.checked.value -= 1;
                            }
                          }
                            context.loaderOverlay.hide();
                        }))
                    .toList()),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Obx(() => ButtonWidget(
                      text: treatmentC.dayDiff.value! > 0
                          ? 'Selanjutnya'
                          : 'Selesai',
                      color: Colors.green,
                      fullWidth: false,
                      onPressed: () async {
                        context.loaderOverlay.show();

                        if (treatmentC.dayDiff.value! > 0) {
                          DateTime date =
                              DateTime.parse(treatmentC.treatmentDay.value!);
                          treatmentC.treatmentDay.value =
                              date.add(Duration(days: 1)).toString();
                          await treatmentC.getDayli(
                              tanggal: date.add(Duration(days: 1)).toString());
                        } else {
                          final validasi = await treatmentC.validasiBeforePostTest();
                          if (validasi.success) {
                            Get.toNamed('/landing-post-efikasi');
                          } else {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title:
                                        const Text('Treatment Belum Selesai'),
                                    content: Text(
                                        "${validasi.message}"),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text('mengerti'),
                                      ),
                                    ],
                                  );
                                });
                          }
                        }

                        context.loaderOverlay.hide();
                      },
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
