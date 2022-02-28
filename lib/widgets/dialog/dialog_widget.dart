part of "../widgets.dart";

class DialogWidget extends StatelessWidget {
  final double? width;
  final String title;
  final Widget child;
  final String? primaryButtonText, secondaryButtonText;
  final void Function()? primaryButtonOnPressed, secondaryButtonOnPressed;
  const DialogWidget({
    Key? key,
    this.width,
    required this.title,
    required this.child,
    required this.primaryButtonText,
    required this.primaryButtonOnPressed,
    this.secondaryButtonText,
    this.secondaryButtonOnPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width ?? double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: IntrinsicHeight(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  title,
                  style: primaryTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: greyColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                margin: EdgeInsets.symmetric(horizontal: 10),
                padding: EdgeInsets.symmetric(horizontal: 9, vertical: 16),
                child: child,
              ),
              ButtonWidget(
                margin: EdgeInsets.only(top:10),
                text: primaryButtonText,
                padding: EdgeInsets.symmetric(horizontal: 10),
                onPressed: primaryButtonOnPressed,
              ),
              (secondaryButtonText != null)
                  ? OutlineButtonWidget(
                      text: secondaryButtonText,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      onPressed: secondaryButtonOnPressed,
                    )
                  : SizedBox(),
              SizedBox(
                height: 10,
              )
            ],
          ),
        ));
  }
}
