import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var kItemTitleCategoryFont = GoogleFonts.montserrat();

TextStyle kBigFont(
    {Color color, double fontSize, FontWeight fontWeight, double wordSpacing}) {
  return GoogleFonts.robotoMono(
      color: color ?? Colors.blue,
      fontSize: fontSize ?? 25,
      fontWeight: fontWeight ?? FontWeight.normal,
      wordSpacing: wordSpacing ?? 0);
}

TextStyle kSmallFont(
    {Color color, double fontSize, FontWeight fontWeight, double wordSpacing}) {
  return GoogleFonts.roboto(
      color: color,
      fontSize: fontSize ?? 16,
      fontWeight: fontWeight ?? FontWeight.normal,
      wordSpacing: wordSpacing ?? 0);
}
