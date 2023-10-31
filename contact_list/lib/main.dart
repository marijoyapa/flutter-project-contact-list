import 'package:contact_list/screen/tabs.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

final colorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 102, 6, 247),
  background: Color.fromARGB(255, 54, 43, 70),
  primaryContainer: const Color.fromARGB(255, 40, 40, 40),
);

final theme = ThemeData().copyWith(
  useMaterial3: true,
  scaffoldBackgroundColor: Color.fromARGB(255, 0, 0, 0),
  colorScheme: colorScheme,
  textTheme: GoogleFonts.robotoFlexTextTheme().copyWith(
    titleSmall: GoogleFonts.robotoFlex(
      fontWeight: FontWeight.bold,
    ),
    titleMedium: GoogleFonts.robotoFlex(
      fontWeight: FontWeight.bold,
    ),
    titleLarge: GoogleFonts.robotoFlex(
      fontWeight: FontWeight.bold,
    ),
  ),
);

void main() {
  runApp(
    const ContactsScreen(),
  );
}
