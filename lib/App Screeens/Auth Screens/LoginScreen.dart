import 'package:alkebulan/Common%20Components/CommonButton.dart';
import 'package:alkebulan/Common%20Components/CustomTextField.dart';
import 'package:alkebulan/Controllers/AuthController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  final AuthController controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.18),
              Text(
                "WelCome Back!",
                style: TextStyle(
                  fontSize: screenWidth * 0.06,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: screenHeight * 0.035),

              // Continue with Apple Button
              CommonButton(
                text: "Continue with Apple",
                buttonColor: Colors.black,
                onPressed: () {},
              ),
              SizedBox(height: screenHeight * 0.025),

              // Sign up with Google Button
              CommonButton(
                text: "Sign In with Google",
                onPressed: () {},
              ),
              SizedBox(height: screenHeight * 0.025),

              // Divider with OR
              Row(
                children: [
                  Expanded(child: Divider(color: Colors.grey)),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                    child: Text("OR", style: TextStyle(color: Colors.grey)),
                  ),
                  Expanded(child: Divider(color: Colors.grey)),
                ],
              ),
              SizedBox(height: screenHeight * 0.036),
              CommonTextField(
                hintText: "Email",
                controller: controller.emailController,
              ),

              SizedBox(height: screenHeight * 0.015),

              // Password Field
              CommonTextField(
                hintText: "Password",
                controller: controller.passwordController,
              ),
              SizedBox(height: screenHeight * 0.017),

              // Sign up with Email Button (Disabled if not checked)
              Obx(() => CommonButton(
                    text: "Sign In with email",
                    buttonColor: controller.isChecked.value
                        ? Colors.black
                        : Colors.grey.shade400,
                    onPressed: controller.isChecked.value
                        ? () {
                            controller.signUp();
                          }
                        : null,
                  )),
              SizedBox(height: screenHeight * 0.03),

              // Privacy Policy Text
              RichText(
                text: TextSpan(
                  text:
                      "To access all the features of our app, please review and agree to our ",
                  style: TextStyle(
                      color: Colors.black, fontSize: screenWidth * 0.03),
                  children: [
                    TextSpan(
                      text: "privacy policy",
                      style: TextStyle(color: Colors.blue),
                    ),
                    TextSpan(text: " and "),
                    TextSpan(
                      text: "terms of service.",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.012),

              // Agree Checkbox
              Row(
                children: [
                  Obx(() => Checkbox(
                        value: controller.isChecked.value,
                        onChanged: (value) {
                          controller.isChecked.value = value!;
                        },
                      )),
                  Text("I agree",
                      style: TextStyle(fontSize: screenWidth * 0.035)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
