import 'package:flutter/material.dart';

class DisplayContainer extends StatelessWidget {
  final String count;
  final String image;
  final String title;
  final Color containerColor;
  final Color color;

  const DisplayContainer({
    super.key,
    required this.count,
    required this.image,
    required this.title,
    required this.containerColor,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 150,
        decoration: BoxDecoration(
            color: containerColor, borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      count,
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 30,
                        color: color,
                      ),
                    ),
                    Image.asset(
                      image,
                      height: 40,
                      width: 40,
                      color: color,
                    ),
                  ],
                ),
              ),
              Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: color),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
