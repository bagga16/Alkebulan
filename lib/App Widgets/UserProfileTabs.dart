// import 'package:alkebulan/Controllers/UserProfileController.dart';
// import 'package:alkebulan/Utils/Mediaquery%20Sizer.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class ProfileTabContent extends StatelessWidget {
//   final int selectedTab;
//   ProfileTabContent(this.selectedTab);

//   final ProfileController controller = Get.find();

//   @override
//   Widget build(BuildContext context) {
//     List<String> content;
//     switch (selectedTab) {
//       case 0:
//         content = controller.user.value.uploads;
//         break;
//       case 1:
//         content = controller.user.value.bookmarks;
//         break;
//       case 2:
//         content = controller.user.value.likes;
//         break;
//       default:
//         content = [];
//     }

//     return content.isEmpty
//         ? Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   "No ${selectedTab == 0 ? 'Uploads' : selectedTab == 1 ? 'Bookmarks' : 'Likes'} Yet",
//                   style: TextStyle(
//                     fontSize: MediaQueryHelper.fontSize(context, 0.05),
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: MediaQueryHelper.height(context, 0.01)),
//                 Text(
//                   "Start adding some content here!",
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontSize: MediaQueryHelper.fontSize(context, 0.04),
//                     color: Colors.grey,
//                   ),
//                 ),
//               ],
//             ),
//           )
//         : ListView.builder(
//             itemCount: content.length,
//             itemBuilder: (context, index) {
//               return ListTile(
//                 title: Text(content[index]),
//               );
//             },
//           );
//   }
// }
