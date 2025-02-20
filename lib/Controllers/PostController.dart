import 'package:alkebulan/Models/PostModel.dart';
import 'package:get/get.dart';

class PostController extends GetxController {
  var selectedPost = Rxn<PostModel>();

  void setPost(PostModel post) {
    selectedPost.value = post;
  }
}
