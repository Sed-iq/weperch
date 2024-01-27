import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
<<<<<<< HEAD
import 'package:weperch/screens/signin.dart';
import 'package:weperch/screens/signup.dart';
=======
>>>>>>> 36282542d0f91e72a6b8dfe5820f617d4f106c69

import '../components/landing_page_first.dart';
import '../utils/fonts.dart';
import '../utils/image_link.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _currentIndex = 0;
  final CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    List<Widget> slideItems = [
      Stack(
        alignment: AlignmentDirectional.center,
        fit: StackFit.expand,
        children: [
          Positioned(
            top: -300,
            right: -330,
            left: -310,
            bottom: -220,
            child: RotationTransition(
              turns: const AlwaysStoppedAnimation(45 / 360),
              child: Opacity(
                opacity: 0.3,
                child: Image.asset("$imageLink/brand_pattern.png"),
              ),
            ),
          ),
          // RotationTransition(
          //   turns: const AlwaysStoppedAnimation(45 / 360),
          //   child: Image.asset("$imageLink/brand_pattern.png"),
          // ),
          LandingPageFirst(
            screenWidth: screenWidth,
            screenHeight: screenHeight,
          ),
        ],
      ),
      Image.asset(
        "$imageLink/goLivepng.png",
        width: screenWidth / 2,
      ),
      Image.asset(
        "$imageLink/shopLivepng.png",
        width: screenWidth / 2,
      ),
      Image.asset(
        "$imageLink/doMorepng.png",
        width: screenWidth / 2,
      ),
    ];

    Map slidesText = {
      "bigText": "Go Live",
      "desc":
          "Drive more engagements by giving your customers live demos of products, items, or sevice usability with the in-store experience right on their smartphone.",
    };

    if (_currentIndex == 1) {
      slidesText["bigText"] = "Go Live";
      slidesText["desc"] =
          "Drive more engagements by giving your customers live demos of products, items, or sevice usability with the in-store experience right on their smartphone.";
    } else if (_currentIndex == 2) {
      slidesText["bigText"] = "Shop Live";
      slidesText["desc"] = "Explore Live demonstrations\nBuy on the go.";
    } else if (_currentIndex == 3) {
      slidesText["bigText"] = "Do More";
      slidesText["desc"] = "With the power of community, you get to do more!";
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        // mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: SizedBox(
              width: screenWidth,
              height: screenHeight,
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Visibility(
                    visible: _currentIndex == 0 ? false : true,
                    child: SizedBox(height: screenHeight * 0.036),
                  ),
                  CarouselSlider(
                    items: slideItems,
                    carouselController: _controller,
                    options: CarouselOptions(
                      // height: screenHeight,
                      // autoPlay: true,
                      aspectRatio: _currentIndex == 0 ? 0.68 : 1,
                      // aspectRatio: 1,
                      viewportFraction: _currentIndex >= 2 ? 0.5 : 1,
                      enlargeCenterPage: _currentIndex >= 2 ? true : false,
                      // enlargeCenterPage: true,
                      enableInfiniteScroll: false,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                    ),
                  ),
                  Visibility(
                    visible: _currentIndex == 0 ? false : true,
                    child: Column(
                      children: [
                        SizedBox(height: screenHeight * 0.015),
                        Text(
                          slidesText["bigText"],
                          style: const TextStyle(
                            color: Color(0xFFE2E2E2),
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.016),
                        SizedBox(
                          width: screenWidth * 0.95,
                          child: Text(
                            slidesText["desc"],
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              letterSpacing: .4,
                              color: Color(0xA4DEDEDE),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.025),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: slideItems.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => _controller.animateToPage(entry.key),
                child: Container(
                  width: 8.0,
                  height: 8.0,
                  margin: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.white)
                        .withOpacity(_currentIndex == entry.key ? 0.9 : 0.4),
                  ),
                ),
              );
            }).toList(),
          ),
          Expanded(
            child: Container(
              color: Colors.black,
              width: screenWidth * 0.9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      SizedBox(height: screenHeight * 0.01),
                      LandingPageLongButton(
                        screenHeight: screenHeight,
                        iconWidget: Container(
                          width: screenHeight * 0.036,
                          // height: 26,
                          height: screenHeight * 0.036,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: SvgPicture.asset(
                            "$imageLink/google.svg",
                            width: 15,
                          ),
                        ),
                        buttonText: "Continue with Google",
                      ),
                      SizedBox(height: screenHeight * 0.015),
                      LandingPageLongButton(
                        screenHeight: screenHeight,
                        // iconWidget: SvgPicture.asset(
                        //   "$imageLink/facebook.svg",
                        // width: screenHeight * 0.036,
                        // height: screenHeight * 0.036,
                        // ),
                        iconWidget: Icon(
                          Icons.facebook_rounded,
                          color: const Color(0xFF1877F2),
                          size: screenHeight * 0.036,
                        ),
                        buttonText: "Continue with Facebook",
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: screenHeight * 0.06,
                              child: OutlinedButton(
<<<<<<< HEAD
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const SignIn()));
                                },
=======
                                onPressed: () {},
>>>>>>> 36282542d0f91e72a6b8dfe5820f617d4f106c69
                                style: ButtonStyle(
                                  side: MaterialStateProperty.all(
                                    const BorderSide(color: Colors.white),
                                  ),
                                ),
                                child: const Center(
                                  child: Text(
                                    "Sign in",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: screenWidth * 0.06),
                          Expanded(
                            child: SizedBox(
                              height: screenHeight * 0.06,
                              child: TextButton(
<<<<<<< HEAD
                                onPressed: () {
                                  // Linker
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const Signup()));
                                },
=======
                                onPressed: () {},
>>>>>>> 36282542d0f91e72a6b8dfe5820f617d4f106c69
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.white),
                                ),
                                child: const Center(
                                  child: Text(
                                    "Sign Up",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: screenHeight * 0.003),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LandingPageLongButton extends StatelessWidget {
  const LandingPageLongButton({
    super.key,
    required this.screenHeight,
    required this.iconWidget,
    required this.buttonText,
  });

  final double screenHeight;
  final Widget iconWidget;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight * 0.056,
      child: OutlinedButton(
        onPressed: () {},
        style: ButtonStyle(
          side: MaterialStateProperty.all(
            const BorderSide(color: Colors.white),
          ),
        ),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            iconWidget,
            Expanded(
              child: Center(
                child: Text(
                  buttonText,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 17,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
