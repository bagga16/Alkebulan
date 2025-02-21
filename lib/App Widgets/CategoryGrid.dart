import 'package:flutter/material.dart';

class CategoryGrid extends StatelessWidget {
  final List<Map<String, String>> categories = [
    {"title": "Trending", "image": "assets/images/post.png"},
    {"title": "Business", "image": "assets/images/post.png"},
    {"title": "Entertainment", "image": "assets/images/post1.png"},
    {"title": "Technology", "image": "assets/images/post.png"},
    {"title": "Travel", "image": "assets/images/post.png"},
    {"title": "Ploitics", "image": "assets/images/post.png"},
    {"title": "Health & Wellness", "image": "assets/images/post1.png"},
    {"title": "Insights", "image": "assets/images/post.png"},
  ];

  CategoryGrid({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Explore by Category",
            style: TextStyle(
              fontSize: screenWidth * 0.045,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: screenHeight * 0.015),
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: categories.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: screenWidth * 0.03,
              mainAxisSpacing: screenHeight * 0.015,
              childAspectRatio: 1.6,
            ),
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                    image: AssetImage(categories[index]["image"]!),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    // color: Color.fromRGBO(255, 236, 137, 0.5).withOpacity(0.2),
                  ),
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: screenWidth * 0.04, bottom: screenWidth * 0.027),
                    child: Text(
                      categories[index]["title"]!,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenWidth * 0.04,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
