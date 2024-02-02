import 'package:flutter/material.dart';
import 'package:weperch/components/txt.dart';

class Shops extends StatefulWidget {
  const Shops({super.key});

  @override
  State<Shops> createState() => _ShopsState();
}

class _ShopsState extends State<Shops> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: BTxt(
        text: "Shop",
      ),
    );
  }
}
