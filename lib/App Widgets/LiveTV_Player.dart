import 'package:alkebulan/Controllers/LiveTV_Controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class LiveTVPlayer extends StatelessWidget {
  final LiveTVController controller = Get.put(LiveTVController());

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Obx(
      () => Stack(
        children: [
          // Video Player
          Center(
            child: GestureDetector(
              onTap: controller.togglePlayPause,
              child: AspectRatio(
                aspectRatio: controller.videoController.value.aspectRatio,
                child: VideoPlayer(controller.videoController),
              ),
            ),
          ),

          // Play/Pause Icon
          if (!controller.isPlaying.value)
            Center(
              child: Icon(Icons.play_arrow, size: 50, color: Colors.grey),
            ),

          // Progress Indicator
          Positioned(
            bottom: screenHeight * 0.15,
            left: screenWidth * 0.04,
            right: 10,
            child: Obx(() => LinearProgressIndicator(
                  value: controller.progress.value,
                  backgroundColor: Colors.grey,
                  color: Colors.blue,
                )),
          ),

          // Bottom Bar Controls
          Positioned(
            bottom: screenHeight * 0.10,
            left: screenWidth * 0.04,
            right: screenWidth * 0.04,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Live TV Label
                Row(
                  children: [
                    Text(
                      "newsroomafrica",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 5),
                    Icon(Icons.circle, color: Colors.red, size: 8),
                    SizedBox(width: 5),
                    Text(
                      "Live",
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),

                // Volume Control
                Row(
                  children: [
                    Icon(Icons.fullscreen_exit),
                    IconButton(
                      icon: Icon(
                        controller.isMuted.value
                            ? Icons.volume_off
                            : Icons.volume_up,
                        color: Colors.black,
                      ),
                      onPressed: controller.toggleMute,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
