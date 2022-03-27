part of "../pages.dart";

class AccountPage extends StatefulWidget {
  const AccountPage({ Key? key }) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final authC = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: "Akun Saya",
        shadow: false,
        color: primaryColor,
        iconColor: Colors.white,
        titleColor: Colors.white,
      ),
      body:SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24),
              color: primaryColor,
              height: 100,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    child: Icon(Icons.account_circle, color: Colors.white, size: 60,),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                      Text(authC.user.value.phoneNumber!, style: primaryTextStyle.copyWith(color: Colors.white),),
                      Text(authC.user.value.name, style: primaryTextStyle.copyWith(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
                    ]
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text("Profile"),
              leading: Icon(Icons.account_circle_outlined),
              trailing: Icon(Icons.chevron_right),
              onTap: () => Get.to(ProfilePage()),
            ),
            // ListTile(
            //   title: Text("Sosial Media"),
            //   leading: Icon(Icons.alternate_email),
            //   trailing: Icon(Icons.chevron_right),
            //   onTap: (){
            //     // Get.to(ChangePasswordPage());
            //   },
            // ),
            ListTile(
              title: Text("Hobi"),
              leading: Icon(Icons.emoji_emotions_outlined),
              trailing: Icon(Icons.chevron_right),
              onTap: () => Get.to(HobiPage()),

            ),
            OutlineButtonWidget(
              text: "Logout",
              onPressed: (){
                Get.offAll(SignupPage());
              },
            ),
          ],
        ),
      ),
    );
  }
}