part of "../widgets.dart";

class CardWidget extends StatelessWidget {
  final double width;
  final String title;
  final String? value;
  final Function()? onPressed;
  const CardWidget(
      {Key? key,
      this.width = 0,
      required this.title,
      this.onPressed,
      this.value})
      : super(key: key);

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
          Text(title, style: primaryTextStyle),
          SizedBox(
            height: 10,
          ),
          Text( value != null ? value!.toUpperCase() : '-',
              style: primaryTextStyle.copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: accentColor)),
          SizedBox(
            height: 30,
          ),
          // TextButton(
          //     onPressed: onPressed,
          //     child: Text("Ulangi Tes", style: primaryTextStyle),
          //     style: TextButton.styleFrom(
          //       padding: EdgeInsets.zero,
          //       // maximumSize: Size(75, 22),
          //     )),
        ],
      ),
    );
  }
}
