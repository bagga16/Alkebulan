import 'package:alkebulan/Models/BookMarkModel.dart';
import 'package:alkebulan/Models/LikeModel.dart';
import 'package:alkebulan/Utils/Mediaquery%20Sizer.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'package:get/get.dart';

class BookmarkItem extends StatefulWidget {
  final Bookmark bookmark;

  BookmarkItem({required this.bookmark});

  @override
  _BookmarkItemState createState() => _BookmarkItemState();
}

class _BookmarkItemState extends State<BookmarkItem> {
  bool isFavorite = true; // Initially bookmarked

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });

    if (!isFavorite) {
      Get.snackbar(
        "Removed from Bookmarks",
        widget.bookmark.title,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQueryHelper.width(context, 1.2);
    double screenHeight = MediaQueryHelper.height(context, 1.2);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
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
                      widget.bookmark.title,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: screenWidth * 0.035,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.005),
                    Text(
                      widget.bookmark.timeAgo,
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
                  widget.bookmark.imageUrl,
                  width: screenWidth * 0.2,
                  height: screenHeight * 0.08,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          SizedBox(
            height: screenHeight * 0.01,
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
          Divider(
            height: screenHeight * 0.04,
          ),
        ],
      ),
    );
  }
}

class LikeItem extends StatefulWidget {
  final Like like;

  LikeItem({required this.like});

  @override
  _LikeItemState createState() => _LikeItemState();
}

class _LikeItemState extends State<LikeItem> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.like.videoUrl)
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: _controller.value.isInitialized
          ? ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  AspectRatio(
                    //aspectRatio:
                    aspectRatio: 9 / 10,
                    child: VideoPlayer(_controller),
                  ),
                ],
              ),
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
