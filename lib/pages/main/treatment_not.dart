import 'package:flutter/material.dart';

import '../../shared/shared.dart';
import '../../widgets/widgets.dart';

class TreatmentNot extends StatelessWidget {
  const TreatmentNot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(
        'TRAUMA RENDAH',
        style: headlineTextStyle.copyWith(color: primaryColor),
      ),
      SizedBox(
        height: 12,
      ),
      Text(
        'Anda tidak perlu mengikuti\npemulihan trauma',
        style: primaryTextStyle.copyWith(color: darkGreyColor),
        textAlign: TextAlign.center,
      ),
      SizedBox(
        height: 36,
      ),
      ButtonWidget(
        text: "Ulangi Tes",
        fullWidth: false,
      )
    ]));
  }
}
