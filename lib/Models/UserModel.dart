class User {
  final String name;
  final List<String> uploads;
  final List<String> bookmarks;
  final List<String> likes;

  User({
    required this.name,
    required this.uploads,
    required this.bookmarks,
    required this.likes,
  });
}
