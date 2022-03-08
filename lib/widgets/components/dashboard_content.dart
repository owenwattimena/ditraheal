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
        SizedBox(height: 12),
        Text(
          "Komunitas",
          style: primaryTextStyle.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 12),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Color(0xffF5F5F5),
            boxShadow: [
              BoxShadow(
                color: Color(0xffB0B0B0).withOpacity(1),
                spreadRadius: 0,
                blurRadius: 5,
                offset: Offset(0, 0), // changes position of shadow
              ),
            ],
          ),
          child:Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:[
            Container(
              margin: EdgeInsets.only(left: 10),
              child: Text("Komunitas FB Penyembuh Trauma",style: primaryTextStyle,)),
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
              color: Color(0xff7537D9),
                borderRadius: BorderRadius.circular(3),
              ),
              child:Transform.rotate(angle: -45,
              child: Icon(Icons.link,color: Colors.white,)),
            ),
          ]
        ),),
      ],
    );
  }
}
