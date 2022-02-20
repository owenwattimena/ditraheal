part of "../pages.dart";

class HobiSigninPage extends StatefulWidget {
  const HobiSigninPage({ Key? key }) : super(key: key);

  @override
  _HobiSigninPageState createState() => _HobiSigninPageState();
}

class _HobiSigninPageState extends State<HobiSigninPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: "Hobi",
      ),
      body:Stack(
        children: [
          Container(),
          SafeArea(
            child: ListView(
              children: [],
            ),
          )
        ],
      ),
    );
  }
}