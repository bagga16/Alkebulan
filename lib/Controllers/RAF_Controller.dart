import 'package:get/get.dart';

class ReferController extends GetxController {
  void referFriend() {
    Get.toNamed('/bnb');
    print("User is referring a friend.");
  }

  void maybeLater() {
    Get.toNamed('/bnb');
    print("User skipped the referral.");
  }
}
