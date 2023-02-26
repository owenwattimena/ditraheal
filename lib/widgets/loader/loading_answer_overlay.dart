part of '../widgets.dart';

class LoadingAnswerOverlay extends StatelessWidget {
  const LoadingAnswerOverlay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 60,
        width: 200,
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
          Text("Menyimpan jawaban",
              style: TextStyle(
                  color: Colors.blue[400], fontWeight: FontWeight.w300))
        ]),
      ),
    );
  }
}
