part of "../widgets.dart";

class SocialCard extends StatelessWidget {
  final String text;
  final String? imagePath;
  final Color? color;
  const SocialCard({ Key? key, required this.text, this.imagePath, this.color }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 9),
      decoration: BoxDecoration(
      color: color ?? Colors.transparent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          (imagePath != null) ? Container(
            width: 50,
            height: 50,
            margin: EdgeInsets.only(right: 12),
            child: Image.asset(
              imagePath!,
            ),
          ) : SizedBox(),
          Text(text, style: primaryTextStyle,),
        ],
      ),
    );
  }
}