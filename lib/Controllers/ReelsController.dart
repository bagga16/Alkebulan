import 'package:alkebulan/Models/ReelsModel.dart';
import 'package:get/get.dart';

class ReelsController extends GetxController {
  var selectedTab = 0.obs; // 0 = "For You", 1 = "Live TV"

  // Sample Videos
  var videos = <ReelsModel>[
    ReelsModel(
      videoUrl: "assets/videos/1.mp4",
      username: "Bagga",
      description:
          "Lorem ipsum dolor sit amet, \nconsectetur adipiscing elit...",
      likes: 234,
      comments: 45,
      shares: 12,
    ),
    ReelsModel(
      videoUrl: "assets/videos/2.mp4",
      username: "john_doe",
      description: "Another video description goes here...",
      likes: 1120,
      comments: 34,
      shares: 9,
    ),
    ReelsModel(
      videoUrl: "assets/videos/3.mp4",
      username: "josef Manna",
      description: "Another video description goes here...",
      likes: 120,
      comments: 34,
      shares: 9,
    ),
  ].obs;
}
