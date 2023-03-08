import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppTheme {
  static final data = ThemeData(
    useMaterial3: true,
    highlightColor: Colors.transparent,
    splashFactory: InkSparkle.splashFactory,
    textTheme: GoogleFonts.robotoTextTheme(),
    inputDecorationTheme: InputDecorationTheme(border: OutlineInputBorder()),
  );
}
