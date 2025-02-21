import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: screenHeight * 0.07),

          // Menu Icon
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
            child:
                Icon(Icons.menu, color: Colors.black, size: screenWidth * 0.06),
          ),

          SizedBox(height: screenHeight * 0.03),

          // Filter Text
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
            child: Text(
              "Filter",
              style: TextStyle(
                fontSize: screenWidth * 0.045,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),

          SizedBox(height: screenHeight * 0.02),

          // Read Option
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
            child: GestureDetector(
              onTap: () {
                // Handle Read Tap
              },
              child: Text(
                "Read",
                style: TextStyle(
                  fontSize: screenWidth * 0.04,
                  fontWeight: FontWeight.w600,
                  color: Colors.blue, // Active Color
                ),
              ),
            ),
          ),

          SizedBox(height: screenHeight * 0.015),

          // Watch Option
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
            child: GestureDetector(
              onTap: () {
                // Handle Watch Tap
              },
              child: Text(
                "Watch",
                style: TextStyle(
                  fontSize: screenWidth * 0.04,
                  fontWeight: FontWeight.w500,
                  color: Colors.black, // Inactive Color
                ),
              ),
            ),
          ),

          SizedBox(height: screenHeight * 0.02),

          // Divider
          Divider(thickness: 1, color: Colors.grey.withOpacity(0.3)),
        ],
      ),
    );
  }
}
