part of "../pages.dart";

class Pemulihan extends StatelessWidget {
  const Pemulihan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                        "Mr. Survivor, berikut ini adalah tugas yang harus anda selesaikan untuk mengobati trauma anda.",
                        style: primaryTextStyle.copyWith(color: Colors.white)))
              ],
            ),
          ),
          SizedBox(height: 12),
          Text(
            "Hobi",
            style: primaryTextBoldStyle,
            textAlign: TextAlign.left,
          ),
          SizedBox(height: 8),
          Column(children: [
            CardWithCheck(
              onChanged: (val) {
                _showDialog();
              },
            ),
          ])
        ],
      ),
    );
  }

  void _showDialog() {
    Get.defaultDialog(
      title: 'Selamat',
      titlePadding: EdgeInsets.all(18),
      titleStyle: primaryTextBoldStyle.copyWith(fontSize: 14),
      content: Container(
        decoration: BoxDecoration(
          color: greyColor,
          borderRadius: BorderRadius.circular(12),
        ),
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.symmetric(horizontal: 9, vertical: 16),
        child: Text(
          "Hi, Mr. Survivor, anda telah menyelesaikan semua tugas yang diberikan. Ayo ulangi tes trauma dan efikasimu untuk melihat dampak pengobatannya.",
          style: primaryTextStyle,
        ),
      ),
      actions: [
        ButtonWidget(
          margin: EdgeInsets.only(top: 10, bottom: 8),
          text: "Ulangi Tes",
          padding: EdgeInsets.symmetric(horizontal: 10),
          onPressed: () => Get.back(),
        )
      ],
      barrierDismissible: false,
    );
  }
}
