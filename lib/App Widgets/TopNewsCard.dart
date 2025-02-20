import 'package:flutter/material.dart';
import '../Models/PostModel.dart';

class TopNewsCard extends StatelessWidget {
  final PostModel post;
  const TopNewsCard({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth * 0.6,
      margin: EdgeInsets.only(right: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image with play button
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  post.imageUrl,
                  width: screenWidth * 0.6,
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                right: 10,
                bottom: 10,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    post.readTime ?? "Just now",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8),

          // Title
          Text(
            post.title,
            style: TextStyle(
              fontSize: screenWidth * 0.04,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5),

          // News Source
          Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(
                    post.profileImageUrl ?? 'assets/images/user1.png'),
                radius: 12,
              ),
              SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(post.username ?? "bagga",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: screenWidth * 0.035,
                        color: Colors.grey.shade600,
                      )),
                  Text(post.timeAgo,
                      style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: screenWidth * 0.025)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
