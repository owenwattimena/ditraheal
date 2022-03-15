part of '../pages.dart';

class PemulihanEmpty extends StatelessWidget {
  const PemulihanEmpty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Container(
          child: IntrinsicHeight(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "TRAUMA RENDAH",
                  style: primaryTextBoldStyle.copyWith(fontSize: 18),
                ),
                SizedBox(height: 12),
                Text(
                  "Anda tidak perlu mengikuti pemulihan trauma",
                  style: primaryTextStyle.copyWith(fontSize: 14),
                ),
                SizedBox(height: 12),
                ButtonWidget(
                  text: "Ulangi Tes",
                  onPressed: () => Get.back(),
                  fullWidth: false,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
