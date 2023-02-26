part of 'pages.dart';

class ErrorPage extends StatefulWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  State<ErrorPage> createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 119.06,
            height: 140.75,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/icons/error_icon.png'))),
          ),
          SizedBox(height: 30),
          Text(
            "Ups... Terjadi kesalahan",
            style: primaryTextStyle.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: primaryColor,
            ),
          ),
          Text("Tidak dapat memproses permintaan."),
          SizedBox(height: 30),
          ButtonWidget(text: "Coba lagi")
        ],
      )),
    );
  }
}
