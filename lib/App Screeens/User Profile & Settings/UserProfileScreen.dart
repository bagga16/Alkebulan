import 'package:alkebulan/App%20Widgets/BookMarkItem%20&%20LikeItem.dart';
import 'package:alkebulan/Controllers/UserProfileController.dart';
import 'package:alkebulan/Utils/Mediaquery%20Sizer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  final ProfileController controller = Get.put(ProfileController());

  ProfileScreen({super.key});

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
              top: screenHeight * 0.08,
              bottom: screenHeight * 0.007,
            ),
            child: Row(
              children: [
                Text(
                  "Kofi",
                  style: TextStyle(
                    fontSize: MediaQueryHelper.fontSize(context, 0.06),
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          // Tabs
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _tabItem(context, "uploads", 0),
                _tabItem(context, "bookmarks", 1),
                _tabItem(context, "likes", 2),
                Spacer(),
                Icon(Icons.add,
                    color: Colors.black,
                    size: MediaQueryHelper.width(context, 0.07)),
                SizedBox(width: MediaQueryHelper.width(context, 0.01)),
                GestureDetector(
                  onTap: () {
                    Get.toNamed('settings');
                  },
                  child: Icon(
                    Icons.settings_outlined,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQueryHelper.height(context, 0.02)),

          // Content Area
          // Expanded(child: Obx(() {
          //   return controller.selectedTab.value == 1
          //       ? _bookmarksTab()
          //       : _likesTab();
          // })),
          Expanded(child: Obx(() {
            if (controller.selectedTab.value == 0) {
              return _uploadsTab();
            } else if (controller.selectedTab.value == 1) {
              return _bookmarksTab();
            } else {
              return _likesTab();
            }
          })),
        ],
      ),
    );
  }

  Widget _tabItem(BuildContext context, String title, int index) {
    return GestureDetector(
      onTap: () => controller.changeTab(index),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQueryHelper.width(context, 0.02)),
        child: Obx(() => Text(
              title,
              style: TextStyle(
                fontSize: MediaQueryHelper.fontSize(context, 0.045),
                fontWeight: controller.selectedTab.value == index
                    ? FontWeight.bold
                    : FontWeight.normal,
                decoration: controller.selectedTab.value == index
                    ? TextDecoration.underline
                    : TextDecoration.none,
                color: controller.selectedTab.value == index
                    ? Colors.black
                    : Colors.grey,
              ),
            )),
      ),
    );
  }

// Uploads Tab
  Widget _uploadsTab() {
    return Obx(() {
      if (controller.uploads.isEmpty) {
        return Center(
          child: Text(
            "No uploads yet,\nShare your first upload to get started",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: MediaQueryHelper.fontSize(Get.context!, 0.045),
              color: const Color.fromARGB(255, 105, 103, 103),
            ),
          ),
        );
      } else {
        return GridView.builder(
          padding: EdgeInsets.all(MediaQueryHelper.width(Get.context!, 0.03)),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 7,
            mainAxisSpacing: 12,
          ),
          itemCount: controller.uploads.length,
          itemBuilder: (context, index) {
            return LikeItem(like: controller.uploads[index]);
          },
        );
      }
    });
  }

  Widget _bookmarksTab() {
    return Obx(() => ListView.builder(
          itemCount: controller.bookmarks.length,
          itemBuilder: (context, index) {
            return BookmarkItem(bookmark: controller.bookmarks[index]);
          },
        ));
  }

  Widget _likesTab() {
    return Obx(() => GridView.builder(
          padding: EdgeInsets.all(10),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 7,
            mainAxisSpacing: 12,
          ),
          itemCount: controller.likes.length,
          itemBuilder: (context, index) {
            return LikeItem(like: controller.likes[index]);
          },
        ));
  }
}
