import 'package:alkebulan/App%20Widgets/Postcard.dart';
import 'package:alkebulan/Common%20Components/BottomBar.dart';
import 'package:alkebulan/Controllers/HomeController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.02),

              // Weekday Tabs
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  7,
                  (index) => Text(
                    controller.weekdays[index],
                    style: TextStyle(
                      fontSize: screenWidth * 0.04,
                      fontWeight: controller.selectedDay.value == index
                          ? FontWeight.bold
                          : FontWeight.normal,
                      color: controller.selectedDay.value == index
                          ? Colors.blue
                          : Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),

              // Tabs: Explore & Insights
              Row(
                children: [
                  Text(
                    "explore",
                    style: TextStyle(
                      fontSize: screenWidth * 0.05,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.05),
                  Text(
                    "insights",
                    style: TextStyle(
                      fontSize: screenWidth * 0.05,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.02),

              // Featured Post
              PostCard(
                category: "",
                title: "How Nigeria Became the Cradle of Africa's Oil Sector",
                imageUrl: "https://example.com/nigeria-oil.jpg",
                isFeatured: true,
              ),
              SizedBox(height: screenHeight * 0.02),

              // Regular Posts
              Expanded(
                child: ListView(
                  children: [
                    PostCard(
                      category: "FOR YOU",
                      title: "Fix South Africa or Face Arab Spring-Like Revolt",
                      imageUrl: "https://example.com/south-africa.jpg",
                      timeAgo: "3d ago",
                    ),
                    PostCard(
                      category: "INSIGHTS",
                      title:
                          "Aid but no peace: humanitarian action in northern Uganda",
                      imageUrl: "https://example.com/uganda-aid.jpg",
                      timeAgo: "",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
