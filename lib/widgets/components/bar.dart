import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/models.dart';
import '../../shared/shared.dart';

class Bar extends StatelessWidget {
  final List<StatBar> data;
  const Bar({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int longDayTreatment = 0;

    data.forEach((e) {
      if (e.totalTreatment! > longDayTreatment) {
        longDayTreatment = e.totalTreatment!;
      }
    });

    return Container(
      // height: 250,
      width: double.infinity,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: data.map((e) {
            String tanggal =
                DateFormat('d').format(DateTime.parse(e.tanggalTreatment!));
            String bulan =
                DateFormat('M').format(DateTime.parse(e.tanggalTreatment!));
      
            return MyTooltip(
              message:
                  'Tanggal: ${DateUtils.dateOnly(DateTime.parse(e.tanggalTreatment!))}\n${e.totalChecked} dari ${e.totalTreatment} soal dikerjakan',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 4, right: 6),
                    height: e.totalTreatment! / longDayTreatment * 200,
                    width: 7,
                    decoration: BoxDecoration(
                      color: blueLightColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Stack(
                      alignment: AlignmentDirectional.bottomEnd,
                      children: [
                        Container(
                          height: e.totalChecked! / longDayTreatment * 200,
                          width: 7,
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Text('$tanggal',
                  //     style: primaryTextStyle.copyWith(fontSize: 8)),
                  RotationTransition(
                    turns: new AlwaysStoppedAnimation(-60 / 360),
                    child: Text(
                        '$tanggal ' +
                            DateFormat('MMM')
                                .format(DateTime(0, int.parse(bulan))),
                        style: primaryTextStyle.copyWith(fontSize: 8)),
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class MyTooltip extends StatelessWidget {
  final Widget child;
  final String message;

  MyTooltip({required this.message, required this.child});

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<State<Tooltip>>();
    return Tooltip(
      key: key,
      message: message,
      preferBelow: true,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => _onTap(key),
        child: child,
      ),
    );
  }

  void _onTap(GlobalKey key) {
    final dynamic tooltip = key.currentState;
    print(tooltip);
    tooltip?.ensureTooltipVisible();
  }
}
