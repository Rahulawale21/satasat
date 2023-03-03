import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:satasat_app/constant/colors.dart';
import 'package:satasat_app/screens/dashboard/dashboard_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  List screens = [
    const DashboardScreen(),
    const DashboardScreen(),
    const DashboardScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_currentIndex],
      // extendBody: true,
      bottomNavigationBar: FloatingNavbar(
        borderRadius: 25,
        itemBorderRadius: 25,
        backgroundColor: blackColor,
        selectedItemColor: blackColor,
        margin: EdgeInsets.zero,
        onTap: (int val) {
          setState(() {
            _currentIndex = val;
          });
        },
        currentIndex: _currentIndex,
        items: [
          FloatingNavbarItem(icon: CupertinoIcons.home),
          FloatingNavbarItem(icon: CupertinoIcons.arrow_up_arrow_down),
          FloatingNavbarItem(icon: CupertinoIcons.bell),
        ],
      ),
    );
  }
}
