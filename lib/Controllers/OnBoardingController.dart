import 'package:get/get.dart';

class OnboardingController extends GetxController {
  List<String> topics = [
    "Africa",
    "Caribbean",
    "North America",
    "Europe",
    "Latin America",
    "Culture",
    "Business",
    "International News",
    "Politics",
    "Healthcare",
    "Social Issues",
    "Global Movements",
    "Investments",
    "Human Rights",
    "Education",
    "Opinion",
    "Economic Development",
  ];

  var selectedTopics = <String>[].obs;

  void toggleTopic(String topic) {
    if (selectedTopics.contains(topic)) {
      selectedTopics.remove(topic);
    } else {
      selectedTopics.add(topic);
    }
  }

  void goToOnboardingTwo() => Get.toNamed('/onboarding2');
  void goToOnboardingThree() => Get.toNamed('/onboarding3');
  void completeOnboarding() => Get.toNamed('/signup');
}
