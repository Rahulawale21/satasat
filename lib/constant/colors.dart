import 'package:flutter/material.dart';

const Color primaryColor = Color(0xffF8E0E4);
const Color darkPrimaryColor = Color(0xffDAA6AF);
const Color scaffoldBackgroundColor = Color(0xffFFFFFF);
const Color buttonColor = Color(0xffEE7368);
const Color blackColor = Color(0xff2B2B2B);
const Color greyColor = Color(0xffE7E0E7);

Map<int, Color> primaryColorMap = {
  50: primaryColor.withOpacity(.1),
  100: primaryColor.withOpacity(.2),
  200: primaryColor.withOpacity(.3),
  300: primaryColor.withOpacity(.4),
  400: primaryColor.withOpacity(.5),
  500: primaryColor.withOpacity(.6),
  600: primaryColor.withOpacity(.7),
  700: primaryColor.withOpacity(.8),
  800: primaryColor.withOpacity(.9),
  900: primaryColor.withOpacity(1),
};
MaterialColor primarySwatch =
    MaterialColor(primaryColor.value, primaryColorMap);
