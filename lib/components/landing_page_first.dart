import 'package:flutter/material.dart';

import '../utils/fonts.dart';
import '../utils/image_link.dart';

class LandingPageFirst extends StatelessWidget {
  const LandingPageFirst({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
  });

  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Hero(
          tag: "logoHero",
          child: Image.asset(
            "$imageLink/logo.png",
            width: screenWidth / 2,
          ),
        ),
        SizedBox(height: screenHeight * 0.006),
        const Text(
          "weperch",
          style: TextStyle(
            fontFamily: clashdisplayFontName,
            color: Color(0xFFDEDEDE),
            fontSize: 44,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: screenHeight * 0.03),
        SizedBox(
          width: screenWidth * 0.9,
          child: const Text(
            "The best community marketplace to buy, sell, and go live!",
            textAlign: TextAlign.center,
            style: TextStyle(
              letterSpacing: .4,
              color: Color(0xA4DEDEDE),
              fontSize: 22,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
