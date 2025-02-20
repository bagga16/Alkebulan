import 'package:get/get.dart';
import '../Models/CommentModel.dart';

class CommentController extends GetxController {
  var comments = <CommentModel>[].obs;

  // Load comments for a specific reel
  void loadComments(int reelId) {
    comments.assignAll([
      CommentModel(
        username: "Lebomaroni",
        profileImage: "assets/images/user1.png",
        comment:
            "South Africa is sitting on a ticking time bomb. If they don’t fix this soon, we might see protests.",
        likes: 114,
        replies: 31,
      ),
      CommentModel(
        username: "ZolaniSpeaks",
        profileImage: "assets/images/user2.png",
        comment:
            "The Arab Spring wasn’t just about bad leadership, it was about hopelessness.",
        likes: 192,
        replies: 48,
      ),
      CommentModel(
        username: "Mzansi4All",
        profileImage: "assets/images/user3.png",
        comment:
            "We don’t need a revolution. We need leaders who care about fixing corruption and unemployment.",
        likes: 132,
        replies: 14,
      ),
      CommentModel(
        username: "FreedomFighter92",
        profileImage: "assets/images/user4.png",
        comment:
            "A revolution is not a matter of 'if' but 'when'. Fix the issues now or prepare for consequences.",
        likes: 81,
        replies: 30,
      ),
    ]);
  }

  // Toggle like on a comment
  void toggleLike(int index) {
    comments[index].isLiked = !comments[index].isLiked;
    comments[index].isLiked ? comments[index].likes++ : comments[index].likes--;
    comments.refresh();
  }

  // Add a reply (in future updates)
  void addReply(int index) {
    comments[index].replies++;
    comments.refresh();
  }
}
