import 'package:alkebulan/Common%20Components/CommonButton.dart';
import 'package:alkebulan/Controllers/OnBoardingController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingTwo extends StatelessWidget {
  final OnboardingController controller = Get.find<OnboardingController>();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: screenHeight * 0.11),

              /// **Title**
              Text(
                "What region and topics\nmatter most to you?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: screenWidth * 0.06,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: screenHeight * 0.019),

              /// **Subtitle**
              Text(
                "You can change your preferences later.",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: screenWidth * 0.035,
                    color: Color.fromRGBO(71, 71, 71, 71)),
              ),
              SizedBox(height: screenHeight * 0.04),

              /// **Topic Selection Grid**
              Obx(() => Wrap(
                    spacing: 10,
                    runSpacing: 16,
                    alignment: WrapAlignment.center,
                    children: controller.topics
                        .map((topic) => GestureDetector(
                              onTap: () => controller.toggleTopic(topic),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 9),
                                decoration: BoxDecoration(
                                  color:
                                      controller.selectedTopics.contains(topic)
                                          ? Colors.black
                                          : Color.fromRGBO(248, 249, 255, 1),
                                  borderRadius: BorderRadius.circular(11),
                                ),
                                child: Text(
                                  topic,
                                  style: TextStyle(
                                    color: controller.selectedTopics
                                            .contains(topic)
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: screenWidth * 0.033,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ))
                        .toList(),
                  )),
              SizedBox(height: screenHeight * 0.081),

              /// **Continue Button**
              CommonButton(
                text: "Continue",
                buttonColor: Colors.blue,
                onPressed: () => controller.goToOnboardingThree(),
              ),
              SizedBox(height: screenHeight * 0.017),

              /// **Skip this step**
              TextButton(
                onPressed: () => controller.completeOnboarding(),
                child: Text(
                  "Skip this step",
                  style: TextStyle(color: Colors.black, fontSize: 14),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
