import 'package:flutter/material.dart';

class Input extends StatefulWidget {
  final double? width;
  final int? maxChar;
  final TextEditingController controller;
  final String placeholder;
  const Input(
      {super.key,
      this.width,
      this.maxChar,
      required this.placeholder,
      required this.controller});
  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLength: widget.maxChar,
      controller: widget.controller,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
              horizontal: widget.width ?? 20, vertical: 20),
          filled: true,
          hintText: widget.placeholder,
          hintStyle: const TextStyle(color: Colors.white),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(
                color: Colors.grey,
              )),
          fillColor: const Color.fromARGB(108, 78, 78, 78),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.grey))),
    );
  }
}

class OutlineInput extends StatefulWidget {
  final int? maxChar;
  final TextEditingController controller;
  final String placeholder;
  const OutlineInput(
      {super.key,
      this.maxChar,
      required this.placeholder,
      required this.controller});
  @override
  State<OutlineInput> createState() => _OutlineInputState();
}

class _OutlineInputState extends State<OutlineInput> {
  @override
  Widget build(BuildContext context) {
    return TextField(
        maxLength: widget.maxChar,
        controller: widget.controller,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 20),
          filled: true,
          hintText: widget.placeholder,
          hintStyle: const TextStyle(color: Colors.grey),
          enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey)),
          fillColor: Colors.transparent,
        ));
  }
}
