import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


final ThemeData themeData = ThemeData(
    primaryColor: Color(0xFF567CBD),
    scaffoldBackgroundColor: Color(0xFFF6F6F6),
    fontFamily: GoogleFonts.inter().fontFamily,
    textTheme: GoogleFonts.poppinsTextTheme().apply(
        bodyColor: Color(0xFF313131),
        displayColor: Color(0xFF313131),
        decorationColor: Color(0xFF313131)
    ),
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        titleTextStyle: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.black,
        ),
        centerTitle: true,
    ),
    snackBarTheme: SnackBarThemeData(
        elevation: 6,
        behavior: SnackBarBehavior.floating,
        contentTextStyle: GoogleFonts.poppins(
            fontSize: 14,
            color: Colors.white,
        ),
    ),
);