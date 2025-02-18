import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LatestArticleCard extends StatelessWidget {
  final String category;
  final String title;
  final String imageUrl;
  final String timeAgo;
  final String duration;

  const LatestArticleCard({
    Key? key,
    required this.category,
    required this.title,
    required this.imageUrl,
    required this.timeAgo,
    required this.duration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.05, vertical: screenHeight * 0.01),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            category.toUpperCase(),
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
                      "$timeAgo • $duration listen",
                      style: TextStyle(
                        fontSize: screenWidth * 0.03,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: screenWidth * 0.03),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      imageUrl,
                      width: screenWidth * 0.22,
                      height: screenHeight * 0.085,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: screenWidth * 0.01),
                  GestureDetector(
                    onTap: () {
                      Get.snackbar(
                        "Added to Favorites",
                        title,
                        backgroundColor: Colors.green,
                        colorText: Colors.white,
                        snackPosition: SnackPosition.TOP,
                        margin:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      );
                    },
                    child: Icon(Icons.bookmark_border, color: Colors.black),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
