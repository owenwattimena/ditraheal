part of "../pages.dart";

class HobiSignupPage extends StatefulWidget {
  const HobiSignupPage({Key? key}) : super(key: key);

  @override
  _HobiSignupPageState createState() => _HobiSignupPageState();
}

class _HobiSignupPageState extends State<HobiSignupPage> {
  final SignupController signupC = Get.find<SignupController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: "Hobi",
      ),
      body: Stack(
        children: [
          Container(),
          SafeArea(
            child: ListView(
              children: [
                SizedBox(
                  height: 24,
                ),
                Obx(
                  () => Column(
                    children: signupC.listHobby.map(
                      (hobi) {
                        return SelectCardWidget(
                          margin: EdgeInsets.only(left: 24, right: 24, bottom: 12),
                          title: hobi.title,
                          isSelected: (signupC.hobi.value == hobi.id) ? true : false,
                          imagePath: hobi.imagePath,
                          onTap: (val) {
                            signupC.setHobi = hobi.id;
                          },
                        );
                      },
                    ).toList(),
                  ),
                ),
                Obx(
                  () => ButtonWidget(
                    margin: EdgeInsets.only(top: 24, left: 24, right: 24),
                    text: signupC.onLoading.value ? "Loading..." : "signup".tr,
                    onPressed: !signupC.onLoading.value
                        ? () => signupC.checkHobby()
                        : null,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
