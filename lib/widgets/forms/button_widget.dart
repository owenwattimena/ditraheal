part of "../widgets.dart";

class ButtonWidget extends StatelessWidget {
  final String? text;
  final Color? color;
  final Function()? onPressed;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  ButtonWidget({this.text, this.color, this.onPressed, this.padding, this.margin});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.zero,
      padding: padding ?? EdgeInsets.zero,
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
