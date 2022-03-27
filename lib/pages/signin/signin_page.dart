part of "../pages.dart";

class SigninPage extends StatefulWidget {
  const SigninPage({Key? key}) : super(key: key);

  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final SignupC = Get.find<SignupController>();
  GlobalKey<FormState> _key = GlobalKey<FormState>();
  TextEditingController _noHpController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        shadow: false,
      ),
      body: Stack(
        children: [
          Container(color: Colors.white),
          SafeArea(
            child: Form(
              key: _key,
              child: ListView(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 31),
                    child: Text(
                      "Masuk Dengan Nomor HP",
                      style: primaryTextStyle.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  InputWidget(
                    textController: _noHpController,
                    keyboardType: TextInputType.phone,
                    hintText: "Nomor HP",
                    onChanged: (_) => setState(() {}),
                    validator: (val) {
                      String pattern = r"^(^08)(\d{3,4}){2}\d{3,4}$";
                      RegExp regex = RegExp(pattern);
                      if (val.isEmpty)
                        return 'Tidak boleh kosong';
                      else if (!regex.hasMatch(val)) return 'No HP tidak valid';
                    },
                  ),
                  InputDatetimeWidget(
                    label: "Tanggal Lahir",
                    onDateSelected: (val) {
                      setState(() {
                        SignupC.setTanggalLahir = val;
                      });
                    },
                    validator: (datetime) {
                      if (datetime == null) {
                        return 'Tidak boleh kosong';
                      }
                    },
                  ),
                  ButtonWidget(
                    text: "Masuk",
                    margin: EdgeInsets.only(top: 12, left: 24, right: 24),
                    onPressed: () {
                      if (_key.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LandingTraumaQuiz(),
                          ),
                        );
                      }
                    },
                  ),
                  OutlineButtonWidget(
                    text: "Belum pernah daftar?",
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
