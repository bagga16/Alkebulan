import 'package:alkebulan/App%20Widgets/CategoryGrid.dart';
import 'package:alkebulan/App%20Widgets/SearchBarwidget.dart';
import 'package:alkebulan/App%20Widgets/TopStoriesWidget.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(height: screenHeight * 0.04),

            // Search Bar
            SearchBarWidget(),
            SizedBox(height: screenHeight * 0.025),

            // Top Stories
            TopStoriesWidget(),
            SizedBox(height: screenHeight * 0.03),

            // Categories Grid
            CategoryGrid(),
          ],
        ),
      ),
    );
  }
}
