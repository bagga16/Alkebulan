// import 'package:flutter/material.dart';
import 'package:alkebulan/App%20Widgets/EdditInfoDialog.dart';
import 'package:alkebulan/Controllers/SettingsController.dart';
import 'package:alkebulan/Utils/Mediaquery%20Sizer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../App Widgets/Seetting Section & Items.dart';

class SettingsScreen extends StatelessWidget {
  final SettingsController controller = Get.put(SettingsController());

  SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: screenWidth * 0.05, top: screenHeight * 0.08, bottom: 3),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                    size: 20,
                  ),
                ),
                SizedBox(
                  width: screenWidth * 0.05,
                ),
                Text(
                  "Profile",
                  style: TextStyle(
                    fontSize: MediaQueryHelper.fontSize(context, 0.05),
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Divider(),
          Expanded(
            child: ListView(
              children: [
                SettingsSection(title: "General", children: [
                  SizedBox(
                    height: screenHeight * 0.015,
                  ),
                  SettingsItem(
                    title: "Edit Info",
                    onTap: () => controller.showEditInfoDialog(),
                  ),
                  Divider(),
                  SettingsItem(
                      title: "Help Center", showArrow: true, onTap: () {}),
                  Divider(),
                  SettingsItem(
                      title: "Manage Subscription",
                      showArrow: true,
                      onTap: () {}),
                  Divider(),
                  SettingsItem(
                      title: "Report a bug", showArrow: true, onTap: () {}),
                  Divider(),
                  SettingsItem(
                      title: "Share the app",
                      onTap: () => controller.showShareBottomSheet(context)),
                ]),
                Divider(),
                SettingsItem(
                  title: "Log Out",
                  isDestructive: true,
                  onTap: () => controller.showLogoutDialog(),
                ),
                Divider(),
                SettingsSection(title: "Legal", children: [
                  SizedBox(
                    height: screenHeight * 0.015,
                  ),
                  SettingsItem(title: "Privacy and Terms", onTap: () {}),
                ]),
                Divider(),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: MediaQueryHelper.height(context, 0.014)),
            child: Column(
              children: [
                Text("V 1.0.00 (1670941736)",
                    style: TextStyle(color: Colors.grey, fontSize: 12)),
                SizedBox(height: 5),
                Text("© Alkebulan 2025. All rights reserved",
                    style: TextStyle(color: Colors.grey, fontSize: 12)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
