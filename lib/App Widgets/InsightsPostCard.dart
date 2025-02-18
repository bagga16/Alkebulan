import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InsightPost extends StatefulWidget {
  final String title;
  final String imageUrl;
  final String author;
  final String timeAgo;
  final String profileImageUrl;

  const InsightPost({
    Key? key,
    required this.title,
    required this.imageUrl,
    required this.author,
    required this.timeAgo,
    required this.profileImageUrl,
  }) : super(key: key);

  @override
  _InsightPostState createState() => _InsightPostState();
}

class _InsightPostState extends State<InsightPost> {
  bool isBookmarked = false;

  void toggleBookmark() {
    setState(() {
      isBookmarked = !isBookmarked;
    });

    if (isBookmarked) {
      Get.snackbar(
        "Added to Favorites",
        widget.title,
        backgroundColor: Colors.black87,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "INSIGHTS",
            style: TextStyle(
              fontSize: screenWidth * 0.035,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          SizedBox(height: screenHeight * 0.005),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: screenWidth * 0.04,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.005),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: screenWidth * 0.04,
                          backgroundImage: AssetImage(widget.profileImageUrl),
                        ),
                        SizedBox(width: screenWidth * 0.02),
                        Text(
                          widget.author,
                          style: TextStyle(
                            fontSize: screenWidth * 0.035,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.02),
                        Text(
                          widget.timeAgo,
                          style: TextStyle(
                            fontSize: screenWidth * 0.03,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(width: screenWidth * 0.03),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  widget.imageUrl,
                  width: screenWidth * 0.25,
                  height: screenHeight * 0.1,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: screenWidth * 0.03),
              GestureDetector(
                onTap: toggleBookmark,
                child: Icon(
                  isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                  color: isBookmarked ? Colors.blueAccent : Colors.black,
                ),
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.02),
        ],
      ),
    );
  }
}
