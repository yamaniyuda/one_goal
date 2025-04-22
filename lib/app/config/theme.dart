import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


final ThemeData themeData = ThemeData(
    primaryColor: Color(0xFF567CBD),
    scaffoldBackgroundColor: Color(0xFFF6F6F6),
    fontFamily: GoogleFonts.inter().fontFamily,
    textTheme: GoogleFonts.interTextTheme().apply(
        bodyColor: Color(0xFF313131),
        displayColor: Color(0xFF313131),
        decorationColor: Color(0xFF313131)
    ),
);