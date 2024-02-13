import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:weperch/components/txt.dart';
import 'package:weperch/utils/colors.dart';

class Shops extends StatefulWidget {
  const Shops({super.key});

  @override
  State<Shops> createState() => _ShopsState();
}

class _ShopsState extends State<Shops> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Row(
            children: [
              BTxt(
                text: "Reels",
                colors: Colors.blueGrey.shade600,
                size: 18,
              ),
              const SizedBox(
                width: 8,
              ),
              const Icon(
                CupertinoIcons.square_stack_fill,
                color: ProjectColors.brightOrange,
              )
            ],
          ),
        ),
        const Expanded(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Reel(),
          ),
        )
      ],
    );
  }
}

class Reel extends StatefulWidget {
  const Reel({super.key});

  @override
  State<Reel> createState() => _ReelState();
}

class _ReelState extends State<Reel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: ProjectColors.black, borderRadius: BorderRadius.circular(13)),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 21),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 40,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 40,
                                  // height: 60,
                                  decoration: BoxDecoration(
                                      color: ProjectColors.white,
                                      borderRadius: BorderRadius.circular(10)),
                                ), // TODO: Placeholder for product image

                                const SizedBox(
                                  width: 10,
                                ),
                                const Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Txt(
                                        text:
                                            "Cool Vitage Men's Shirt"), // Name of product
                                    Txt(text: "Location: Nkpor Anambra")
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 9,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: ProjectColors.white,
                                    borderRadius: BorderRadius.circular(20)),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 2.4),
                                child: const Txt(
                                  text: "N 4500",
                                  weight: FontWeight.bold,
                                  colors: ProjectColors.brightOrange,
                                ), // Price here
                              ),
                              const SizedBox(
                                width: 7,
                              ),
                              const Txt(text: "20 Remaining")
                            ],
                          ),
                        ],
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: ProjectColors.white,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Txt(text: "KadriStore"),
                              SizedBox(
                                width: 7,
                              ),
                              Icon(
                                Icons.check_circle_sharp,
                                color: ProjectColors.brightOrange,
                                size: 12,
                              )
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.star,
                                color: ProjectColors.brightOrange,
                                size: 14,
                              ),
                              Txt(
                                text: "5.0",
                                size: 12,
                              ) //Ratings
                            ],
                          ),
                        ], // TODO: Shop pfp heres
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ProjectColors.darkBlue,
                        foregroundColor: ProjectColors.primaryBlue,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        fixedSize: const Size.fromWidth(300),
                      ),
                      onPressed: () {
                        //TODO: Add to cart functionality
                      },
                      child: const Txt(
                        text: "Add to Cart",
                        size: 19,
                        weight: FontWeight.bold,
                      ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
