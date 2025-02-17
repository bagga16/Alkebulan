import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var isChecked = false.obs;

  void SignUp() async {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      Get.toNamed('/RFA');
    } else {
      Get.snackbar("Error", "Please fill in all fields.",
          backgroundColor: Colors.redAccent);
    }
  }
}
