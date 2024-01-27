import 'package:flutter/material.dart';
import 'package:weperch/components/input.dart';
import 'package:weperch/components/txt.dart';
import 'package:weperch/utils/colors.dart';
import 'package:weperch/utils/fonts.dart';
import 'package:weperch/utils/image_link.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  int index = 0;
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController country = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Color phoneColor() {
      if (index == 0) {
        return ProjectColors.primaryBlue;
      } else {
        return Colors.white;
      }
    }

    Color phoneColorBorder() {
      if (index == 0) {
        return ProjectColors.primaryBlue;
      } else {
        return Colors.transparent;
      }
    }

    Color emailColorBorder() {
      if (index == 1) {
        return ProjectColors.primaryBlue;
      } else {
        return Colors.transparent;
      }
    }

    Color emailColor() {
      if (index == 1) {
        return ProjectColors.primaryBlue;
      } else {
        return Colors.white;
      }
    }

    List<Widget> inputScreens = [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex: 1,
            child: Input(
              maxChar: 3,
              placeholder: "Country",
              controller: country,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Flexible(
            flex: 2,
            child: Input(
              placeholder: "Phone number",
              controller: phoneNumber,
            ),
          ),
        ],
      ),
      Input(
        placeholder: "Email",
        controller: email,
      )
    ];
    return Scaffold(
      backgroundColor: ProjectColors.black,
      appBar: AppBar(
        backgroundColor: ProjectColors.black,
      ),
      body: Stack(
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
          // Main screen
          // ignore: sized_box_for_whitespace
          Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Txt(
                    text: "Forgot Password?",
                    size: 26,
                    weight: FontWeight.bold,
                    fontFamily: clashdisplayFontName,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Txt(
                    text: "Let's reset!",
                    size: 26,
                    weight: FontWeight.bold,
                    fontFamily: clashdisplayFontName,
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 170,
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 3.2, color: phoneColorBorder()))),
                      child: TextButton(
                          onPressed: () {
                            setState(() {
                              index = 0;
                            });
                          },
                          style: TextButton.styleFrom(),
                          child: Txt(
                            text: "Phone Number",
                            size: 20,
                            weight: FontWeight.bold,
                            colors: phoneColor(),
                          )),
                    ),
                    Container(
                      width: 170,
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 3.2, color: emailColorBorder()))),
                      child: TextButton(
                          onPressed: () {
                            setState(() {
                              index = 1;
                            });
                          },
                          style: TextButton.styleFrom(),
                          child: Txt(
                            text: "Email",
                            size: 20,
                            weight: FontWeight.bold,
                            colors: emailColor(),
                          )),
                    )
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 26),
                  child: inputScreens[index],
                )
              ],
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
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
                          padding: const EdgeInsets.symmetric(vertical: 15.6),
                          fixedSize: Size.fromWidth(
                              MediaQuery.of(context).size.width)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CodeEnter()));
                      },
                      child: const Txt(
                        text: "Reset",
                        size: 22,
                      )),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CodeEnter extends StatelessWidget {
  const CodeEnter({super.key});
  @override
  Widget build(BuildContext context) {
    TextEditingController code = TextEditingController();
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
                      text: "Enter the code sent to your (number)",
                      size: 29,
                      weight: FontWeight.bold,
                      fontFamily: clashdisplayFontName,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    OutlineInput(placeholder: "Code", controller: code),
                    const SizedBox(height: 19),
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
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const NewPwd()));
                          },
                          child: const Txt(
                            text: "Continue",
                            size: 22,
                          )),
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

class NewPwd extends StatelessWidget {
  const NewPwd({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController pwd = TextEditingController();
    TextEditingController rePwd = TextEditingController();
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
                      text: "Enter new password",
                      size: 29,
                      weight: FontWeight.bold,
                      fontFamily: clashdisplayFontName,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    OutlineInput(placeholder: "New Password", controller: pwd),
                    const SizedBox(height: 19),
                    OutlineInput(
                        placeholder: "Confirm New Password", controller: rePwd),
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
