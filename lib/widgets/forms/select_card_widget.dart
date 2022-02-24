part of "../widgets.dart";

class SelectCardWidget extends StatelessWidget {
  final String title;
  final String? imagePath;
  final Function(bool)? onTap;
  final bool isSelected;

  const SelectCardWidget({Key? key, required this.title, this.imagePath, this.onTap, this.isSelected = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 24,
        right: 24,
        bottom: 12,
      ),
      child: InkWell(
        onTap: () {
          if (isSelected) {
            onTap?.call(false);
          } else {
            onTap?.call(true);
          }
          print(isSelected);
        },
        child: Container(
          height: 75,
          padding: EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: (isSelected) ? activeColor : greyColor,
            border: (isSelected) ? Border.all(color: primaryColor) : null,
            borderRadius: BorderRadius.all(
              Radius.circular(13),
            ),
          ),
          child: Row(
            mainAxisAlignment: (imagePath == null) ? MainAxisAlignment.center : MainAxisAlignment.start,
            children: [
              (imagePath != null)
                  ? Container(
                      width: 60,
                      height: 60,
                      margin: EdgeInsets.only(right: 12),
                      child: Image.asset(
                        imagePath!,
                      ),
                    )
                  : SizedBox(),
              Text(
                title,
                style: primaryTextStyle.copyWith(
                  fontSize: 20,
                  color: (isSelected) ? primaryColor : darkGreyColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
