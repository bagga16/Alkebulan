import 'package:alkebulan/App%20Widgets/CommentBottomSheet.dart';
import 'package:alkebulan/Common%20Components/CommonButton.dart';
import 'package:alkebulan/Controllers/CommentController.dart';
import 'package:alkebulan/Models/ReelsModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatefulWidget {
  final ReelsModel video;
  const VideoPlayerWidget({Key? key, required this.video}) : super(key: key);

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  final CommentController commentController = Get.put(CommentController());
  late VideoPlayerController _controller;
  bool isLiked = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.video.videoUrl)
      ..initialize().then((_) {
        setState(() {}); // Update UI when video is ready
      })
      ..setLooping(true)
      ..play();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        // Video Background
        SizedBox.expand(
          child: _controller.value.isInitialized
              ? VideoPlayer(_controller)
              : Center(child: CircularProgressIndicator()),
        ),

        // Overlay Controls
        Positioned(
          bottom: screenHeight * 0.12,
          left: screenWidth * 0.05,
          child: Container(
            width: screenWidth * 0.75, // Ensure text wraps
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.video.username,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenWidth * 0.05,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: screenHeight * 0.005),
                Text(
                  widget.video.description,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenWidth * 0.035,
                  ),
                ),
              ],
            ),
          ),
        ),

        // Right Side Icons (Likes, Comments, Shares)
        Positioned(
          bottom: screenHeight * 0.12,
          right: screenWidth * 0.05,
          child: Column(
            children: [
              _buildLikeIcon(),
              SizedBox(height: screenHeight * 0.015),
              _buildCommentIcon(),
              SizedBox(height: screenHeight * 0.015),
              _buildShareIcon(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildLikeIcon() {
    return GestureDetector(
      onTap: () {
        setState(() {
          isLiked = !isLiked;
        });
      },
      child: Column(
        children: [
          Icon(
            Icons.favorite,
            color: isLiked ? Colors.red : Colors.white,
            size: 30,
          ),
          Text(
            "${widget.video.likes + (isLiked ? 1 : 0)}",
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _buildCommentIcon() {
    return GestureDetector(
      onTap: () {
        commentController.loadComments(1); // Load comments for the reel
        Get.bottomSheet(CommentBottomSheet());
      },
      child: Column(
        children: [
          Icon(Icons.comment, color: Colors.white, size: 30),
          Text(
            "${widget.video.comments}",
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _buildShareIcon() {
    return GestureDetector(
      onTap: () {
        _showBottomSheet("Share", "Sharing options go here...");
      },
      child: Column(
        children: [
          Image.asset('assets/icons/share.png'),
          //  Icon(Icons.share, color: Colors.white, size: 30),
          Text(
            "${widget.video.shares}",
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
        ],
      ),
    );
  }

  void _showBottomSheet(String title, String message) {
    Get.bottomSheet(
      Container(
        width: double.infinity,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text(message, textAlign: TextAlign.center),
            SizedBox(height: 20),
            CommonButton(
              onPressed: () => Get.back(),
              text: "Close",
            ),
          ],
        ),
      ),
    );
  }
}
