import 'package:ditraheal/models/models.dart';
import 'package:ditraheal/provider/link_provider.dart';

import '../controllers/profile_controller.dart';
import 'package:get/get.dart';

import 'auth_controller.dart';

class DashboardController extends GetxController {
  final authC = Get.find<AuthController>();
  final profileC = Get.put(ProfileController());
  Rx<Hobby> hobby = Rx<Hobby>(Hobby());
  RxInt tabIndex = 0.obs;
  Rx<LinkGroup> linkGroup = Rx<LinkGroup>(LinkGroup("", ""));

  Future<void> getLink(int idHobi)async
  {
    final result = await LinkProvider.getLink(idHobi);
    if(result.success)
    {
      linkGroup.update((val) {
        linkGroup.value = LinkGroup.fromJson(result.data);
      });
    }
  }
}
