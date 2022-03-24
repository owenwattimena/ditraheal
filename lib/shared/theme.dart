part of "shared.dart";

TextStyle primaryTextStyle = TextStyle(fontFamily: "Poppins", fontSize: 14);
TextStyle primaryTextBoldStyle = TextStyle(fontFamily: "Poppins", fontSize: 14, fontWeight: FontWeight.bold);
TextStyle headlineTextStyle = primaryTextStyle.copyWith(fontSize: 20, fontWeight: FontWeight.bold);
Color greyColor = Color(0xffF0F0F0);
Color darkGreyColor = Color(0xff868686);
Color primaryColor = Color(0xff378BD9);
Color activeColor = Color(0xffD4EBFF);
Color accentColor = Color(0xff311D69);
Color lightGreenColor = Color(0xff9EFFDA);
Color darkGreenColor = Color(0xff39B97B);

Future dialog({required String title, required String description, required String btnTitle, required Function() onPressed}) {
  return Get.defaultDialog(
    title: '$title',
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
        "$description",
        style: primaryTextStyle,
      ),
    ),
    actions: [
      ButtonWidget(
        margin: EdgeInsets.only(top: 10, bottom: 8),
        text: "$btnTitle",
        padding: EdgeInsets.symmetric(horizontal: 10),
        onPressed: () => onPressed(),
      )
    ],
    barrierDismissible: false,
  );
}