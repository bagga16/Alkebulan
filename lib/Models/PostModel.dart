// class PostModel {
//   final String category;
//   final String title;
//   final String imageUrl;
//   final String username;
//   final String profileImage;
//   final String timeAgo;
//   final String readTime;

//   PostModel({
//     required this.category,
//     required this.title,
//     required this.imageUrl,
//     required this.username,
//     required this.profileImage,
//     required this.timeAgo,
//     required this.readTime,
//   });
// }

class PostModel {
  final String category;
  final String title;
  final String imageUrl;
  final String timeAgo;
  final bool isFeatured;
  final bool isForYou;
  final bool isInsight;
  final bool isEconomics;
  final String? profileImageUrl;
  final String? username;
  final String? readTime;
  final String? description;

  PostModel(
      {required this.category,
      required this.title,
      required this.imageUrl,
      this.isFeatured = false,
      this.timeAgo = "",
      this.isForYou = false,
      this.isInsight = false,
      this.isEconomics = false,
      this.profileImageUrl,
      this.username,
      this.readTime,
      this.description});
}
