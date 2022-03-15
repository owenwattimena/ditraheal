part of "../pages.dart";

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authC = Get.find<AuthController>();
    double deviceWidth = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeaderWithCard(
            onAccountTap: () => Get.to(AccountPage()),
            user: authC.namaController.value.text,
            cardWidth: (deviceWidth / 2) - 24 - 6),
        SizedBox(height: 70),
        Container(
          decoration: BoxDecoration(
            color: lightGreenColor,
            border: Border.all(color: darkGreenColor, width: 1),
            borderRadius: BorderRadius.circular(5),
          ),
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 24),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Text(
            "Mr. Survivor anda berada pada level trauma rendah. Anda tidak perlu mengikuti pemulihan trauma. ",
            style:
                primaryTextStyle.copyWith(color: darkGreenColor, fontSize: 12),
          ),
        ),
        SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: DashboardContent(),
        ),
        SizedBox(height: 24),
      ],
    );
  }
}
