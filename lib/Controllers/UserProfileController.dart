import 'package:alkebulan/Models/BookMarkModel.dart';
import 'package:alkebulan/Models/LikeModel.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  var selectedTab = 1.obs; // Default: "Bookmarks" tab
  var uploads = <Like>[].obs;
  var bookmarks = <Bookmark>[
    Bookmark(
      title: "Fix South Africa or Face Arab Spring-Like Revolt",
      timeAgo: "3d ago",
      duration: "6 min listen",
      imageUrl: "assets/images/post1.png",
    ),
    Bookmark(
      title: "How Nigeria Became the Cradle of Africa's Oil Sector",
      timeAgo: "3d ago",
      duration: "6 min listen",
      imageUrl: "assets/images/post.png",
    ),
  ].obs;

  var likes = <Like>[
    Like(
      videoUrl: "assets/videos/1.mp4",
      username: "Bagga",
      description: "Lorem ipsum dolor sit amet...",
      likes: 234,
      comments: 45,
      shares: 12,
    ),
    Like(
      videoUrl: "assets/videos/3.mp4",
      username: "john_doe",
      description: "Another video description goes here...",
      likes: 1120,
      comments: 34,
      shares: 9,
    ),
    Like(
      videoUrl: "assets/videos/4.mp4",
      username: "john_doe",
      description: "Another video description goes here...",
      likes: 1120,
      comments: 34,
      shares: 9,
    ),
  ].obs;

  void changeTab(int index) {
    selectedTab.value = index;
  }
}
