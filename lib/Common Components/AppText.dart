import 'package:alkebulan/Utils/Mediaquery%20Sizer.dart';
import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final TextAlign textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final VoidCallback? onTap;

  const AppText({
    Key? key,
    required this.text,
    this.fontSize = 4,
    this.fontWeight = FontWeight.w500,
    this.color = const Color.fromRGBO(84, 84, 84, 1),
    this.textAlign = TextAlign.start,
    this.maxLines,
    this.overflow,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
        style: TextStyle(
          fontSize: MediaQueryHelper.fontSize(context, fontSize / 100),
          fontWeight: fontWeight,
          color: color,
        ),
      ),
    );
  }
}
