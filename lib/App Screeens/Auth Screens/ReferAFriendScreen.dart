import 'package:alkebulan/Common%20Components/CommonButton.dart';
import 'package:alkebulan/Controllers/RAF_Controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ReferFriendScreen extends StatelessWidget {
  final ReferController controller = Get.put(ReferController());

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: screenHeight * 0.13),

            // Title
            Text(
              "Refer a Friend",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: screenWidth * 0.05,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: screenHeight * 0.09),

            SizedBox(
              height: screenHeight * 0.3,
              width: screenWidth,
              child: Image.asset('assets/images/refer.png'),
            ),
            SizedBox(height: screenHeight * 0.07),

            // Refer Reward Text
            Text(
              "Refer 3 friends, Get \$10",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: screenWidth * 0.045,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: screenHeight * 0.01),

            // Additional Info
            Text(
              "Your friend will also receive a month free",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: screenWidth * 0.035,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: screenHeight * 0.09),

            // Refer a Friend Button
            CommonButton(
              text: "Refer a Friend",
              onPressed: () => controller.referFriend(),
            ),
            SizedBox(height: screenHeight * 0.01),

            // Maybe Later Button
            TextButton(
              onPressed: () => controller.maybeLater(),
              child: Text("Maybe Later",
                  style: TextStyle(color: Colors.grey.shade400)),
            ),
          ],
        ),
      ),
    );
  }
}
