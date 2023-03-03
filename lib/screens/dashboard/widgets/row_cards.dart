import 'package:flutter/material.dart';

import '../../../constant/colors.dart';
import 'display_container.dart';

class RowCards extends StatelessWidget {
  const RowCards({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        DisplayContainer(
          count: '20',
          image: "assets/icons/exchange.png",
          title: 'Exchanged products',
          color: blackColor,
          containerColor: Colors.black12,
        ),
        SizedBox(
          width: 20,
        ),
        DisplayContainer(
          count: '20',
          image: "assets/icons/listed.png",
          title: 'Exchanged products',
          color: scaffoldBackgroundColor,
          containerColor: blackColor,
        ),
      ],
    );
  }
}
