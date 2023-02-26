part of "../widgets.dart";

class CardWithCheck extends StatelessWidget {
  final Function(bool?) onChanged;
  final String text;
  final bool checked;
  const CardWithCheck({Key? key, required this.onChanged, required this.text, required this.checked}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6),
      margin: EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: checked ? primaryColor : Colors.transparent, width: checked ? 1 : 0),
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
          value: checked,
          shape: CircleBorder(),
          onChanged: (val) => onChanged(val),
        ),
        Flexible(child:Text(text, style: primaryTextStyle)),
      ]),
    );
  }
}
