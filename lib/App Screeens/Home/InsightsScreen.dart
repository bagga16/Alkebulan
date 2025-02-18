// import 'package:alkebulan/App%20Widgets/FeaturedUsers.dart';
// import 'package:alkebulan/App%20Widgets/InsightsPostCard.dart';
// import 'package:alkebulan/Controllers/InsightsController.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class InsightsScreen extends StatelessWidget {
//   final InsightsController controller = Get.put(InsightsController());

//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;
//     double screenHeight = MediaQuery.of(context).size.height;

//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Header
//             Padding(
//               padding: EdgeInsets.symmetric(
//                   horizontal: screenWidth * 0.05,
//                   vertical: screenHeight * 0.02),
//               child: Row(
//                 children: [
//                   Text(
//                     "explore",
//                     style: TextStyle(
//                       fontSize: screenWidth * 0.05,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.grey,
//                     ),
//                   ),
//                   SizedBox(width: screenWidth * 0.05),
//                   Text(
//                     "insights",
//                     style: TextStyle(
//                       fontSize: screenWidth * 0.05,
//                       fontWeight: FontWeight.bold,
//                       decoration: TextDecoration.underline,
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             // Featured Users
//             FeaturedUsers(),

//             // Insights Posts List
//             Expanded(
//               child: ListView.builder(
//                 itemCount: controller.insights.length,
//                 itemBuilder: (context, index) {
//                   final post = controller.insights[index];
//                   return InsightPost(
//                     title: post["title"]!,
//                     imageUrl: post["imageUrl"]!,
//                     author: post["author"]!,
//                     timeAgo: post["timeAgo"]!,
//                     profileImageUrl: post["profileImageUrl"]!,
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
