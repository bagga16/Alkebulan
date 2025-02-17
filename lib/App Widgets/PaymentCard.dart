import 'package:flutter/material.dart';

class PaymentCard extends StatelessWidget {
  final String title;
  final String? price;
  final List<String> features;
  final bool isMostPopular;
  final bool isFree;

  const PaymentCard({
    Key? key,
    required this.title,
    required this.price,
    required this.features,
    this.isMostPopular = false,
    this.isFree = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: screenWidth * 0.63,
      margin: EdgeInsets.all(screenWidth * 0.03),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            spreadRadius: 0,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Plan Title
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: screenHeight * 0.025),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: const LinearGradient(
                colors: [Colors.blueAccent, Colors.white],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: screenWidth * 0.045,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                if (!isFree)
                  Text(
                    price!,
                    style: TextStyle(
                      fontSize: screenWidth * 0.025,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
              ],
            ),
          ),
          SizedBox(height: screenHeight * 0.02),

          // Features List
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: features
                .map((feature) => Padding(
                      padding: EdgeInsets.only(
                          bottom: screenHeight * 0.005,
                          left: screenWidth * 0.035),
                      child: Text(
                        "• $feature",
                        style: TextStyle(fontSize: screenWidth * 0.035),
                      ),
                    ))
                .toList(),
          ),

          // Most Popular Tag
          if (isMostPopular)
            Align(
              alignment: Alignment.center,
              child: Container(
                margin: EdgeInsets.only(top: screenHeight * 0.02),
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.05,
                  vertical: screenHeight * 0.006,
                ),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  "Most Popular",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenWidth * 0.03,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
