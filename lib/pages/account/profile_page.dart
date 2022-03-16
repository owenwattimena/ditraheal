part of "../pages.dart";

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final authC = Get.find<AuthController>();
  String? _facebookValue;
  List<String> _folowers = [
    "Tidak ada",
    "1 s/d 1K",
    "1K s/d 10K",
    "10K s/d 100K",
    "100K s/d 1Jt",
    "Lebih dari 1Jt"
  ];
  GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: "Profile",
      ),
      body: Form(
        key: _key,
        child: ListView(
          children: [
            SizedBox(
              height: 24,
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
              text: "Simpan",
              onPressed: () {
                if (_key.currentState!.validate()) Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }
}
