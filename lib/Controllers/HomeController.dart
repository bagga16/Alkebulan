import 'package:get/get.dart';

class HomeController extends GetxController {
  var selectedDay = 0.obs; // Default selected day (Sunday)
  var selectedTab = 0.obs;

  List<String> weekdays = ["M", "T", "W", "T", "F", "S", "S"];

  void changeTab(int index) {
    selectedTab.value = index;
  }
}
