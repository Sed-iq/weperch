import "package:flutter/material.dart";
import "package:weperch/screens/home.dart"; // Remove when done
import "package:weperch/screens/splash.dart";

void main() {
  runApp(const MaterialApp(
    title: "Weperch",
    color: Colors.black,

    debugShowCheckedModeBanner: false,
    home: HomePage(), // Testing
  ));
}
