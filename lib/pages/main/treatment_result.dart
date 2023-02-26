import 'package:ditraheal/controllers/auth_controller.dart';
import 'package:ditraheal/models/models.dart';
import 'package:ditraheal/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
// import 'package:fl_chart/fl_chart.dart';

import '../../controllers/periode_controller.dart';
import '../../controllers/treatment_controller.dart';
import '../../shared/shared.dart';
import '../../widgets/components/bar.dart';

class TreatmentResult extends StatelessWidget {
  const TreatmentResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authC = Get.find<AuthController>();
    final treatmentC = Get.find<TreatmentController>();
    final periodeC = Get.find<PeriodeController>();
    return SingleChildScrollView(
      padding: EdgeInsets.all(padding),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('Hasil Pemulihan', style: headlineTextStyle),
        Text('Hai ${authC.user.value.name}, pemulihanmu telah selesai, ini adalah hasilnya.',
            style: primaryTextStyle),
        SizedBox(height: 22),
        Text('Efikasi', style: primaryTextBoldStyle),
        Text( (periodeC.skorTest.value.postTestEfikasi! > periodeC.skorTest.value.totalScoreEfikasi!) ? "Hasil efikasi anda meningkat dari sebelumnya." : ( (periodeC.skorTest.value.postTestEfikasi! == periodeC.skorTest.value.totalScoreEfikasi!) ? "Hasil efikasi anda sama seperti sebelumnya." : ( (periodeC.skorTest.value.postTestEfikasi! < periodeC.skorTest.value.totalScoreEfikasi!) ? "Efiaksi anda mengalami penurunan dari hasil sebelumnya" : "" ) )  ),
        SizedBox(height: 9),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CardWidget(
              width: ((MediaQuery.of(context).size.width - (padding * 2)) / 2 -
                  (padding / 2)),
              title: 'PRA EFIKASI',
              value: periodeC.skorTest.value.totalScoreEfikasi!.toString(),
            ),
            CardWidget(
              width: ((MediaQuery.of(context).size.width - (padding * 2)) / 2 -
                  (padding / 2)),
              title: 'POS EFIKASI',
              value: periodeC.skorTest.value.postTestEfikasi!.toString(),
            )
          ],
        ),
        SizedBox(height: 30),
        Text('Statistik', style: primaryTextBoldStyle),
        SizedBox(height: 14),
        Row(
          children: [
            Container(
                width: 30,
                height: 30,
                margin: EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  color: accentColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Icon(
                  Icons.signal_cellular_alt,
                  color: Colors.white,
                )),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'TINGGI',
                style: primaryTextBoldStyle.copyWith(color: redColor),
              ),
              Text('Level Trauma', style: primaryTextStyle),
            ])
          ],
        ),
        SizedBox(height: 10),
        Obx(() => Row(
              children:
                  const ['Chart', 'Kalender'].asMap().entries.map((e) {
                int idx = e.key;
                String val = e.value;
                return GestureDetector(
                  onTap: () => treatmentC.tabIndex.value =
                      treatmentC.tabIndex.value == 0 ? 1 : 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: padding / 2, vertical: padding / 4),
                    child: Column(
                      children: [
                        Text(val, style: primaryTextStyle),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 3),
                          height: 5,
                          width: 50,
                          decoration: BoxDecoration(
                              color: treatmentC.tabIndex.value == idx
                                  ? darkGreenColor
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(50)),
                        )
                      ],
                    ),
                  ),
                );
              }).toList(),
            )),
        Obx(() => treatmentC.tabIndex.value == 0
            ? treatmentC.listStatBar.value == null ? Center(child: Text('Loading...')) : Bar(data: treatmentC.listStatBar.value ?? [])
            : treatmentC.listStatBar.value == null ? Center(child: Text('Loading...')) : TableCalendar(
                firstDay: DateTime.parse(
                    treatmentC.periode.value.tanggalAwalTreatment!),
                lastDay: DateTime.parse(
                    treatmentC.periode.value.tanggalAkhirTreatment!),
                focusedDay: DateTime.parse(
                    treatmentC.periode.value.tanggalAwalTreatment!),
                headerStyle: HeaderStyle(
                    formatButtonVisible: false, titleCentered: true),
                calendarStyle: CalendarStyle(isTodayHighlighted: false),
                eventLoader: (day) {
                  List<StatBar> date = treatmentC.listStatBar.value!
                      .where((element) =>
                          DateUtils.dateOnly(
                              DateTime.parse(element.tanggalTreatment!)) ==
                          DateUtils.dateOnly(day))
                      .toList();
                  if (date.length > 0) {
                    return [date[0]];
                  }
                  return [];
                },
                calendarBuilders: CalendarBuilders(
                    markerBuilder: (BuildContext context, date, events) {
                  List<StatBar> _date = (events as List<StatBar>)
                      .where((element) =>
                          DateUtils.dateOnly(
                              DateTime.parse(element.tanggalTreatment!)) ==
                          DateUtils.dateOnly(date))
                      .toList();
                  if (_date.length > 0) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('${_date[0].totalChecked}/',
                            style: primaryTextStyle.copyWith(fontSize: 11, color: darkGreenColor)),
                        Text('${_date[0].totalTreatment}',
                            style: primaryTextStyle.copyWith(fontSize: 11, color: primaryColor ))
                      ],
                    );
                  }
                  return null;
                }),
              )),
      ]),
    );
  }
}
