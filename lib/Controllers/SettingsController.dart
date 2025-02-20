import 'package:alkebulan/App%20Widgets/EdditInfoDialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  void navigateToScreen(Widget screen) {
    Get.to(() => screen);
  }

  void showShareBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
      ),
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(16),
          height: MediaQuery.of(context).size.height * 0.3,
          child: Column(
            children: [
              Text("Share this App",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Text("Invite friends to join and enjoy!",
                  textAlign: TextAlign.center),
              SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {
                  // Implement Share Logic
                  Get.back();
                },
                icon: Icon(Icons.share),
                label: Text("Share Now"),
              ),
            ],
          ),
        );
      },
    );
  }

  void showLogoutDialog() {
    Get.defaultDialog(
      contentPadding: EdgeInsets.all(20),
      backgroundColor: Colors.white,
      title: "Log Out",
      content: Text("Are you sure you want to log out?"),
      textConfirm: "Yes",
      textCancel: "Cancel",
      buttonColor: Colors.blue,
      confirmTextColor: Colors.white,
      onConfirm: () {
        // Perform logout action
        Get.back();
      },
    );
  }

  void showEditInfoDialog() {
    Get.dialog(EditInfoDialog());
  }
}
