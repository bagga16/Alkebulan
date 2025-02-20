import 'package:get/get.dart';
import '../Models/PostModel.dart';

class TrendingController extends GetxController {
  var trendingPosts = <PostModel>[].obs;
  var topNews = <PostModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadTrendingPosts();
    loadTopNews();
  }

  void loadTrendingPosts() {
    trendingPosts.assignAll([
      PostModel(
        category: "TRENDING",
        title: "Aid but no peace: humanitarian action in northern Uganda",
        imageUrl: "assets/images/post.png",
        username: "Kwame Assoku",
        profileImageUrl: "assets/images/user1.png",
        timeAgo: "4d ago",
        readTime: "17 min read",
      ),
      PostModel(
        category: "TRENDING",
        title: "Political crisis deepens in West Africa",
        imageUrl: "assets/images/post1.png",
        username: "John Doe",
        profileImageUrl: "assets/images/user2.png",
        timeAgo: "3d ago",
        readTime: "12 min read",
      ),
    ]);
  }

  void loadTopNews() {
    topNews.assignAll([
      PostModel(
        category: "TOP NEWS",
        title: "Aid but no peace: humanitarian action in northern Uganda",
        imageUrl: "assets/images/post.png",
        username: "Newsroom Africa",
        profileImageUrl: "assets/images/user4.png",
        timeAgo: "1d ago",
        readTime: "2:10",
      ),
      PostModel(
        category: "TOP NEWS",
        title: "New government reforms spark debate",
        imageUrl: "assets/images/post.png",
        username: "BBC",
        profileImageUrl: "assets/images/user3.png",
        timeAgo: "1d ago",
        readTime: "3:15",
      ),
    ]);
  }
}
