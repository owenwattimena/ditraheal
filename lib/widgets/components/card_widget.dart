part of "../widgets.dart";

class CardWidget extends StatelessWidget {
  final double width;
  const CardWidget({Key? key, this.width = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 12),
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            spreadRadius: 0,
            blurRadius: 4,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Text("TEST LEVEL TRAUMA", style: primaryTextStyle),
          Text("44",
              style: primaryTextStyle.copyWith(
                  fontSize: 24, fontWeight: FontWeight.bold, color: accentColor)),
          TextButton(
              onPressed: () {},
              child: Text("Ulangi Tes", style: primaryTextStyle),
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                // maximumSize: Size(75, 22),
              )),
        ],
      ),
    );
  }
}
