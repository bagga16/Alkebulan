import 'package:get/get.dart';

class HomeController extends GetxController {
  var selectedTab = 0.obs;
  var selectedDay = 0.obs;

  List<String> weekdays = ["M", "T", "W", "T", "F", "S", "S"];

  void switchTab(int index) {
    selectedTab.value = index;
  }

  // Explore Posts (Sample Data)
  final List<Map<String, dynamic>> explorePosts = [
    {
      "category": "FOR YOU",
      "title": " ow Nigeria Became the Cradle of Africa's Oil Sector",
      "imageUrl": "assets/images/post.png",
      "timeAgo": "3d ago",
      "isFeatured": true,
    },
    {
      "category": "FOR YOU",
      "title": "Fix South Africa or Face Arab Spring-Like Revolt",
      "imageUrl": "assets/images/post.png",
      "timeAgo": "3d ago",
      "isForYou": true,
    },
    {
      "category": "ECONOMICS",
      "title": "Aid but no peace: humanitarian action in northern Uganda",
      "imageUrl": "assets/images/post1.png",
      "timeAgo": "4h",
      "isEconomics": true,
      "username": "Bagga",
      "profileImageUrl": "assets/images/user1.png",
    },
    {
      "category": "Insights",
      "title": "Aid but no peace: humanitarian action in northern Uganda",
      "imageUrl": "assets/images/post1.png",
      "timeAgo": "4h",
      "isEconomics": true,
      "username": "Bagga",
      "profileImageUrl": "assets/images/user1.png",
    },
    {
      "category": "ECONOMICS",
      "title": "Aid but no peace: humanitarian action in northern Uganda",
      "imageUrl": "assets/images/post1.png",
      "timeAgo": "4h",
      "isEconomics": true,
      "username": "Bagga",
      "profileImageUrl": "assets/images/user1.png",
    },
    {
      "category": "insights",
      "title": "Aid but no peace: humanitarian action in northern Uganda",
      "imageUrl": "assets/images/post1.png",
      "timeAgo": "4h",
      "isEconomics": false,
      "username": "Bagga",
      "profileImageUrl": "assets/images/user1.png",
    },
  ];

  // Insights Posts (Sample Data)
  final List<Map<String, dynamic>> insightsPosts = [
    {
      "category": "INSIGHTS",
      "title": "Fix South Africa or Face Arab Spring-Like Revolt",
      "imageUrl": "assets/images/post.png",
      "timeAgo": "4d ago",
      "username": "Kwame Assoku",
      "profileImageUrl": "assets/users/user1.png",
    },
    {
      "category": "INSIGHTS",
      "title": "Aid but no peace: humanitarian action in northern Uganda",
      "imageUrl": "assets/images/post1.png",
      "timeAgo": "2h",
      "username": "Ahmad",
      "profileImageUrl": "assets/users/user2.png",
    },
  ];
}
