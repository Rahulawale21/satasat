import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  scaffoldBackgroundColor: scaffoldBackgroundColor,
  primarySwatch: scaffoldBackgroundColorSwatch,
  primaryColor: Colors.black12,
  fontFamily: "Source Sans Pro",
  textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
          textStyle: MaterialStateProperty.all(
              const TextStyle(fontSize: 13, fontWeight: FontWeight.bold)))),
  appBarTheme: const AppBarTheme(
      foregroundColor: blackColor,
      centerTitle: true,
      elevation: 0,
      backgroundColor: scaffoldBackgroundColor,
      titleTextStyle: TextStyle(
          fontFamily: "Source Sans Pro",
          fontSize: 19,
          color: blackColor,
          fontWeight: FontWeight.bold)),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(darkPrimaryColor),
        foregroundColor: MaterialStateProperty.all(Colors.white),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
        textStyle: MaterialStateProperty.all(const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          fontFamily: "Source Sans Pro",
        ))),
  ),
  radioTheme: RadioThemeData(
      fillColor: MaterialStateColor.resolveWith((states) => primaryColor)),
  // splashColor: primaryColor,
  snackBarTheme: const SnackBarThemeData(
    backgroundColor: scaffoldBackgroundColor,
    contentTextStyle: TextStyle(color: blackColor),
  ),
  tabBarTheme: const TabBarTheme(
    indicator: UnderlineTabIndicator(
      borderSide: BorderSide(color: primaryColor, width: 2),
    ),
    labelColor: Colors.white,
  ),
  textTheme: TextTheme(
    titleLarge: const TextStyle(
      fontSize: 18,
      fontFamily: "Inter",
    ),
    titleMedium: GoogleFonts.robotoSlab(
        fontSize: 12, fontWeight: FontWeight.normal, color: blackColor),
    headlineLarge: const TextStyle(fontSize: 18, fontFamily: "Poppins"),
  ),
);
