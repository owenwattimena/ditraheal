part of "../widgets.dart";

class DashboardContent extends StatelessWidget {
  final dashC = Get.put(DashboardController());
  final authC = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    authC.userIdentities().then((user) {
      dashC.getLink(user.hobby ?? 0);
      // print("HOBY : ${user.hobby}");
    });

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
        Obx(() => SocialCard(
              color: Color(0xff9FCBF4),
              imagePath: "assets/images/facebook.png",
              text: "${authC.user.value.follower ?? "-"} Followers di Facebook",
            )),

        /// HOBI
        SizedBox(height: 12),
        Text(
          "Hobi",
          style: primaryTextStyle.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 12),
        dashC.hobby.value.title != null
            ? SelectCardWidget(
                isSelected: true,
                title: dashC.hobby.value.title!,
                imagePath: dashC.hobby.value.imagePath,
              )
            : SizedBox(),
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
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Obx(() => Expanded(
                child: GestureDetector(
                    onTap: () {
                      _launchUrl(dashC.linkGroup.value.link);
                    },
                    child: Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Text(
                            "${dashC.linkGroup.value.title}",
                            style: primaryTextStyle,
                            softWrap: true,
                            maxLines: 2,
                            overflow: TextOverflow.fade,
                          ),
                        )))),
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Color(0xff7537D9),
                borderRadius: BorderRadius.circular(3),
              ),
              child: Transform.rotate(
                  angle: -45,
                  child: Icon(
                    Icons.link,
                    color: Colors.white,
                  )),
            ),
          ]),
        ),
      ],
    );
  }

  Future<void> _launchUrl(String _url) async {
    // var url = 'fb://facewebmodal/f?href=https://www.facebook.com/groups/2169309036596884';
    var url = 'fb://facewebmodal/f?href=$_url';
    Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      if (!await launchUrl(uri)) {
        throw Exception('Could not launch $_url');
      }
    }
  }
}
