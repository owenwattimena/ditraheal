part of "../widgets.dart";

class DashboardContent extends StatelessWidget {
  const DashboardContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Media Sosial",
          style: primaryTextStyle.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 12),
        SocialCard(
          color: Color(0xff9FCBF4),
          imagePath: "assets/images/facebook.png",
          text: "1-100 Followers di Facebook",
        ),
        // SizedBox(height: 9),
        // SocialCard(
        //   color: Color(0xffFFB5DD),
        //   imagePath: "assets/images/instagram.png",
        //   text: "1-100 Followers di Instagram",
        // ),
        // SizedBox(height: 9),
        // SocialCard(
        //   color: Color(0xffD6D6D6),
        //   imagePath: "assets/images/tiktok.png",
        //   text: "1-100 Followers di Tik-tok",
        // ),

        /// HOBI
        SizedBox(height: 12),
        Text(
          "Hobi",
          style: primaryTextStyle.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 12),
        SelectCardWidget(
          isSelected: true,
          title: "BACA",
          imagePath: "assets/images/baca_hobi_icon.png",
        ),
      ],
    );
  }
}
