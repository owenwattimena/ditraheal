part of "../widgets.dart";

class OutlineButtonWidget extends StatelessWidget {
  final String? text;
  final Color? color;
  final Function()? onPressed;
  OutlineButtonWidget({this.text, this.color, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 12),
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: ConstrainedBox(
        constraints: BoxConstraints.tightFor(width: double.infinity, height: 50),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            elevation: 0,
            primary: Colors.white,
            side: BorderSide(
              width: 1.0,
              color: color ?? primaryColor,
            ),
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(50.0),
            ),
          ),
          child: Text(
            '$text',
            style: primaryTextStyle.copyWith(color: color ?? primaryColor, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
