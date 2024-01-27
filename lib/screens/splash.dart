import 'package:flutter/material.dart';

import '../utils/image_link.dart';
import 'landing_page.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..repeat(reverse: true);

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.fastOutSlowIn,
    );

    Future.delayed(
      const Duration(seconds: 5),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const LandingPage(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: ScaleTransition(
          scale: _animation,
          child: Hero(
<<<<<<< HEAD
=======
            
>>>>>>> 36282542d0f91e72a6b8dfe5820f617d4f106c69
            tag: "logoHero",
            child: Image.asset(
              "$imageLink/logo.png",
              width: screenWidth / 2,
            ),
          ),
        ),
      ),
    ); // Design from here
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
