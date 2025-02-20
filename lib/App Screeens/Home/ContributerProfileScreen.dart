import 'package:alkebulan/App%20Widgets/LatestArticaleCard.dart';
import 'package:alkebulan/Common%20Components/CommonButton.dart';
import 'package:alkebulan/Controllers/ContributorController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContributorProfileScreen extends StatelessWidget {
  final ContributorController controller = Get.put(ContributorController());
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // App Bar
            Padding(
              padding: EdgeInsets.only(
                  left: screenWidth * 0.05,
                  right: screenWidth * 0.05,
                  top: screenHeight * 0.04),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Icon(Icons.arrow_back_rounded, color: Colors.black),
                  ),
                  GestureDetector(
                      onTap: () => Get.toNamed('trendingScreen'),
                      child:
                          Icon(Icons.settings_outlined, color: Colors.black)),
                ],
              ),
            ),

            // Profile Section
            Center(
              child: Column(
                children: [
                  Obx(() => CircleAvatar(
                        radius: screenWidth * 0.17,
                        backgroundImage:
                            AssetImage(controller.profileImage.value),
                      )),
                  SizedBox(height: screenHeight * 0.015),
                  Obx(() => Text(
                        controller.name.value,
                        style: TextStyle(
                          fontSize: screenWidth * 0.06,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                  Text(
                    "Contributor",
                    style: TextStyle(
                      fontSize: screenWidth * 0.04,
                      color: Colors.grey,
                    ),
                  ),
                  Obx(() => Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                        child: Text(
                          controller.bio.value,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: screenWidth * 0.035,
                            color: Colors.black,
                          ),
                        ),
                      )),
                  SizedBox(height: screenHeight * 0.03),
                  SizedBox(
                      width: MediaQuery.of(context).size.width - 40,
                      child: CommonButton(text: "Subscribe")),
                  SizedBox(height: screenHeight * 0.02),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.028),
            // Latest Articles Section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Latest Article",
                    style: TextStyle(
                      fontSize: screenWidth * 0.045,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed('latestArticles');
                    },
                    child: Text(
                      "See All",
                      style: TextStyle(
                        fontSize: screenWidth * 0.04,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.01),

            // List of Articles
            Expanded(
              child: ListView.builder(
                itemCount: controller.articles.length,
                itemBuilder: (context, index) {
                  final article = controller.articles[index];
                  return LatestArticleCard(
                    category: article["category"]!,
                    title: article["title"]!,
                    imageUrl: article["imageUrl"]!,
                    timeAgo: article["timeAgo"]!,
                    duration: article["duration"]!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
