import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../Controllers/CommentController.dart';

class CommentBottomSheet extends StatelessWidget {
  final CommentController commentController = Get.put(CommentController());

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      height: screenHeight * 0.7,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Column(
        children: [
          SizedBox(height: 8),
          Container(
            width: 40,
            height: 5,
            decoration: BoxDecoration(
              color: Colors.grey.shade400,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          SizedBox(height: 16),

          // Comments List
          Expanded(
            child: Obx(() => ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                  itemCount: commentController.comments.length,
                  itemBuilder: (context, index) {
                    var comment = commentController.comments[index];
                    return Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Profile Image
                            CircleAvatar(
                              backgroundImage: AssetImage(comment.profileImage),
                              radius: 20,
                            ),
                            SizedBox(width: 10),

                            // Comment Data
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Username and Timestamp
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        comment.username,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: screenWidth * 0.04,
                                        ),
                                      ),
                                      Spacer(),
                                      Text(
                                        "2h",
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: screenWidth * 0.03,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      GestureDetector(
                                          child: SvgPicture.asset(
                                              'assets/icons/more.svg'))
                                    ],
                                  ),
                                  SizedBox(height: 5),

                                  // Comment Text
                                  Text(
                                    comment.comment,
                                    style: TextStyle(
                                        fontSize: screenWidth * 0.035),
                                  ),

                                  // Like & Reply Buttons
                                  Row(
                                    children: [
                                      // Like Button
                                      GestureDetector(
                                        onTap: () =>
                                            commentController.toggleLike(index),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.thumb_up_outlined,
                                              color: comment.isLiked
                                                  ? Colors.blue
                                                  : Colors.black,
                                              size: 18,
                                            ),
                                            SizedBox(width: 5),
                                            Text("${comment.likes}",
                                                style: TextStyle(
                                                    fontSize:
                                                        screenWidth * 0.035)),
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: 15),

                                      // Reply Button
                                      GestureDetector(
                                        onTap: () =>
                                            commentController.addReply(index),
                                        child: Row(
                                          children: [
                                            SvgPicture.asset(
                                              'assets/icons/sms.svg',
                                              width: screenWidth * 0.04,
                                              height: screenWidth * 0.04,
                                            ),
                                            // Icon(Icons.comment,
                                            //     color: Colors.black, size: 18),
                                            SizedBox(width: 5),
                                            Text("${comment.replies} replies",
                                                style: TextStyle(
                                                    fontSize:
                                                        screenWidth * 0.035)),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        // Divider
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Divider(color: Colors.grey.shade300),
                        ),
                      ],
                    );
                  },
                )),
          ),
        ],
      ),
    );
  }
}
