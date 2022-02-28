part of "../widgets.dart";

class HeaderWithCard extends StatelessWidget {
  final String user;
  final double? cardWidth;
  final Function()? onAccountTap;
  const HeaderWithCard(
      {Key? key, required this.user, this.cardWidth = double.infinity, required this.onAccountTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 180,
      color: primaryColor,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 18, left: 24, right: 12),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: onAccountTap,
                    icon: Icon(
                      Icons.account_circle_outlined,
                      size: 32,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Text(
                "Selamat Datang!",
                style: primaryTextStyle.copyWith(color: Colors.white),
              ),
              Text(
                user,
                // "OWen",
                style: primaryTextStyle.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ]),
          ),
          Positioned(
            top: 124,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // CARD 1
                  CardWidget(width: cardWidth!),
                  CardWidget(width: cardWidth!),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
