part of "../widgets.dart";

class CardWithCheck extends StatelessWidget {
  final Function(bool?) onChanged;
  const CardWithCheck({Key? key, required this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      margin: EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        // border: Border.all(color: Colors.grey, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5,
            spreadRadius: 0,
            offset: Offset(0, 0),
          )
        ],
      ),
      child: Row(children: [
        Checkbox(
          value: true,
          onChanged: (val) => onChanged(val),
        ),
        Text("Gabung grup komunitas", style: primaryTextStyle),
      ]),
    );
  }
}
