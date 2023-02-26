part of '../widgets.dart';

class LoadingOverlay extends StatelessWidget {
  const LoadingOverlay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        SpinKitFadingCircle(
          color: Colors.blue[400],
          size: 35.0,
        ),
        SizedBox(width: 20),
        Text("Mengambil Soal...",
            style: TextStyle(
                color: Colors.blue[400], fontWeight: FontWeight.w300))
      ]),
    );
  }
}
