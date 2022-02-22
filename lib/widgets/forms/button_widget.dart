part of "../widgets.dart";

class ButtonWidget extends StatelessWidget {
  final String? text;
  final Color? color;
  final Function()? onPressed;
  final EdgeInsetsGeometry? padding;

  ButtonWidget({this.text, this.color, this.onPressed, this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16),
      padding: padding ?? EdgeInsets.symmetric(horizontal: 24),
      child: ConstrainedBox(
        constraints: BoxConstraints.tightFor(width: double.infinity, height: 50),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            primary: color ?? primaryColor,
            elevation: 0,
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(50.0),
            ),
          ),
          child: Text('$text', style:primaryTextStyle.copyWith(fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
