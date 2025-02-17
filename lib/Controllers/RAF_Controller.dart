import 'package:get/get.dart';

class ReferController extends GetxController {
  void referFriend() {
    // Handle referral logic
    Get.toNamed('/home');
    print("User is referring a friend.");
  }

  void maybeLater() {
    // Handle "Maybe Later" action
    Get.toNamed('/home');
    print("User skipped the referral.");
  }
}
