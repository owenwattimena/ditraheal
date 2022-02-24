part of "../../pages.dart";

class TraumaResult extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(24),
        color: primaryColor,
        child: Center(
          child: DialogWidget(
            title: "LEVEL TRAUMA",
            child: Text(
              "TINGGI",
              textAlign: TextAlign.center,
            ),
            primaryButtonText: "Lanjut Ke Tes Efikasi",
            primaryButtonOnPressed: () {},
            secondaryButtonText: "Ulangi Tes",
            secondaryButtonOnPressed: () {},
          ),
        ),
      ),
    );
  }
}
