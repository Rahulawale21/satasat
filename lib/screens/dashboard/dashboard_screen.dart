import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:satasat_app/constant/colors.dart';
import 'package:satasat_app/constant/constants.dart';
import 'package:satasat_app/screens/dashboard/widgets/row_cards.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool showAll = false;
  List<String> items = [
    "Item 1",
    "Item 2",
    "Item 3",
    "Item 4",
    "Item 5",
    "Item 6",
    "Item 7",
    "Item 8",
    "Item 9",
    "Item 10",
    "Item 11",
    "Item 12",
  ];

  @override
  Widget build(BuildContext context) {
    List<String> displayedItems = showAll ? items.sublist(0, 4) : items;
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        toolbarHeight: 100,
        centerTitle: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Hello, Rahul",
              style: TextStyle(fontFamily: "Poppins", fontSize: 24),
            ),
            Text("Welcome to Satasat",
                style: GoogleFonts.robotoSlab(
                    color: Colors.black26,
                    fontSize: 16,
                    fontWeight: FontWeight.normal)),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              radius: 30,
              child: Image.asset("assets/icons/default.png"),
            ),
          )
        ],
      ),
      body: ListView(
        padding: horizontalPadding,
        children: [
          const RowCards(),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Categories",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              TextButton(
                onPressed: () {
                  showAll = !showAll;
                  setState(() {});
                },
                child: Text(
                  !showAll ? "Show less" : "Show All",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              )
            ],
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 1.6,
            ),
            itemCount: displayedItems.length,
            itemBuilder: (context, index) {
              return Chip(
                backgroundColor: blackColor,
                label: Text(
                  displayedItems[index],
                  style: const TextStyle(color: Colors.white),
                ),
              );
            },
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Products",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ],
      ),
    );
  }
}
