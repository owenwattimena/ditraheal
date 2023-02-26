part of "../pages.dart";

class ProfilePage extends StatelessWidget {
  final profileC = Get.find<ProfileController>();
  final AuthC = Get.find<AuthController>();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: "Profile",
      ),
      body: Form(
        key: _key,
        child: ListView(
          children: [
            SizedBox(
              height: 24,
            ),
            InputWidget(
              label: "name_tag".tr,
              hintText: "name_tag".tr,
              textController: profileC.nameController.value,
              // onChanged: (_) {},
              textCapitalization: TextCapitalization.words,
              validator: (val) => Validate.notNull(val, label: "name_tag".tr),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(24, 0, 24, 4),
              child: Text("birth_date_tag".tr),
            ),
            InputDatetimeWidget(
              initialDate: profileC.birthDate.value,
              label: "birth_date_tag".tr,
              onDateSelected: (val) => profileC.birthDate.value = val,
              validator: (datetime) =>
                  Validate.dateValidate(datetime, label: "birth_date_tag".tr),
            ),
            SizedBox(height: 8),
            InputWidget(
              label: "Alamat",
              hintText: "Alamat",
              textController: profileC.addressController.value,
              keyboardType: TextInputType.streetAddress,
              validator: (val) {
                if (val.isEmpty) return 'Tidak boleh kosong';
              },
            ),
            // InputSelectWidget(
            //   top: 0,
            //   label: "fb_follower_tag".tr,
            //   hint: "input_fb_hint".tr,
            //   value: profileC.facebookValue.value,
            //   options: profileC.fbFollowers,
            //   validator: (val) => Validate.dropdown(val),
            //   onChanged: (val) => profileC.facabookFollowers(val ?? ""),
            // ),
            Obx(()=>ButtonWidget(
              margin: EdgeInsets.only(top: 24, left: 24, right: 24),
              text: profileC.onLoading.value ? "Loading..." : "Simpan",
              onPressed: profileC.onLoading.value ? null : () {
                if (_key.currentState!.validate()) profileC.updateUser();
              },
            )),
          ],
        ),
      ),
    );
  }
}
