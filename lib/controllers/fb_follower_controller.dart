import 'package:ditraheal/models/models.dart';
import 'package:ditraheal/provider/fb_follower_provider.dart';
import "package:get/get.dart";

class FbFollowerController extends GetxController
{
  Rx<List<FbFollower>> fbFollowerList = Rx<List<FbFollower>>([]);

  @override
  void onInit() async {
    await follower();
    super.onInit();
  }

  Future<void> follower() async
  {
    final result = await FbFollowerProvider.fetchFollower();
    if(result.success)
    {
      List<FbFollower> data = result.data;
      fbFollowerList.update((val) {
        fbFollowerList.value = data;
      });
    }
  }
}