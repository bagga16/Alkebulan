import 'package:alkebulan/Common%20Components/CommonButton.dart';
import 'package:alkebulan/Controllers/OnBoardingController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingOne extends StatelessWidget {
  final OnboardingController controller = Get.put(OnboardingController());

  OnboardingOne({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: screenHeight * 0.11),

            // Title
            Text(
              "Stay informed, Stay Connected",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: screenWidth * 0.05,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: screenHeight * 0.06),

            SizedBox(
              height: screenHeight * 0.25,
              width: screenWidth,
              child: Image.asset('assets/images/onboarding.png'),
            ),
            SizedBox(height: screenHeight * 0.03),

            // Features List
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Access to top global news sources",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: screenWidth * 0.045),
                ),
                SizedBox(height: screenHeight * 0.008),
                Text(
                  "High-quality audio and video content",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: screenWidth * 0.045),
                ),
                SizedBox(height: screenHeight * 0.008),
                Text(
                  "Personalized news feed",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: screenWidth * 0.045),
                ),
                SizedBox(height: screenHeight * 0.008),
                Text(
                  "Region-specific coverage",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: screenWidth * 0.045),
                ),
                SizedBox(height: screenHeight * 0.008),
                Text(
                  "Exclusive insights from Top Scholars",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: screenWidth * 0.045),
                ),
                SizedBox(height: screenHeight * 0.008),
                Text(
                  "AI Insights",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: screenWidth * 0.045),
                ),
              ],
            ),

            SizedBox(height: screenHeight * 0.05),

            // Continue Button
            SizedBox(
              width: MediaQuery.of(context).size.width - 47,
              child: CommonButton(
                text: "Continue",
                onPressed: () => controller.goToOnboardingTwo(),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),

            // Already have an account
            TextButton(
              onPressed: () {},
              child: Text("I already have an account",
                  style: TextStyle(color: Colors.grey)),
            ),
          ],
        ),
      ),
    );
  }
}
