// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:weperch/components/txt.dart';
import 'package:weperch/screens/liveshows.dart';
import 'package:weperch/screens/shops.dart';
import 'package:weperch/utils/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  int topIndex = 0;
  List<Widget> BaseScreens = [const Shops(), const LiveShows()];
  List<Widget> TopElements = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectColors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
        titleSpacing: 0,
        title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  // TODO: initiate the slider from here
                },
                child: Ink(
                  height: 40,
                  width: 37,
                  decoration: const BoxDecoration(
                      color: ProjectColors.primaryBlue,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(8),
                          bottomRight: Radius.circular(8))),
                  child: const Icon(
                    Icons.more_vert,
                    size: 40,
                  ),
                ),
              ),
              Row(
                children: [
                  TextButton(
                      onPressed: () {
                        setState(() {
                          index = 0;
                        });
                      },
                      style: OutlinedButton.styleFrom(
                          side: BorderSide(
                            color: (index == 0)
                                ? Colors.black
                                : Colors.transparent,
                            width: 1.6,
                          ),
                          shape: LinearBorder.bottom()),
                      child: Txt(
                          text: "Shops",
                          size: 20,
                          colors: (index == 0) ? Colors.black : Colors.grey)),
                  const SizedBox(
                    width: 10,
                  ),
                  TextButton(
                      onPressed: () {
                        setState(() {
                          index = 1;
                        });
                      },
                      style: OutlinedButton.styleFrom(
                          side: BorderSide(
                            color: (index == 1)
                                ? Colors.black
                                : Colors.transparent,
                            width: 1.6,
                          ),
                          shape: LinearBorder.bottom()),
                      child: Txt(
                          text: "Live Shows",
                          size: 20,
                          colors: (index == 1) ? Colors.black : Colors.grey)),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(122, 156, 205, 238),
                          borderRadius: BorderRadius.circular(40)),
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Bootstrap.cart_check_fill,
                            color: ProjectColors.primaryBlue,
                          )),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(122, 156, 205, 238),
                          borderRadius: BorderRadius.circular(40)),
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            BoxIcons.bxs_bell_ring,
                            color: ProjectColors.primaryBlue,
                          )),
                    )
                  ],
                ),
              ),
            ]),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        style: TextButton.styleFrom(
                            foregroundColor: ProjectColors.brightOrange,
                            backgroundColor: (topIndex == 0)
                                ? Color.fromARGB(94, 255, 231, 180)
                                : Colors.transparent),
                        onPressed: () {
                          setState(() {
                            topIndex = 0;
                          });
                        },
                        child: Row(
                          children: [
                            Txt(
                              text: "Popular Shows",
                              size: 16,
                              colors:
                                  (topIndex == 0) ? Colors.black : Colors.grey,
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            const Icon(
                              EvaIcons.video_outline,
                              size: 23,
                              color: Colors.amber,
                            )
                          ],
                        )),
                    Container(
                        height: 21,
                        width: 90,
                        child: TextButton(
                          style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              backgroundColor:
                                  Color.fromARGB(98, 165, 218, 255)),
                          onPressed: () {},
                          child: Divider(
                            indent: 10,
                            endIndent: 10,
                            color: ProjectColors.primaryBlue,
                            height: 4,
                            thickness: 3,
                          ),
                        )),
                    TextButton(
                        style: TextButton.styleFrom(
                            foregroundColor: ProjectColors.brightOrange,
                            backgroundColor: (topIndex == 1)
                                ? Color.fromARGB(94, 255, 231, 180)
                                : Colors.transparent),
                        onPressed: () {
                          setState(() {
                            topIndex = 1;
                          });
                        },
                        child: Row(
                          children: [
                            Txt(
                              text: "Auctions",
                              size: 16,
                              colors:
                                  (topIndex == 1) ? Colors.black : Colors.grey,
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            const Icon(
                              EvaIcons.people,
                              size: 23,
                              color: Colors.amber,
                            )
                          ],
                        ))
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      MiniLive(
                        streamers: 20,
                        owner: "Sediq",
                      ),
                      MiniLive(
                        streamers: 14,
                        owner: "Micheal",
                      ),
                      MiniLive(
                        streamers: 0,
                        owner: "Alexis",
                      ),
                      MiniLive(
                        streamers: 4,
                        owner: "Sediq",
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          // BaseScreens[index],
        ],
      ),
    );
  }
}

class MiniLive extends StatelessWidget {
  final int streamers;
  final String owner;
  const MiniLive({super.key, required this.streamers, required this.owner});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      width: 155,
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color: ProjectColors.black, borderRadius: BorderRadius.circular(10)),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(20)),
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Txt(
                  text: "Live: $streamers",
                  weight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Txt(
                    text: "Sneakers",
                    weight: FontWeight.bold,
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 8,
                        backgroundColor:
                            ProjectColors.brightOrange, // TODO: Swap with pfp
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Txt(text: owner)
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
