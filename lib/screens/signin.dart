import 'package:flutter/material.dart';
import 'package:weperch/components/input.dart';
import 'package:weperch/components/txt.dart';
import 'package:weperch/screens/forgot_password.dart';
import 'package:weperch/screens/signup.dart';
import 'package:weperch/utils/colors.dart';
import 'package:weperch/utils/fonts.dart';
import 'package:weperch/utils/image_link.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Stack(
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
              child: Image.asset(
                "$imageLink/brand_pattern.png",
              ),
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
          ),
          body: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 44),
                child: Column(
                  children: [
                    const WTxt(
                      text: "Let's get you",
                      size: 29,
                      weight: FontWeight.bold,
                      fontFamily: clashdisplayFontName,
                    ),
                    const WTxt(
                      text: "back in!",
                      size: 29,
                      fontFamily: clashdisplayFontName,
                      weight: FontWeight.bold,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    OutlineInput(
                        placeholder: "Email or Username", controller: email),
                    const SizedBox(height: 19),
                    OutlineInput(placeholder: "Password", controller: password),
                    const SizedBox(height: 19),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ForgotPassword()));
                      },
                      child: const WTxt(
                        text: "Forgot Password?",
                        colors: ProjectColors.primaryBlue,
                        weight: FontWeight.w700,
                        size: 17,
                      ),
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
                  color: Colors.transparent,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(9)),
                              backgroundColor: ProjectColors.primaryBlue,
                              padding:
                                  const EdgeInsets.symmetric(vertical: 15.6),
                              fixedSize: Size.fromWidth(
                                  MediaQuery.of(context).size.width)),
                          onPressed: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => const Step2()));
                          },
                          child: const Txt(
                            text: "Continue",
                            size: 22,
                          )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Txt(
                            text: "Don't have an account?",
                            weight: FontWeight.bold,
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Signup()));
                            },
                            child: const Txt(
                              text: "Sign up here",
                              colors: ProjectColors.primaryBlue,
                              weight: FontWeight.bold,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
