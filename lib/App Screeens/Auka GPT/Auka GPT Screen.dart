import 'package:alkebulan/App%20Screeens/Auka%20GPT/ChatScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AukaGPTScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: screenWidth * 0.05,
              right: screenWidth * 0.05,
              top: screenHeight * 0.08,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(Icons.arrow_back)),
                Text(
                  "Akua GPT",
                  style: TextStyle(
                    fontSize: screenWidth * 0.06,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                GestureDetector(
                    onTap: () {
                      Get.toNamed('/settings');
                    },
                    child: Icon(Icons.settings_outlined)),
              ],
            ),
          ),
          Spacer(),
          Text("Welcome",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          SizedBox(height: screenHeight * 0.01),
          Text("Ask anything, get your answer",
              style: TextStyle(color: Colors.grey)),
          SizedBox(height: screenHeight * 0.01),
          _buildOptionsGrid(),
          SizedBox(height: screenHeight * 0.02),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
            child: Text(
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                "Akua can make mistakes. Consider checking important information.",
                style: TextStyle(color: Colors.grey)),
          ),
          SizedBox(height: screenHeight * 0.05),
        ],
      ),
    );
  }

  Widget _buildOptionsGrid() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        crossAxisSpacing: 8,
        mainAxisSpacing: 10,
        children: [
          _buildOption("Trending Topics", 'assets/icons/book.svg', () {}),
          _buildOption("Latest News", 'assets/icons/folder.svg', () {}),
          _buildOption("Quick Facts", 'assets/icons/star.svg', () {}),
          _buildOption("Let's Chat", 'assets/icons/sms.svg', () {
            Get.to(() => ChatScreen());
          }),
        ],
      ),
    );
  }

  Widget _buildOption(String title, String imagePath, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: 0,
                  blurRadius: 1)
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              imagePath,
              width: 25,
              height: 22,
              fit: BoxFit.contain,
              color: Color.fromRGBO(0, 135, 255, 1),
            ),
            SizedBox(height: 10),
            Text(title),
          ],
        ),
      ),
    );
  }
}

// import 'package:alkebulan/App%20Screeens/Auka%20GPT/ChatScreen.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class AukaGPTScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;
//     double screenHeight = MediaQuery.of(context).size.height;

//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Column(
//         children: [
//           Padding(
//             padding: EdgeInsets.only(
//               left: screenWidth * 0.05,
//               right: screenWidth * 0.05,
//               top: screenHeight * 0.08,
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 GestureDetector(
//                     onTap: () {
//                       Get.back();
//                     },
//                     child: Icon(Icons.arrow_back)),
//                 Text(
//                   "Akua",
//                   style: TextStyle(
//                     fontSize: screenWidth * 0.06,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                   ),
//                 ),
//                 GestureDetector(
//                     onTap: () {
//                       Get.toNamed('/settings');
//                     },
//                     child: Icon(Icons.settings_outlined)),
//               ],
//             ),
//           ),
//           Spacer(),
//           Text("Welcome",
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
//           SizedBox(height: screenHeight * 0.01),
//           Text("Ask anything, get your answer",
//               style: TextStyle(color: Colors.grey)),
//           SizedBox(height: screenHeight * 0.01),
//           _buildOptionsGrid(),
//           SizedBox(height: screenHeight * 0.02),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
//             child: Text(
//                 textAlign: TextAlign.center,
//                 maxLines: 2,
//                 overflow: TextOverflow.ellipsis,
//                 "Akua can make mistakes. Consider checking important information.",
//                 style: TextStyle(color: Colors.grey)),
//           ),
//           SizedBox(height: screenHeight * 0.05),
//         ],
//       ),
//     );
//   }

//   Widget _buildOptionsGrid() {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 20),
//       child: GridView.count(
//         crossAxisCount: 2,
//         shrinkWrap: true,
//         crossAxisSpacing: 8,
//         mainAxisSpacing: 10,
//         children: [
//           _buildOption("Trending Topics", Icons.article, () {}),
//           _buildOption("Latest News", Icons.menu_book, () {}),
//           _buildOption("Quick Facts", Icons.add, () {}),
//           _buildOption("Let's Chat", Icons.chat, () {
//             Get.to(() => ChatScreen());
//           }),
//         ],
//       ),
//     );
//   }

//   Widget _buildOption(String title, IconData icon, VoidCallback onTap) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(10),
//             boxShadow: [
//               BoxShadow(
//                   color: Colors.black.withOpacity(0.5),
//                   spreadRadius: 0,
//                   blurRadius: 1)
//             ]),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(icon, size: 30, color: Colors.blue),
//             SizedBox(height: 10),
//             Text(title),
//           ],
//         ),
//       ),
//     );
//   }
// }
