import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const double size8 = 8;
const double size9 = 9;
const double size10 = 10;
const double size11 = 11;
const double size13 = 13;
const double defaultSize = 14;
const double size16 = 16;
const double size18 = 18;
const double size20 = 20;
const double size30 = 30;
const double size12 = 12;
const double size14 = 14;
const double size40 = 40;
const double size60 = 60;
const double size25 = 25;
const double size15 = 15;
const FontWeight fontWeightMedium = FontWeight.w500;
const FontWeight fontWeightRegular = FontWeight.w400;
const FontWeight fontWeightLight = FontWeight.w300;
const FontWeight fontWeightSemiBold = FontWeight.w600;
openSansFont({
  size = defaultSize,
  color = Colors.black,
  fontWeight = FontWeight.w500,
  backgroundColor = Colors.transparent,
}) {
  final font = GoogleFonts.openSans(
      fontSize: size,
      color: color,
      fontWeight: fontWeight,
      backgroundColor: backgroundColor);
  return font;
}
