import 'package:flutter/material.dart';
import '../Models/PostModel.dart';

class TrendingPostCard extends StatelessWidget {
  final PostModel post;
  const TrendingPostCard({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: screenWidth * 0.04, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Category
          Text(
            post.category,
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
              fontSize: screenWidth * 0.035,
            ),
          ),
          SizedBox(height: 5),

          // Image
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.asset(
              post.imageUrl,
              width: double.infinity,
              height: screenHeight * 0.24,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 10),

          // Title
          Text(
            post.title,
            style: TextStyle(
              fontSize: screenWidth * 0.039,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5),

          // Author & Time
          Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(
                    post.profileImageUrl ?? 'assets/images/user1.png'),
                radius: 14,
              ),
              SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post.username ?? "Bagga",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: screenWidth * 0.033),
                  ),
                  Text(
                    "${post.timeAgo} ${post.readTime}",
                    style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: screenWidth * 0.025),
                  ),
                ],
              ),
              Spacer(),
              Icon(Icons.bookmark_border),
            ],
          ),
        ],
      ),
    );
  }
}
