import 'package:get/get.dart';

class ContributorController extends GetxController {
  var name = "".obs;
  var profileImage = "".obs;
  var bio = "".obs;

  void setUserData(String userName, String userProfileImage, String userBio) {
    name.value = userName;
    profileImage.value = userProfileImage;
    bio.value = userBio;
  }

  var articles = [
    {
      "category": "TECH",
      "title": "Fix South Africa or Face Arab Spring-Like Revolt",
      "imageUrl": "assets/images/post.png",
      "timeAgo": "3d ago",
      "duration": "6 min",
    },
    {
      "category": "ECONOMICS",
      "title": "Fix South Africa or Face Arab Spring-Like Revolt",
      "imageUrl": "assets/images/post.png",
      "timeAgo": "3d ago",
      "duration": "6 min",
    },
    {
      "category": "FOR YOU",
      "title": "Fix South Africa or Face Arab Spring-Like Revolt",
      "imageUrl": "assets/images/post.png",
      "timeAgo": "3d ago",
      "duration": "6 min",
    },
  ];
}
