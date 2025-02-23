import 'package:alkebulan/App%20Widgets/LiveTV_Player.dart';
import 'package:alkebulan/App%20Widgets/ReelsVideoPlayer.dart';
import 'package:alkebulan/Controllers/LiveTV_Controller.dart';
import 'package:alkebulan/Controllers/ReelsController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ReelsScreen extends StatelessWidget {
  final ReelsController controller = Get.put(ReelsController());

  final LiveTVController liveTVController = Get.put(LiveTVController());

  ReelsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Tabs for "For You" and "Live TV"
            Padding(
              padding: EdgeInsets.only(
                  left: screenWidth * 0.05, top: screenHeight * 0.02),
              child: Row(
                children: [
                  SvgPicture.asset('assets/icons/equal.svg'),
                  SizedBox(
                    width: screenWidth * 0.02,
                  ),
                  _buildTab("for you", 0),
                  SizedBox(width: screenWidth * 0.05),
                  _buildTab("live tv", 1),
                ],
              ),
            ),

            // Video Scrolling
            Expanded(
              child: Obx(() {
                return controller.selectedTab.value == 0
                    ? PageView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: controller.videos.length,
                        itemBuilder: (context, index) {
                          return VideoPlayerWidget(
                              video: controller.videos[index]);
                        },
                      )
                    : PageView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: liveTVController.liveVideos.length,
                        onPageChanged: (index) {
                          liveTVController.switchVideo(index);
                        },
                        itemBuilder: (context, index) {
                          return LiveTVPlayer();
                        },
                      );
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTab(String title, int tabIndex) {
    return GestureDetector(
      onTap: () => controller.selectedTab.value = tabIndex,
      child: Obx(
        () => Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: controller.selectedTab.value == tabIndex
                ? Colors.black
                : Colors.grey,
            decoration: controller.selectedTab.value == tabIndex
                ? TextDecoration.underline
                : TextDecoration.none,
          ),
        ),
      ),
    );
  }
}
