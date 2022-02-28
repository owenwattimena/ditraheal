part of "../widgets.dart";

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final double _prefferedHeight = 70;

  final String? title;
  final bool titleCenter;
  final String? iconPath;
  final Function()? onPressed;
  final Color? iconColor;
  final Color? color;
  final Color? titleColor;
  final bool shadow;
  final bool showBackButton;

  AppBarWidget({this.title, this.iconPath, this.onPressed, this.iconColor = Colors.black, this.color, this.shadow = true, this.titleCenter = false, this.showBackButton = true, this.titleColor});

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    return Container(
      height: _prefferedHeight + statusBarHeight,
      padding: EdgeInsets.only(left: 12, top: statusBarHeight),
      decoration: BoxDecoration(
        color: color ?? Colors.white,
        boxShadow: (shadow)
            ? [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  spreadRadius: 0,
                  blurRadius: 4,
                  offset: Offset(0, 1), // changes position of shadow
                ),
              ]
            : [],
      ),
      child: Row(
        mainAxisAlignment: (titleCenter) ? MainAxisAlignment.center : MainAxisAlignment.start,
        children: [
          (showBackButton)
              ? IconButton(
                  icon: Container(
                    width: 32,
                    height: 32,
                    child: Image.asset(
                      iconPath ?? "assets/icons/ArrowLeft.png",
                      color: iconColor,
                    ),
                  ),
                  onPressed: onPressed ??
                      () {
                        Navigator.pop(context);
                      },
                )
              : SizedBox(),
          SizedBox(width: 12),
          Text(
            title ?? "",
            style: primaryTextStyle.copyWith(fontWeight: FontWeight.bold, fontSize: 16, color: titleColor ?? Colors.black),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(_prefferedHeight);
}
