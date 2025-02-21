import 'package:alkebulan/Common%20Components/CommonButton.dart';
import 'package:alkebulan/Common%20Components/CustomTextField.dart';
import 'package:alkebulan/Utils/Mediaquery%20Sizer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditInfoDialog extends StatelessWidget {
  final TextEditingController displayNameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();

  EditInfoDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.all(MediaQueryHelper.width(context, 0.09)),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(MediaQueryHelper.width(context, 0.05)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Profile Picture Placeholder
            CircleAvatar(
              radius: MediaQueryHelper.width(context, 0.08),
              backgroundColor: Colors.grey[300],
              child: Icon(Icons.person,
                  size: MediaQueryHelper.height(context, 0.045),
                  color: Colors.white),
            ),
            SizedBox(height: MediaQueryHelper.height(context, 0.025)),

            // Title
            Text(
              "Enter your name",
              style: TextStyle(
                  fontSize: MediaQueryHelper.fontSize(context, 0.05),
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: MediaQueryHelper.height(context, 0.005)),
            Text(
              "We will never display your full name",
              style: TextStyle(
                  fontSize: MediaQueryHelper.fontSize(context, 0.035),
                  color: Colors.black),
            ),
            SizedBox(height: MediaQueryHelper.height(context, 0.04)),

            // Text Fields
            _buildTextField(context, displayNameController, "Display Name"),
            SizedBox(height: MediaQueryHelper.height(context, 0.015)),
            _buildTextField(context, usernameController, "Username"),
            SizedBox(height: MediaQueryHelper.height(context, 0.04)),

            // Buttons
            CommonButton(
              text: "Save",
              onPressed: () => Get.back(),
            ),

            TextButton(
              onPressed: () => Get.back(),
              child: Text("Cancel",
                  style: TextStyle(fontSize: 16, color: Colors.black)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(
      BuildContext context, TextEditingController controller, String hintText) {
    return CommonTextField(hintText: hintText, controller: controller);
  }
}
