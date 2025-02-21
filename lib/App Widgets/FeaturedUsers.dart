import 'package:alkebulan/App%20Screeens/Home/ContributerProfileScreen.dart';
import 'package:alkebulan/Controllers/ContributorController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeaturedUsers extends StatelessWidget {
  final List<Map<String, String>> users = [
    {
      "image": "assets/images/user1.png",
      "name": "Kwame Assoku",
      "bio":
          "I’m a Harvard MBA graduate with experience at Deloitte and LinkedIn, bringing strategic insights and analysis to Alkebulan."
    },
    {
      "image": "assets/images/user2.png",
      "name": "Betty Sanders",
      "bio": "jaegfeuwevdjkvweufygswhj"
    },
    {
      "image": "assets/images/user3.png",
      "name": "Luis Galindo",
      "bio": "jaegfeuwevdjkvweufygswhj"
    },
    {
      "image": "assets/images/user4.png",
      "name": "John Doe",
      "bio": "jaegfeuwevdjkvweufygswhj"
    },
    {
      "image": "assets/images/user1.png",
      "name": "Kwame Assoku",
      "bio": "jaegfeuwevdjkvweufygswhj"
    },
    {
      "image": "assets/images/user2.png",
      "name": "Betty Sanders",
      "bio": "jaegfeuwevdjkvweufygswhj"
    },
    {
      "image": "assets/images/user3.png",
      "name": "Luis Galindo",
      "bio": "jaegfeuwevdjkvweufygswhj"
    },
    {
      "image": "assets/images/user4.png",
      "name": "John Doe",
      "bio": "jaegfeuwevdjkvweufygswhj"
    },
  ];

  FeaturedUsers({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
          child: Text(
            "FEATURED",
            style: TextStyle(
              fontSize: screenWidth * 0.035,
              fontWeight: FontWeight.w500,
              color: Colors.grey.shade600,
            ),
          ),
        ),
        SizedBox(height: screenHeight * 0.01),
        SizedBox(
          height: screenHeight * 0.08,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
            children: users
                .map(
                  (user) => GestureDetector(
                    onTap: () {
                      // Set user data and navigate
                      ContributorController controller =
                          Get.put(ContributorController());
                      controller.setUserData(
                        user["name"]!,
                        user["image"]!,
                        user["bio"]!,
                      );

                      Get.to(() => ContributorProfileScreen());
                    },
                    child: Padding(
                      padding: EdgeInsets.only(right: screenWidth * 0.03),
                      child: CircleAvatar(
                        radius: screenWidth * 0.08,
                        backgroundImage: AssetImage(user["image"]!),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
        SizedBox(height: screenHeight * 0.02),
      ],
    );
  }
}
