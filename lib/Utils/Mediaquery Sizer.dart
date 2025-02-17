import 'package:flutter/material.dart';

class MediaQueryHelper {
  static double width(BuildContext context, double value) {
    return MediaQuery.of(context).size.width * value;
  }

  static double height(BuildContext context, double value) {
    return MediaQuery.of(context).size.height * value;
  }

  static double fontSize(BuildContext context, double value) {
    return MediaQuery.of(context).size.width * value;
  }
}
