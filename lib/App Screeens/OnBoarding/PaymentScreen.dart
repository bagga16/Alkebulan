import 'package:alkebulan/App%20Widgets/PaymentCard.dart';
import 'package:alkebulan/Common%20Components/CommonButton.dart';
import 'package:alkebulan/Controllers/PaymentController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentScreen extends StatelessWidget {
  final PaymentController controller = Get.put(PaymentController());

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
            SizedBox(height: screenHeight * 0.1),

            // Title
            Text(
              "Choose Your Plan",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: screenWidth * 0.05,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: screenHeight * 0.01),

            // Subtitle
            Text(
              "Unlock exclusive access to expert insights, daily updates, in-depth reports and more",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: screenWidth * 0.035,
                color: Colors.black,
              ),
            ),
            SizedBox(height: screenHeight * 0.03),

            // Horizontal Scroll for Payment Cards
            SizedBox(
              height: screenHeight * 0.43,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  PaymentCard(
                    title: "Free Tier",
                    price: "",
                    features: [
                      "Ads included",
                      "Limited article views per day",
                      "Bookmark articles for later",
                      "Contributor in-depth insights"
                    ],
                  ),
                  PaymentCard(
                    title: "Premium",
                    price: "\$3.99 / month",
                    features: [
                      "Ad free experience",
                      "Watch news reels",
                      "Unlimited article access",
                      "Contributor in-depth insights",
                      "Filter by region",
                      "Audio versions of articles",
                      "AI Insights"
                    ],
                    isMostPopular: true,
                  ),
                  PaymentCard(
                    title: "Business",
                    price: "\$9.99 / month",
                    features: [
                      "Ad free experience",
                      "Upload news reels",
                      "Unlimited article access",
                      "Contributor in-depth insights",
                      "Filter by region",
                      "Audio versions of articles",
                      "AI Insights",
                      "Early access to select content"
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.02),

            // Scroll Indicator
            Text(
              "Scroll to view all plans",
              style:
                  TextStyle(fontSize: screenWidth * 0.035, color: Colors.grey),
            ),
            SizedBox(height: screenHeight * 0.08),

            // Continue Button
            CommonButton(
              text: "Continue",
              onPressed: () {
                controller.proceedToPayment();
                Get.toNamed('/signup');
              },
            ),
            SizedBox(height: screenHeight * 0.015),

            // Subscription Terms
            Text(
              "Subscriptions automatically renew unless auto renew is turned off at least 24 hours before the end of the trial. Free trials are only available to new members.",
              textAlign: TextAlign.center,
              style:
                  TextStyle(fontSize: screenWidth * 0.025, color: Colors.black),
            ),
            SizedBox(height: screenHeight * 0.015),

            // Restore Purchase & Terms
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Restore Purchase",
                  style: TextStyle(
                      fontSize: screenWidth * 0.03, color: Colors.black),
                ),
                SizedBox(
                  width: screenWidth * 0.06,
                ),
                Text(
                  "Terms Conditions",
                  style: TextStyle(
                      fontSize: screenWidth * 0.03, color: Colors.black),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
