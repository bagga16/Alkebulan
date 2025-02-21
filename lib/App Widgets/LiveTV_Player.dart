import 'package:alkebulan/Controllers/LiveTV_Controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class LiveTVPlayer extends StatelessWidget {
  final LiveTVController controller = Get.find<LiveTVController>();

  LiveTVPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Obx(
      () => GestureDetector(
        onTap: controller.isFullscreen.value
            ? controller.toggleFullscreen
            : controller.togglePlayPause,
        child: Stack(
          children: [
            // Video Player
            Container(
              color: Colors.black,
              child: Center(
                child: controller.videoController != null &&
                        controller.videoController!.value.isInitialized
                    ? AspectRatio(
                        aspectRatio:
                            controller.videoController!.value.aspectRatio,
                        child: VideoPlayer(controller.videoController!),
                      )
                    : CircularProgressIndicator(), // Show loading
              ),
            ),

            // Play/Pause Icon
            if (!controller.isPlaying.value && !controller.isFullscreen.value)
              Center(
                child: Icon(Icons.play_arrow, size: 50, color: Colors.white),
              ),

            // Progress Indicator
            if (!controller.isFullscreen.value)
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
            if (!controller.isFullscreen.value)
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
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 5),
                        Icon(Icons.circle, color: Colors.red, size: 8),
                        SizedBox(width: 5),
                        Text(
                          "Live",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),

                    // Volume & Fullscreen Controls
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.fullscreen, color: Colors.white),
                          onPressed: controller.toggleFullscreen,
                        ),
                        IconButton(
                          icon: Icon(
                            controller.isMuted.value
                                ? Icons.volume_off
                                : Icons.volume_up,
                            color: Colors.white,
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
      ),
    );
  }
}
