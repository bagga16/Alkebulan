import 'package:get/get.dart';

class ReferController extends GetxController {
  void referFriend() {
    // Handle referral logic
    Get.toNamed('/bnb');
    print("User is referring a friend.");
  }

  void maybeLater() {
    // Handle "Maybe Later" action
    Get.toNamed('/bnb');
    print("User skipped the referral.");
  }
}
