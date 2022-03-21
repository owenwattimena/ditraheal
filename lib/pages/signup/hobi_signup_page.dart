part of "../pages.dart";

class HobiSignupPage extends StatefulWidget {
  const HobiSignupPage({Key? key}) : super(key: key);

  @override
  _HobiSignupPageState createState() => _HobiSignupPageState();
}

class _HobiSignupPageState extends State<HobiSignupPage> {
  final AuthController authC = Get.find<AuthController>();
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
                    children: authC.listHobby.map(
                      (hobi) {
                        return SelectCardWidget(
                          margin:
                              EdgeInsets.only(left: 24, right: 24, bottom: 12),
                          title: hobi.title,
                          isSelected:
                              (authC.hobi.value == hobi.id) ? true : false,
                          imagePath: hobi.imagePath,
                          onTap: (val) {
                            authC.setHobi = hobi.id;
                          },
                        );
                      },
                    ).toList(),
                  ),
                ),
                ButtonWidget(
                  margin: EdgeInsets.only(top: 24, left: 24, right: 24),
                  text: "Daftar",
                  onPressed: () {
                    String? message = Validate.select(authC.hobi.value);
                    if (message != null) {
                      Get.showSnackbar(GetSnackBar(
                        message: message,
                        duration: Duration(seconds: 2),
                      ));
                    } else {
                      Get.to(LandingTraumaQuiz());
                    }
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
