part of "../pages.dart";

class Dashboard extends StatelessWidget {
  final authC = Get.find<AuthController>();
  final loadingC = Get.find<LoadingController>();
  final periodeC = Get.find<PeriodeController>();

  @override
  Widget build(BuildContext context) {


    double deviceWidth = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Obx(()=>HeaderWithCard(onAccountTap: () => Get.toNamed('account-page'), onPressedEfficacy: () => print('TOP'),user: "${authC.user.value.name}", cardWidth: (deviceWidth / 2) - 24 - 6)),
        SizedBox(height: 70),
        Obx(()=> periodeC.skorTest.value.levelTrauma == 'rendah' ?Container(
          decoration: BoxDecoration(
            color: lightGreenColor,
            border: Border.all(color: darkGreenColor, width: 1),
            borderRadius: BorderRadius.circular(5),
          ),
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 24),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Text(
            "low_level_trauma_alert".trParams({'user': "${authC.user.value.name}"}),
            style: primaryTextStyle.copyWith(color: darkGreenColor, fontSize: 12),
          ),
        ) : SizedBox()),
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
