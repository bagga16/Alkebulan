class CommentModel {
  final String username;
  final String profileImage;
  final String comment;
  int likes;
  int replies;
  bool isLiked;

  CommentModel({
    required this.username,
    required this.profileImage,
    required this.comment,
    required this.likes,
    required this.replies,
    this.isLiked = false,
  });
}
