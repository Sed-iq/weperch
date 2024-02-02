import 'package:flutter/material.dart';

class LiveShows extends StatefulWidget {
  const LiveShows({super.key});

  @override
  State<LiveShows> createState() => _LiveShowsState();
}

class _LiveShowsState extends State<LiveShows> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Live show screen"),
    );
  }
}
