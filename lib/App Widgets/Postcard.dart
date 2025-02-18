import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostCard extends StatefulWidget {
  final String category;
  final String title;
  final String imageUrl;
  final String timeAgo;
  final bool isFeatured;
  final bool isForYou;
  final bool isInsight;
  final bool isEconomics;
  final String? profileImageUrl;
  final String? username;

  const PostCard({
    Key? key,
    required this.category,
    required this.title,
    required this.imageUrl,
    this.isFeatured = false,
    this.timeAgo = "",
    this.isForYou = false,
    this.isInsight = false,
    this.isEconomics = false,
    this.profileImageUrl,
    this.username,
  }) : super(key: key);

  @override
  _PostCardState createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  bool isFavorite = false;

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });

    if (isFavorite) {
      Get.snackbar(
        "Added to Favorites",
        widget.title,
        backgroundColor: Colors.green,
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: screenHeight * 0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Featured Post Layout
              if (widget.isFeatured)
                _buildFeaturedLayout(screenWidth, screenHeight),

              if (!widget.isFeatured) ...[
                // Category Title
                Padding(
                  padding: EdgeInsets.only(
                      bottom: screenHeight * 0.005, left: screenWidth * 0.04),
                  child: Text(
                    widget.category.toUpperCase(),
                    style: TextStyle(
                      fontSize: screenWidth * 0.035,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ),

                // Standard Layouts
                if (widget.isForYou)
                  _buildForYouLayout(screenWidth, screenHeight)
                else if (widget.isEconomics)
                  _buildEconomicsLayout(screenWidth, screenHeight)
                else if (widget.isInsight)
                  _buildInsightLayout(screenWidth, screenHeight)
                else
                  _buildInsightLayout(screenWidth, screenHeight),
              ],
            ],
          ),
        ),

        // Divider after each post
        Container(
          height: 1.5,
          color: Colors.grey.withOpacity(0.2),
          margin: EdgeInsets.only(bottom: screenHeight * 0.009),
        ),
      ],
    );
  }

  // Featured Post Layout
  Widget _buildFeaturedLayout(double screenWidth, double screenHeight) {
    return Container(
      width: double.infinity,
      height: screenHeight * 0.25,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(widget.imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        padding: EdgeInsets.all(screenWidth * 0.04),
        alignment: Alignment.bottomLeft,
        child: Text(
          widget.title,
          style: TextStyle(
            fontSize: screenWidth * 0.045,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  // // "For You" Layout
  Widget _buildForYouLayout(double screenWidth, double screenHeight) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
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
                    Text(
                      widget.timeAgo,
                      style: TextStyle(
                        fontSize: screenWidth * 0.03,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: screenWidth * 0.03),
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset(
                  widget.imageUrl,
                  width: screenWidth * 0.2,
                  height: screenHeight * 0.08,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 3,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(
                Icons.play_circle_outline,
                color: Colors.black,
                size: 20,
              ),
              SizedBox(width: screenWidth * 0.02),
              GestureDetector(
                onTap: toggleFavorite,
                child: Icon(
                  isFavorite ? Icons.bookmark : Icons.bookmark_border,
                  color: isFavorite ? Colors.blueAccent : Colors.black,
                  size: 20,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Economics & Insights Layout with Profile Picture
  Widget _buildEconomicsLayout(double screenWidth, double screenHeight) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.asset(
              widget.imageUrl,
              width: double.infinity,
              height: screenHeight * 0.25,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: screenHeight * 0.01),
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
                backgroundImage: AssetImage(widget.profileImageUrl ?? ""),
                radius: screenWidth * 0.04,
              ),
              SizedBox(width: screenWidth * 0.02),
              Text(
                widget.username ?? "Newsroom Africa",
                style: TextStyle(
                  fontSize: screenWidth * 0.035,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "  " + widget.timeAgo,
                style: TextStyle(
                  fontSize: screenWidth * 0.025,
                  color: Colors.grey.shade400,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Spacer(),
              GestureDetector(
                onTap: toggleFavorite,
                child: Icon(
                  isFavorite ? Icons.bookmark : Icons.bookmark_border,
                  color: isFavorite ? Colors.blueAccent : Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // // "For You" Layout
  Widget _buildInsightLayout(double screenWidth, double screenHeight) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  widget.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: screenWidth * 0.04,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset(
                  widget.imageUrl,
                  width: screenWidth * 0.23,
                  height: screenHeight * 0.08,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                radius: screenWidth * 0.04,
                backgroundImage: AssetImage(widget.profileImageUrl ?? ""),
              ),
              SizedBox(width: screenWidth * 0.02),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.username ?? "bagga",
                    style: TextStyle(
                      color: Color.fromRGBO(86, 86, 86, 1),
                      fontSize: screenWidth * 0.035,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    widget.timeAgo,
                    style: TextStyle(
                      fontSize: screenWidth * 0.03,
                      color: Color.fromRGBO(86, 86, 86, 1),
                    ),
                  ),
                ],
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  toggleFavorite();
                },
                child: Icon(
                  isFavorite ? Icons.bookmark : Icons.bookmark_border,
                  color: isFavorite ? Colors.blueAccent : Colors.black,
                  size: 20,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
