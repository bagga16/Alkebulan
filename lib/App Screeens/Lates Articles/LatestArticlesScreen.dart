import 'package:alkebulan/App%20Widgets/LatestArticaleCard.dart';
import 'package:alkebulan/Controllers/ContributorController.dart';
import 'package:alkebulan/Utils/Mediaquery%20Sizer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class LatestArticlesScreen extends StatefulWidget {
  const LatestArticlesScreen({super.key});

  @override
  State<LatestArticlesScreen> createState() => _LatestArticlesScreenState();
}

class _LatestArticlesScreenState extends State<LatestArticlesScreen> {
  final ContributorController controller = Get.put(ContributorController());
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                right: screenWidth * 0.05,
                left: screenWidth * 0.05,
                top: screenHeight * 0.08,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                      size: 20,
                    ),
                  ),
                  SizedBox(
                    width: screenWidth * 0.05,
                  ),
                  Text(
                    "Latest Articles",
                    style: TextStyle(
                      fontSize: MediaQueryHelper.fontSize(context, 0.05),
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text("                ")
                ],
              ),
            ),
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
        ));
  }
}
