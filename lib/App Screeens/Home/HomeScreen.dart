// import 'package:alkebulan/App%20Widgets/Postcard.dart';
// import 'package:alkebulan/Common%20Components/BottomBar.dart';
// import 'package:alkebulan/Controllers/HomeController.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class HomeScreen extends StatelessWidget {
//   final HomeController controller = Get.put(HomeController());

//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;
//     double screenHeight = MediaQuery.of(context).size.height;

//     return Scaffold(
//       backgroundColor: Colors.white,
//       //  bottomNavigationBar: DBNBPage(),
//       body: SafeArea(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(height: screenHeight * 0.02),

//             // Weekday Tabs
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: List.generate(
//                   7,
//                   (index) => Text(
//                     controller.weekdays[index],
//                     style: TextStyle(
//                       fontSize: screenWidth * 0.04,
//                       fontWeight: controller.selectedDay.value == index
//                           ? FontWeight.bold
//                           : FontWeight.normal,
//                       color: controller.selectedDay.value == index
//                           ? Colors.blue
//                           : Color.fromRGBO(125, 125, 125, 1),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: screenHeight * 0.02),

//             // Tabs: Explore & Insights
//             Row(
//               children: [
//                 SizedBox(width: screenWidth * 0.05),
//                 Text(
//                   "explore",
//                   style: TextStyle(
//                     fontSize: screenWidth * 0.05,
//                     fontWeight: FontWeight.bold,
//                     decoration: TextDecoration.underline,
//                   ),
//                 ),
//                 SizedBox(width: screenWidth * 0.05),
//                 Text(
//                   "insights",
//                   style: TextStyle(
//                     fontSize: screenWidth * 0.05,
//                     color: Colors.grey,
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: screenHeight * 0.03),

//             // Featured Post
//             PostCard(
//               category: "",
//               title: "How Nigeria Became the Cradle of Africa's Oil Sector",
//               imageUrl: "assets/images/post.png",
//               isFeatured: true,
//             ),

//             // Regular Posts
//             Expanded(
//               child: ListView(
//                 children: [
//                   PostCard(
//                     category: "FOR YOU",
//                     title: "Fix South Africa or Face Arab Spring-Like Revolt",
//                     imageUrl: "assets/images/refer.png",
//                     timeAgo: "3d ago",
//                   ),
//                   PostCard(
//                     category: "INSIGHTS",
//                     title:
//                         "Aid but no peace: humanitarian action in northern Uganda",
//                     imageUrl: "assets/images/post1.png",
//                     timeAgo: "",
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

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
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight * 0.02),

            // Weekday Tabs
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: List.generate(
                    7,
                    (index) => Padding(
                      padding: const EdgeInsets.only(
                          right: 3), // Padding of 10 for each day
                      child: GestureDetector(
                        onTap: () => controller.selectedDay.value = index,
                        child: Container(
                          padding:
                              EdgeInsets.all(8), // Padding inside the circle
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: controller.selectedDay.value == index
                                  ? Colors.blue
                                  : Colors.transparent,
                              width: 2,
                            ),
                          ),
                          child: Text(
                            controller.weekdays[index],
                            style: TextStyle(
                              fontSize: screenWidth * 0.04,
                              fontWeight: controller.selectedDay.value == index
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              color: controller.selectedDay.value == index
                                  ? Colors.blue
                                  : Color.fromRGBO(125, 125, 125, 1),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),

            // Tabs: Explore & Insights
            Row(
              children: [
                SizedBox(width: screenWidth * 0.05),
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
            SizedBox(height: screenHeight * 0.03),

            // Featured Post
            // PostCard(
            //   category: "",
            //   title: "How Nigeria Became the Cradle of Africa's Oil Sector",
            //   imageUrl: "assets/images/post.png",
            //   isFeatured: true,
            // ),

            // Regular Posts
            Expanded(
              child: ListView(
                children: [
                  PostCard(
                    category: "FOR YOU",
                    title: "Fix South Africa or Face Arab Spring-Like Revolt",
                    imageUrl: "assets/images/post.png",
                    timeAgo: "3d ago",
                    isFeatured: true,
                  ),
                  PostCard(
                    category: "FOR YOU",
                    title: "Fix South Africa or Face Arab Spring-Like Revolt",
                    imageUrl: "assets/images/refer.png",
                    timeAgo: "3d ago",
                    isForYou: true,
                  ),
                  PostCard(
                    category: "Ecnomics",
                    title:
                        "Aid but no peace: humanitarian action in northern Uganda",
                    imageUrl: "assets/images/post1.png",
                    timeAgo: "",
                    isEconomics: true,
                    username: "Bagga",
                    profileImageUrl: "assets/images/post.png",
                  ),
                  PostCard(
                    category: "INSIGHTS",
                    title:
                        "Aid but no peace: humanitarian action in northern Uganda",
                    imageUrl: "assets/images/post1.png",
                    timeAgo: "",
                    isInsight: true,
                    username: "Ahmad",
                    profileImageUrl: "assets/images/post1.png",
                  ),
                  PostCard(
                    category: "Ecnomics",
                    title:
                        "Aid but no peace: humanitarian action in northern Uganda",
                    imageUrl: "assets/images/refer.png",
                    timeAgo: "",
                    isEconomics: true,
                    username: "SAAb",
                    profileImageUrl: "assets/images/post.png",
                  ),
                  PostCard(
                    category: "Ecnomics",
                    title:
                        "Aid but no peace: humanitarian action in northern Uganda",
                    imageUrl: "assets/images/post1.png",
                    timeAgo: "",
                    isEconomics: true,
                  ),
                  PostCard(
                    category: "For You",
                    title:
                        "Aid but no peace: humanitarian action in northern Uganda",
                    imageUrl: "assets/images/post1.png",
                    timeAgo: "",
                    isForYou: true,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    );
  }
}
