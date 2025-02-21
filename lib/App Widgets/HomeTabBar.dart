import 'package:alkebulan/Controllers/HomeController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabBarWidget extends StatelessWidget {
  final HomeController controller = Get.find<HomeController>();

  TabBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        SizedBox(width: screenWidth * 0.05),

        // Explore Tab
        GestureDetector(
          onTap: () => controller.switchTab(0),
          child: Obx(
            () => Text(
              "explore",
              style: TextStyle(
                fontSize: screenWidth * 0.05,
                fontWeight: FontWeight.bold,
                decoration: controller.selectedTab.value == 0
                    ? TextDecoration.underline
                    : TextDecoration.none,
                color: controller.selectedTab.value == 0
                    ? Colors.black
                    : Colors.grey,
              ),
            ),
          ),
        ),

        SizedBox(width: screenWidth * 0.05),

        // Insights Tab
        GestureDetector(
          onTap: () => controller.switchTab(1),
          child: Obx(
            () => Text(
              "insights",
              style: TextStyle(
                fontSize: screenWidth * 0.05,
                fontWeight: FontWeight.bold,
                decoration: controller.selectedTab.value == 1
                    ? TextDecoration.underline
                    : TextDecoration.none,
                color: controller.selectedTab.value == 1
                    ? Colors.black
                    : Colors.grey,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
