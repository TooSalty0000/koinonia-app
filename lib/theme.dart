import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const textColor = Color(0xFF191310);
const backgroundColor = Color(0xFFfff7f3);
const primaryColor = Color(0xFFbba295);
const primaryAColor = Color.fromARGB(255, 157, 137, 126);
const primaryFgColor = Color(0xFF191310);
const secondaryColor = Color(0xFFd7c8c1);
const secondaryFgColor = Color(0xFF191310);
const accentColor = Color(0xFF7c5f50);
const accentFgColor = Color(0xFFfff7f3);

const theColorScheme = ColorScheme(
  brightness: Brightness.light,
  background: backgroundColor,
  onBackground: textColor,
  primary: primaryColor,
  shadow: primaryAColor,
  onPrimary: primaryFgColor,
  secondary: secondaryColor,
  onSecondary: secondaryFgColor,
  tertiary: accentColor,
  onTertiary: accentFgColor,
  surface: backgroundColor,
  onSurface: textColor,
  error: Brightness.light == Brightness.light
      ? Color(0xffB3261E)
      : Color(0xffF2B8B5),
  onError: Brightness.light == Brightness.light
      ? Color(0xffFFFFFF)
      : Color(0xff601410),
);

ThemeData getTheme() {
  return ThemeData(
    useMaterial3: true,
    colorScheme: theColorScheme,
    splashColor: Colors.transparent,
    textTheme: TextTheme(
      displayLarge: const TextStyle(
        fontSize: 72,
        fontWeight: FontWeight.bold,
      ),
      // ···
      titleLarge: GoogleFonts.oswald(
        fontSize: 30,
        fontStyle: FontStyle.italic,
      ),
      bodyMedium: GoogleFonts.merriweather(),
      displaySmall: GoogleFonts.pacifico(),
    ),
  );
}
