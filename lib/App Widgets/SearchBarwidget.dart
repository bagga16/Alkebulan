import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
      child: Container(
        height: screenHeight * 0.06,
        decoration: BoxDecoration(
          color: Color.fromRGBO(241, 241, 241, 1),
          borderRadius: BorderRadius.circular(11),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
          child: Row(
            children: [
              Icon(Icons.search, color: Color.fromRGBO(154, 154, 154, 1)),
              SizedBox(width: screenWidth * 0.02),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                      hintText: "search",
                      border: InputBorder.none,
                      hintStyle:
                          TextStyle(color: Color.fromRGBO(154, 154, 154, 1))),
                  style: TextStyle(color: Color.fromRGBO(154, 154, 154, 1)),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed('aukaGPT');
                },
                child: Image.asset(
                  'assets/images/search.png',
                  // height: screenHeight * 0.04,
                  // //width: screenWidth * 0.1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
