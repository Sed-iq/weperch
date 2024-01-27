import 'package:flutter/material.dart';
import 'package:weperch/components/input.dart';
import 'package:weperch/components/txt.dart';
import 'package:weperch/screens/signin.dart';
import 'package:weperch/utils/colors.dart';
import 'package:weperch/utils/fonts.dart';
import 'package:weperch/utils/image_link.dart';
import 'package:pinput/pinput.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
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

    String comp() {
      // For completing string
      if (index == 0) {
        return "What is your phone number?";
      } else {
        return "What is your email?";
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
              children: [
                Txt(
                  text: comp(),
                  size: 23,
                  weight: FontWeight.bold,
                  align: TextAlign.center,
                  fontFamily: clashdisplayFontName,
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
                                builder: (context) => const Step2()));
                      },
                      child: const Txt(
                        text: "Continue",
                        size: 22,
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Txt(
                        text: "Already have an account?",
                        weight: FontWeight.bold,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignIn()));
                        },
                        child: const Txt(
                          text: "Sign in here",
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
    );
  }
}

class Step2 extends StatefulWidget {
  const Step2({super.key});
  @override
  State<Step2> createState() => _Step2State();
}

class _Step2State extends State<Step2> {
  TextEditingController pin = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectColors.black,
      appBar: AppBar(
        backgroundColor: ProjectColors.black,
        centerTitle: true,
        title: const Txt(
          text: "Signup",
          size: 23,
          weight: FontWeight.w600,
          align: TextAlign.center,
          fontFamily: clashdisplayFontName,
        ),
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
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const Txt(
                text: "Step 2 of 4",
                align: TextAlign.center,
                size: 18,
                weight: FontWeight.bold,
                colors: ProjectColors.primaryBlue,
              ),
              const SizedBox(
                height: 15,
              ),
              const Txt(
                text: "Enter your code",
                align: TextAlign.center,
                fontFamily: clashdisplayFontName,
                size: 23,
                weight: FontWeight.w500,
              ),
              const SizedBox(
                height: 15,
              ),
              const Txt(
                text: "We sent your code to (Number)",
                align: TextAlign.center,
                fontFamily: clashdisplayFontName,
                size: 21.4,
                weight: FontWeight.w500,
              ),
              const SizedBox(
                height: 15,
              ),
              Pinput(
                controller: pin,
              )
            ],
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
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Txt(
                        text: "Resend confirmation code in",
                        weight: FontWeight.bold,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Txt(
                        text: "00:00",
                        colors: ProjectColors.primaryBlue,
                        weight: FontWeight.bold,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 14,
                  ),
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
                                builder: (context) => const Step3()));
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
    );
  }
}

class Step3 extends StatefulWidget {
  const Step3({super.key});

  @override
  State<Step3> createState() => _Step3State();
}

class _Step3State extends State<Step3> {
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController rePassword = TextEditingController();
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
            centerTitle: true,
            title: const Txt(
              text: "Signup",
              size: 23,
              weight: FontWeight.w600,
              align: TextAlign.center,
              fontFamily: clashdisplayFontName,
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(mainAxisSize: MainAxisSize.max, children: [
                  const Txt(
                    text: "Step 3 of 4",
                    align: TextAlign.center,
                    size: 18,
                    weight: FontWeight.bold,
                    colors: ProjectColors.primaryBlue,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Expanded(
                            child: Text(
                          "Few more steps and you're ready to Go live!",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: clashdisplayFontName,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        )),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Expanded(
                            child: Text.rich(
                                textAlign: TextAlign.center,
                                TextSpan(
                                    text:
                                        "More about you so we can personalize your ",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                    ),
                                    children: [
                                      TextSpan(
                                          text: "weperch ",
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                              color:
                                                  ProjectColors.primaryBlue)),
                                      TextSpan(
                                          text: "experience",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 17,
                                          )),
                                    ])))
                        // ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Input(
                              placeholder: "First Name", controller: firstname),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Input(
                              placeholder: "Last Name", controller: lastname),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Input(
                              placeholder: "User Name", controller: username),
                        ),
                        const WTxt(
                          text:
                              "Your username is unique to you and will be used as your user-tag on the platfrom",
                          colors: ProjectColors.primaryBlue,
                          size: 19.2,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Input(
                              placeholder: "Password", controller: password),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Input(
                              placeholder: "Confirm password",
                              controller: rePassword),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ]),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
                  color: Colors.transparent,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Txt(
                            text: "Resend confirmation code in",
                            weight: FontWeight.bold,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Txt(
                            text: "00:00",
                            colors: ProjectColors.primaryBlue,
                            weight: FontWeight.bold,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 14,
                      ),
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
                                    builder: (context) => const Step4()));
                          },
                          child: const Txt(
                            text: "Continue",
                            size: 22,
                          )),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class Step4 extends StatefulWidget {
  const Step4({super.key});

  @override
  State<Step4> createState() => _Step4State();
}

class _Step4State extends State<Step4> {
  TextEditingController pin = TextEditingController();
  TextEditingController pin2 = TextEditingController();
  int index = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectColors.black,
      appBar: AppBar(
        backgroundColor: ProjectColors.black,
        centerTitle: true,
        title: const Txt(
          text: "Signup",
          size: 23,
          weight: FontWeight.w600,
          align: TextAlign.center,
          fontFamily: clashdisplayFontName,
        ),
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
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const Txt(
                text: "Step 4 of 4",
                align: TextAlign.center,
                size: 18,
                weight: FontWeight.bold,
                colors: ProjectColors.primaryBlue,
              ),
              const SizedBox(
                height: 15,
              ),
              WTxt(
                text:
                    (index == 1) ? "Create a 4-digit PIN" : "Re enter your PIN",
                align: TextAlign.center,
                fontFamily: clashdisplayFontName,
                size: 24,
                weight: FontWeight.w800,
              ),
              const SizedBox(
                height: 15,
              ),
              const Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                      text: "This will work as your",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: clashdisplayFontName,
                          fontWeight: FontWeight.w500,
                          fontSize: 18),
                      children: [
                        TextSpan(
                          text: " weperch ",
                          style: TextStyle(
                              color: ProjectColors.primaryBlue,
                              fontFamily: clashdisplayFontName,
                              fontWeight: FontWeight.w500,
                              fontSize: 18),
                        ),
                        TextSpan(
                            text: "transaction pin",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: clashdisplayFontName,
                                fontWeight: FontWeight.w500,
                                fontSize: 18)),
                      ])),
              const SizedBox(
                height: 15,
              ),
              (index == 1)
                  ? Pinput(
                      controller: pin,
                    )
                  : Pinput(
                      controller: pin2,
                    )
            ],
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
                        setState(() {
                          index = 2;
                        });
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => const Step3()));
                      },
                      child: const Txt(
                        text: "Continue",
                        size: 22,
                      )),
                  const SizedBox(
                    height: 14,
                  ),
                  (index == 1)
                      ? const Txt(
                          text: "Skip for now",
                          colors: ProjectColors.primaryBlue,
                          align: TextAlign.center,
                          fontFamily: clashdisplayFontName,
                          weight: FontWeight.w500,
                          size: 19,
                        )
                      : Container()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
