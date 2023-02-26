part of '../pages.dart';

class SignupPage extends StatelessWidget {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final SignupController signupC = Get.put(SignupController());
  // final FbFollowerController fbFollC = Get.put(FbFollowerController());

  List<String> options = ["0","100", "1000"];  

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: primaryColor,
            height: statusBarHeight,
          ),
          SafeArea(
            child: Form(
              key: _key,
              child: ListView(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(24, 32, 24, 32),
                    width: double.infinity,
                    // height: 168.0,
                    color: primaryColor,
                    child: Column(
                      children: [
                        Text(
                          "sign_up_title".tr,
                          style:
                              headlineTextStyle.copyWith(color: Colors.white),
                        ),
                        Text("sign_up_quote".tr,
                            style:
                                primaryTextStyle.copyWith(color: Colors.white))
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(24, 43/2, 24, 36),
                    child: Text(
                      "sign_up_heading".tr,
                      style: headlineTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  InputWidget(
                    label: "name_tag".tr,
                    hintText: "name_tag".tr,
                    textController: signupC.namaController.value,
                    // onChanged: (_) {},
                    textCapitalization: TextCapitalization.words,
                    validator: (val) =>
                        Validate.notNull(val, label: "name_tag".tr),
                  ),
                  InputWidget(
                    label: "phone_number_tag".tr,
                    hintText: "phone_number_tag".tr,
                    textController:
                        signupC.noHpController.value, // onChanged: (_) {},
                    keyboardType: TextInputType.phone,
                    validator: (val) => Validate.phoneNotNull(val,
                        label: "phone_number_tag".tr),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(24, 0, 24, 4),
                    child: Text("birth_date_tag".tr),
                  ),
                  InputDatetimeWidget(
                    initialDate: signupC.tanggalLahir.value,
                    label: "birth_date_tag".tr,
                    onDateSelected: (val) {
                      signupC.setTanggalLahir = val;
                    },
                    validator: (datetime) => Validate.dateValidate(datetime,
                        label: "birth_date_tag".tr),
                  ),
                  SizedBox(height: 8),
                  InputWidget(
                    label: "address_tag".tr,
                    hintText: "address_tag".tr,
                    textController:
                        signupC.alamatController.value, // onChanged: (_) {},
                    keyboardType: TextInputType.streetAddress,
                    textCapitalization: TextCapitalization.sentences,
                    validator: (val) =>
                        Validate.notNull(val, label: "address_tag".tr),
                  ),
                  InputSelectWidget(
                    top: 0,
                    label: "fb_follower_tag".tr,
                    hint: "input_fb_hint".tr,
                    value: "0",
                    options: options,
                    validator: (val) => Validate.dropdown(val),
                    onChanged: (val) => signupC.facabookFollowers(val ?? ""),
                  ),
                  ButtonWidget(
                    margin: EdgeInsets.only(top: 24, left: 24, right: 24),
                    text: "next".tr,
                    onPressed: () {
                      // signupC.getToken();
                      if (_key.currentState!.validate())
                        signupC.goToHobySignupPage();
                      // Get.to(HobiSignupPage());
                    },
                  ),
                  OutlineButtonWidget(
                    text: "already_registered".tr,
                    onPressed: () => Get.toNamed('signin'),
                  ),
                  SizedBox(height: 24)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
// InputWidget(
//   label: "Email",
//   hintText: "Email",
//   textController: SignupC.emailController.value,
//   onChanged: (_) => setState(() {}),
//   keyboardType: TextInputType.emailAddress,
//   validator: (val) {
//     String pattern = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
//     RegExp regex = RegExp(pattern);
//     if (val.isEmpty)
//       return 'Tidak boleh kosong';
//     else if (!regex.hasMatch(val)) return 'Email tidak valid';
//   },
// ),