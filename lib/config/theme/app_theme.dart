
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../config.dart';

class AppTheme {
  ThemeData getTheme(BuildContext context) {
    return ThemeData.dark().copyWith(
      useMaterial3: true,
      scaffoldBackgroundColor: bgColor,
      textTheme: GoogleFonts.poppinsTextTheme(
        Theme.of(context).textTheme,
      ).apply(bodyColor: Colors.white),
      canvasColor: secondaryColor,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.blue,
        brightness: Brightness.dark, // mantiene el estilo oscuro
      ),
    );
  }
}
