// ignore_for_file: deprecated_member_use

import 'package:alkebulan/App%20Screeens/Home/HomeScreen.dart';
import 'package:alkebulan/App%20Screeens/Reels/Reels%20Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class DBNBPage extends StatefulWidget {
  const DBNBPage({super.key});

  @override
  State<DBNBPage> createState() => _DBNBPageState();
}

class _DBNBPageState extends State<DBNBPage> {
  int selectedIndex = 0;

  final _pages = [
    HomeScreen(),
    ReelsScreen(),
    ReelsScreen(),
    ReelsScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox.expand(
        child: Stack(
          children: [
            SizedBox(
              height: screenHeight,
              width: screenWidth,
              child: _pages[selectedIndex],
            ),
            Positioned(
              bottom: screenHeight * 0.01,
              left: 0,
              right: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: screenHeight * 0.1,
                    width: screenWidth * 0.9,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(.12),
                          blurRadius: 15,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(screenWidth * 0.02),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          tabs('assets/icons/home.svg', 0),
                          tabs('assets/icons/search.svg', 1),
                          tabs('assets/icons/play.svg', 2),
                          tabs('assets/icons/person.svg', 3),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget tabs(String icon, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(icon,
              color: index == selectedIndex ? Colors.blueAccent : Colors.grey),
        ],
      ),
    );
  }
}
