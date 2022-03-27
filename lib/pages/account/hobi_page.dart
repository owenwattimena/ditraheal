part of "../pages.dart";

class HobiPage extends StatelessWidget {
  final profileC = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: "Hobi",
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 24,
          ),
          Obx(
            () => Column(
              children: profileC.listHobby.map((hobi) {
                return SelectCardWidget(
                  margin: EdgeInsets.only(left: 24, right: 24, bottom: 12),
                  title: hobi.title,
                  isSelected: (profileC.hobi.value == hobi.id) ? true : false,
                  imagePath: hobi.imagePath,
                  onTap: (val) {
                    profileC.setHobi = hobi.id;
                  },
                );
              }).toList(),
            ),
          ),
          Obx(() {
            return (profileC.listHobby.length <= 0)
                ? Center(child: Text("Loading...", style: primaryTextStyle))
                : ButtonWidget(
                    margin: EdgeInsets.only(top: 24, left: 24, right: 24),
                    text: profileC.onLoading.value ? "Loading..." : "Simpan",
                    onPressed: profileC.onLoading.value
                        ? null
                        : () {
                            profileC.updateUser();
                          },
                  );
          })
        ],
      ),
    );
  }
}
