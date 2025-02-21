import 'package:alkebulan/Utils/Mediaquery%20Sizer.dart';
import 'package:flutter/material.dart';

class SettingsSection extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const SettingsSection(
      {super.key, required this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title.isNotEmpty)
          Padding(
            padding: EdgeInsets.only(
              left: MediaQueryHelper.width(context, 0.05),
              top: MediaQueryHelper.height(context, 0.01),
            ),
            child: Text(
              title,
              style: TextStyle(
                fontSize: MediaQueryHelper.fontSize(context, 0.045),
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ),
        ...children,
      ],
    );
  }
}

class SettingsItem extends StatelessWidget {
  final String title;
  final bool showArrow;
  final bool isDestructive;
  final VoidCallback onTap;

  SettingsItem({
    required this.title,
    this.showArrow = false,
    this.isDestructive = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: MediaQueryHelper.height(context, 0.014),
          horizontal: MediaQueryHelper.width(context, 0.05),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: MediaQueryHelper.fontSize(context, 0.045),
                color: isDestructive ? Colors.red : Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
            if (showArrow)
              Icon(Icons.arrow_forward_ios, size: 12, color: Colors.black),
          ],
        ),
      ),
    );
  }
}
