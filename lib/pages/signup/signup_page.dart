part of '../pages.dart';

class SignupPage extends StatefulWidget {
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final AuthController authC = Get.put(AuthController());
  TextEditingController namaController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController noHpController = new TextEditingController();
  DateTime? tanggalLahir;

  String? _facebookValue;
  List _folowers = [
    "Tidak ada",
    "1 s/d 1K",
    "1K s/d 10K",
    "10K s/d 100K",
    "100K s/d 1Jt",
    "Lebih dari 1Jt"
  ];

  GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  void dispose() {
    namaController.dispose();
    emailController.dispose();
    noHpController.dispose();
    super.dispose();
  }

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
                    padding: EdgeInsets.fromLTRB(24, 32, 24, 0),
                    width: double.infinity,
                    height: 168.0,
                    color: primaryColor,
                    child: Column(
                      children: [
                        Text(
                          "Aplikasi Intervensi Kepatuhan Digital Trauma Healing",
                          style:
                              headlineTextStyle.copyWith(color: Colors.white),
                        ),
                        Text(
                            "\“Rasa sakit yang kamu rasakan hari ini akan menjadi kekuatan yang akan kamu rasakan besok.\”",
                            style:
                                primaryTextStyle.copyWith(color: Colors.white))
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(24, 43, 24, 36),
                    child: Text(
                      "Ayo obati trauma mu!",
                      style: headlineTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  InputWidget(
                    label: "Nama Lengkap",
                    hintText: "Nama Lengkap",
                    textController: authC.namaController.value,
                    onChanged: (_) => setState(() {}),
                    textCapitalization: TextCapitalization.sentences,
                    validator: (val) {
                      if (val.isEmpty) {
                        return 'Tidak boleh kosong';
                      }
                    },
                  ),
                  // InputWidget(
                  //   label: "Email",
                  //   hintText: "Email",
                  //   textController: authC.emailController.value,
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
                  InputWidget(
                    label: "No HP",
                    hintText: "No HP",
                    textController: authC.noHpController.value,
                    onChanged: (_) => setState(() {}),
                    keyboardType: TextInputType.phone,
                    validator: (val) {
                      String pattern = r"^(^08)(\d{3,4}){2}\d{3,4}$";
                      RegExp regex = RegExp(pattern);
                      if (val.isEmpty)
                        return 'Tidak boleh kosong';
                      else if (!regex.hasMatch(val)) return 'No HP tidak valid';
                    },
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(24, 0, 24, 4),
                    child: Text("Tanggal Lahir"),
                  ),
                  InputDatetimeWidget(
                    label: "Tanggal Lahir",
                    onDateSelected: (val) {
                      setState(() {
                        authC.setTanggalLahir = val;
                      });
                    },
                    validator: (datetime) {
                      if (datetime == null) {
                        return 'Tidak boleh kosong';
                      }
                    },
                  ),
                  SizedBox(height: 8),
                  InputWidget(
                    label: "Alamat",
                    hintText: "Alamat",
                    textController: authC.noHpController.value,
                    onChanged: (_) => setState(() {}),
                    keyboardType: TextInputType.streetAddress,
                    validator: (val) {
                      if (val.isEmpty) return 'Tidak boleh kosong';
                    },
                  ),
                  InputSelectWidget(
                    top: 0,
                    value: _facebookValue,
                    label: "Follower Facebook",
                    hint: "Jumlah Folllower Facebook",
                    options: _folowers,
                    onChanged: (val) => setState(() => _facebookValue = val),
                  ),
                  ButtonWidget(
                    margin: EdgeInsets.only(top: 24, left: 24, right: 24),
                    text: "Selanjutnya",
                    onPressed: () {
                      if (_key.currentState!.validate())
                        Get.to(HobiSignupPage());
                    },
                  ),
                  OutlineButtonWidget(
                    text: "Sudah Pernah Daftar?",
                    onPressed: toSigninPage,
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

  void gotoSosialSigninPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SosialSignupPage(),
      ),
    );
  }

  void toSigninPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SigninPage(),
      ),
    );
  }
}
