import 'package:contact_list/screen/tabs.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

final colorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 102, 6, 247),
  background: Color.fromARGB(255, 54, 43, 70),
  primaryContainer: const Color.fromARGB(255, 40, 40, 40),
);

var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 96, 59, 181),
);

var kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 5, 99, 125),
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

final darkTheme = ThemeData.dark().copyWith(
  useMaterial3: true,
  colorScheme: kDarkColorScheme,
  cardTheme: const CardTheme().copyWith(
    color: kDarkColorScheme.secondaryContainer,
    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        backgroundColor: kDarkColorScheme.primaryContainer,
        foregroundColor: kDarkColorScheme.onPrimaryContainer),
  ),
);

void main() {
  runApp(
    const ContactsScreen(),
  );
}
