import 'package:contact_list/screen/tabs.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

final colorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 102, 6, 247),
  background: const Color.fromARGB(255, 56, 49, 66),
);

final theme = ThemeData().copyWith(
  useMaterial3: true,
  scaffoldBackgroundColor: colorScheme.background,
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
