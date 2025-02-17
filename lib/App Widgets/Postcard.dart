// import 'package:flutter/material.dart';
// import 'package:get/get_connect/http/src/utils/utils.dart';

// class PostCard extends StatelessWidget {
//   final String category;
//   final String title;
//   final String imageUrl;
//   final String timeAgo;
//   final bool isFeatured;
//   final bool isForYou;
//   final bool isInsight;
//   final bool isEcnomics;

//   const PostCard({
//     Key? key,
//     required this.category,
//     required this.title,
//     required this.imageUrl,
//     this.timeAgo = "",
//     this.isFeatured = false,
//     this.isForYou = false,
//     this.isInsight = false,
//     this.isEcnomics = false,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;
//     double screenHeight = MediaQuery.of(context).size.height;

//     return Container(
//       margin: EdgeInsets.only(bottom: screenHeight * 0.02),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Image for Featured Post
//           if (isFeatured)
//             Container(
//               width: double.infinity,
//               height: screenHeight * 0.24,
//               padding: EdgeInsets.symmetric(
//                   vertical: screenHeight * 0.01,
//                   horizontal: screenWidth * 0.05),
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                   image: AssetImage(imageUrl),
//                   // AssetImage(imageUrl),
//                   fit: BoxFit.fill,
//                 ),
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   Text(
//                     title,
//                     style: TextStyle(
//                       fontSize: screenWidth * 0.045,
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//           if (!isFeatured) ...[
//             Padding(
//               padding: EdgeInsets.symmetric(
//                   vertical: screenHeight * 0.008,
//                   horizontal: screenWidth * 0.05),
//               child: Text(
//                 category.toUpperCase(),
//                 style: TextStyle(
//                   fontSize: screenWidth * 0.035,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.blue,
//                 ),
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Thumbnail Image
//                   ClipRRect(
//                     borderRadius: BorderRadius.circular(8),
//                     child: Image.asset(
//                       imageUrl,
//                       width: screenWidth * 0.25,
//                       height: screenHeight * 0.1,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   SizedBox(width: screenWidth * 0.03),
//                   // Post Info
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           title,
//                           maxLines: 2,
//                           overflow: TextOverflow.ellipsis,
//                           style: TextStyle(
//                             fontSize: screenWidth * 0.04,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         SizedBox(height: screenHeight * 0.005),
//                         Text(
//                           timeAgo,
//                           style: TextStyle(
//                             fontSize: screenWidth * 0.03,
//                             color: Colors.grey,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   // Bookmark and Play Icon
//                   Column(
//                     children: [
//                       Icon(Icons.play_circle_outline, color: Colors.black),
//                       SizedBox(height: screenHeight * 0.01),
//                       Icon(Icons.bookmark_border, color: Colors.black),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ],
//       ),
//     );
//   }
// }
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
  final String? profileImageUrl; // Profile picture for Insights & Economics
  final String? username; // Username for Insights & Economics

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
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
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
                  padding: EdgeInsets.only(bottom: screenHeight * 0.005),
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
                else if (widget.isEconomics || widget.isInsight)
                  _buildEconomicsLayout(screenWidth, screenHeight)
                else
                  _buildStandardLayout(screenWidth, screenHeight),
              ],
            ],
          ),
        ),

        // Divider after each post
        Container(
          height: 1.5,
          color: Colors.grey.withOpacity(0.2),
          margin: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
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
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: AssetImage(widget.imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        padding: EdgeInsets.all(screenWidth * 0.04),
        alignment: Alignment.bottomLeft,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            colors: [Colors.black.withOpacity(0.7), Colors.transparent],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
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

  // Standard Post Layout
  Widget _buildStandardLayout(double screenWidth, double screenHeight) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            widget.imageUrl,
            width: screenWidth * 0.25,
            height: screenHeight * 0.1,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(width: screenWidth * 0.03),
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
        Column(
          children: [
            Icon(Icons.play_circle_outline, color: Colors.black),
            SizedBox(height: screenHeight * 0.01),
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
    );
  }

  // "For You" Layout (Image on Right)
  Widget _buildForYouLayout(double screenWidth, double screenHeight) {
    return Row(
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
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            widget.imageUrl,
            width: screenWidth * 0.25,
            height: screenHeight * 0.1,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }

  // Economics & Insights Layout with Profile Picture
  Widget _buildEconomicsLayout(double screenWidth, double screenHeight) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
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
    );
  }
}
