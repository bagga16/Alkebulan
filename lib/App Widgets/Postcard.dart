import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  final String category;
  final String title;
  final String imageUrl;
  final String timeAgo;
  final bool isFeatured;

  const PostCard({
    Key? key,
    required this.category,
    required this.title,
    required this.imageUrl,
    this.timeAgo = "",
    this.isFeatured = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      margin: EdgeInsets.only(bottom: screenHeight * 0.02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image for Featured Post
          if (isFeatured)
            Container(
              width: double.infinity,
              height: screenHeight * 0.24,
              padding: EdgeInsets.symmetric(
                  vertical: screenHeight * 0.01,
                  horizontal: screenWidth * 0.05),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imageUrl),
                  // NetworkImage(imageUrl),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: screenWidth * 0.045,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

          if (!isFeatured) ...[
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: screenHeight * 0.008,
                  horizontal: screenWidth * 0.05),
              child: Text(
                category.toUpperCase(),
                style: TextStyle(
                  fontSize: screenWidth * 0.035,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Thumbnail Image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      imageUrl,
                      width: screenWidth * 0.25,
                      height: screenHeight * 0.1,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.03),
                  // Post Info
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: screenWidth * 0.04,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.005),
                        Text(
                          timeAgo,
                          style: TextStyle(
                            fontSize: screenWidth * 0.03,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Bookmark and Play Icon
                  Column(
                    children: [
                      Icon(Icons.play_circle_outline, color: Colors.black),
                      SizedBox(height: screenHeight * 0.01),
                      Icon(Icons.bookmark_border, color: Colors.black),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
