import 'package:alkebulan/App%20Widgets/TopNewsCard.dart';
import 'package:alkebulan/App%20Widgets/TrendingPostCard.dart';
import 'package:alkebulan/Controllers/TrendingController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TrendingScreen extends StatelessWidget {
  final TrendingController controller = Get.put(TrendingController());

  TrendingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: screenWidth * 0.05,
                right: screenWidth * 0.05,
                top: screenHeight * 0.08,
                bottom: screenHeight * 0.007,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(Icons.arrow_back)),
                  Text(
                    "Trending",
                    style: TextStyle(
                      fontSize: screenWidth * 0.06,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(Icons.settings_outlined)),
                ],
              ),
            ),
            // Trending Posts (Vertical)
            Obx(() {
              if (controller.trendingPosts.isEmpty ||
                  controller.topNews.isEmpty) {
                return Center(child: CircularProgressIndicator());
              }

              // First Trending Post
              final firstTrendingPost = controller.trendingPosts.first;
              final remainingTrendingPosts =
                  controller.trendingPosts.sublist(1);

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // First Trending Post
                  Divider(thickness: 1.2, color: Colors.grey.shade300),
                  TrendingPostCard(post: firstTrendingPost),

                  SizedBox(height: 10),

                  Divider(),
                  // Top News (Horizontal Scrolling)
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text("Top News",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18)),
                  ),

                  SizedBox(height: 8),
                  Obx(() => SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          children: controller.topNews.map((post) {
                            return Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: TopNewsCard(post: post),
                            );
                          }).toList(),
                        ),
                      )),

                  SizedBox(height: 15),

                  // Remaining Trending Posts
                  Column(
                    children: remainingTrendingPosts
                        .map((post) => Column(
                              children: [
                                Divider(
                                    thickness: 1.2,
                                    color: Colors.grey.shade300),
                                TrendingPostCard(post: post),
                              ],
                            ))
                        .toList(),
                  ),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}
