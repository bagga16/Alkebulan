// import 'package:alkebulan/Controllers/CommentController.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class PostCommentsScreen extends StatelessWidget {
//   final CommentController controller = Get.put(CommentController());

//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;
//     double screenHeight = MediaQuery.of(context).size.height;

//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Padding(
//         padding: EdgeInsets.only(
//             right: screenWidth * 0.05,
//             left: screenWidth * 0.05,
//             top: screenHeight * 0.07),
//         child: Column(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 GestureDetector(
//                   onTap: () {
//                     Get.back();
//                   },
//                   child: Icon(
//                     Icons.arrow_back,
//                     color: Colors.black,
//                     size: 20,
//                   ),
//                 ),
//                 SizedBox(
//                   width: screenWidth * 0.05,
//                 ),
//                 Text(
//                   "Comments",
//                   style: TextStyle(
//                     fontSize: screenWidth * 0.05,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                   ),
//                 ),
//                 Text("                  ")
//               ],
//             ),
//             Expanded(
//               child: Obx(
//                 () => ListView.separated(
//                   padding: EdgeInsets.all(screenWidth * 0.04),
//                   itemCount: controller.comments.length,
//                   separatorBuilder: (context, index) => Divider(),
//                   itemBuilder: (context, index) {
//                     var comment = controller.comments[index];
//                     return _buildCommentTile(
//                         comment, screenWidth, screenHeight);
//                   },
//                 ),
//               ),
//             ),
//             _buildCommentInput(),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildCommentTile(comment, screenWidth, screenHeight) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         CircleAvatar(
//           backgroundImage: AssetImage(comment.profileImage),
//           radius: screenWidth * 0.06,
//         ),
//         SizedBox(width: screenWidth * 0.03),
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 children: [
//                   Text(
//                     comment.username,
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   Spacer(),
//                   Text(
//                     comment.timeAgo,
//                     style: TextStyle(color: Colors.grey, fontSize: 12),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 5),
//               Text(comment.commentText),
//               SizedBox(height: 8),
//               Row(
//                 children: [
//                   GestureDetector(
//                     onTap: () {},
//                     child: Row(
//                       children: [
//                         Icon(Icons.thumb_up, size: 16),
//                         SizedBox(width: 4),
//                         Text("${comment.likes}"),
//                       ],
//                     ),
//                   ),
//                   SizedBox(width: 20),
//                   GestureDetector(
//                     onTap: () {},
//                     child: Row(
//                       children: [
//                         Icon(Icons.comment, size: 16),
//                         SizedBox(width: 4),
//                         Text("${comment.replies} replies"),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//         Icon(Icons.more_vert),
//       ],
//     );
//   }

//   Widget _buildCommentInput() {
//     TextEditingController commentController = TextEditingController();
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//       child: Row(
//         children: [
//           Expanded(
//             child: TextField(
//               controller: commentController,
//               decoration: InputDecoration(
//                 hintText: "Add a comment...",
//                 border: InputBorder.none,
//               ),
//             ),
//           ),
//           IconButton(
//             icon: Icon(Icons.send, color: Colors.blue),
//             onPressed: () {
//               if (commentController.text.trim().isNotEmpty) {
//                 controller.addComment(commentController.text.trim());
//                 commentController.clear();
//               }
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:alkebulan/Controllers/CommentController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class PostCommentsScreen extends StatelessWidget {
  final int reelId; // Accept reelId for specific comments
  final CommentController controller = Get.put(CommentController());

  PostCommentsScreen({required this.reelId}) {
    controller.loadComments(reelId); // 🔥 Load comments when screen opens
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Header
          Padding(
            padding: EdgeInsets.only(
                right: screenWidth * 0.05,
                left: screenWidth * 0.05,
                top: screenHeight * 0.07),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Get.back(),
                  child: Icon(Icons.arrow_back, color: Colors.black, size: 20),
                ),
                Text(
                  "Comments",
                  style: TextStyle(
                    fontSize: screenWidth * 0.05,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(width: screenWidth * 0.1), // Space filler
              ],
            ),
          ),
          SizedBox(height: 10),

          // Comments List
          Expanded(
            child: Obx(() {
              if (controller.comments.isEmpty) {
                return Center(child: Text("No comments yet."));
              }
              return ListView.separated(
                padding: EdgeInsets.all(screenWidth * 0.04),
                itemCount: controller.comments.length,
                separatorBuilder: (context, index) => Divider(),
                itemBuilder: (context, index) {
                  var comment = controller.comments[index];
                  return _buildCommentTile(
                      comment, screenWidth, screenHeight, index);
                },
              );
            }),
          ),

          // Comment Input Field
          _buildCommentInput(),
        ],
      ),
    );
  }

  Widget _buildCommentTile(comment, screenWidth, screenHeight, int index) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(comment.profileImage),
          radius: screenWidth * 0.06,
        ),
        SizedBox(width: screenWidth * 0.03),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    comment.username,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Text(comment.timeAgo,
                      style: TextStyle(color: Colors.grey, fontSize: 12)),
                ],
              ),
              SizedBox(height: 5),
              Text(comment.comment),
              SizedBox(height: 8),
              Row(
                children: [
                  GestureDetector(
                    onTap: () => controller.toggleLike(index),
                    child: Row(
                      children: [
                        Icon(
                          comment.isLiked
                              ? Icons.thumb_up
                              : Icons.thumb_up_outlined,
                          size: 16,
                          color: comment.isLiked ? Colors.blue : Colors.black,
                        ),
                        SizedBox(width: 4),
                        Text("${comment.likes}"),
                      ],
                    ),
                  ),
                  SizedBox(width: 20),
                  GestureDetector(
                    onTap: () => controller.addReply(index),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/sms.svg',
                          height: screenWidth * 0.04,
                        ),
                        SizedBox(width: 4),
                        Text("${comment.replies} replies"),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Icon(Icons.more_vert),
      ],
    );
  }

  Widget _buildCommentInput() {
    TextEditingController commentController = TextEditingController();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: commentController,
              decoration: InputDecoration(
                hintText: "Add a comment...",
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send, color: Colors.blue),
            onPressed: () {
              if (commentController.text.trim().isNotEmpty) {
                controller.addComment(commentController.text.trim());
                commentController.clear();
              }
            },
          ),
        ],
      ),
    );
  }
}
