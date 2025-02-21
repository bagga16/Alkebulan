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
  bool isFavorite;

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
      this.isFavorite = false,
      this.description});
}
