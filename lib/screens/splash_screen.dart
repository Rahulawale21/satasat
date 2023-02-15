import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:satasat_app/constant/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const RiveAnimation.asset("assets/rive_assets/shapes.riv"),
          Positioned.fill(
              child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
            child: const SizedBox(),
          )),
          SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 300,
                  child: Text(
                    "Trade your way with Satasat",
                    style: TextStyle(
                      fontSize: 60,
                      fontFamily: "Poppins",
                      height: 1.2,
                      color: blackColor,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  "Satasat can be especially useful for users looking to declutter their homes, find unique items or gifts, or connect with others who share their interests.",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
