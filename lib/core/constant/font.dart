import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var kItemTitleCategoryFont = GoogleFonts.montserrat();

TextStyle kLoraFont(
    {Color color, double fontSize, FontWeight fontWeight, double wordSpacing}) {
  return GoogleFonts.lora(
      color: color,
      fontSize: fontSize ?? 25,
      fontWeight: fontWeight ?? FontWeight.normal,
      wordSpacing: wordSpacing ?? 0);
}

TextStyle kMontserratFont(
    {Color color, double fontSize, FontWeight fontWeight, double wordSpacing}) {
  return GoogleFonts.montserrat(
      color: color,
      fontSize: fontSize ?? 16,
      fontWeight: fontWeight ?? FontWeight.normal,
      wordSpacing: wordSpacing ?? 0);
}
