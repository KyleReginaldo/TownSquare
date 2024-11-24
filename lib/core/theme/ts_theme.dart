import 'package:flutter/material.dart';

import 'colors.dart';

class TsTheme {
  TsTheme._();
  static const TextTheme lightTextTheme = TextTheme(
    displayLarge: TextStyle(
        fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
    bodyLarge: TextStyle(
        fontSize: 16, fontWeight: FontWeight.normal, color: Colors.black87),
    bodySmall: TextStyle(
        fontSize: 14, fontStyle: FontStyle.italic, color: Colors.black54),
  );

// Dark theme text styles
  static const TextTheme darkTextTheme = TextTheme(
    displayLarge: TextStyle(
        fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
    bodyLarge: TextStyle(
        fontSize: 16, fontWeight: FontWeight.normal, color: Colors.white70),
    bodySmall: TextStyle(
        fontSize: 14, fontStyle: FontStyle.italic, color: Colors.white60),
  );
  static ThemeData getLightTheme() {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: kScaffoldBackground,
      colorScheme: ColorScheme.fromSeed(
        seedColor: kPrimary600,
        secondary: kSecondaryYellow600,
        tertiary: kSecondaryPurple600,
      ),
      fontFamily: 'SfProDisplay',
      useMaterial3: true,
      buttonTheme: const ButtonThemeData(
        splashColor: kWhite,
      ),
      textButtonTheme: const TextButtonThemeData(
          style: ButtonStyle(
        foregroundColor: MaterialStatePropertyAll(
          kPrimary600,
        ),
      )),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          textStyle: const MaterialStatePropertyAll(
            TextStyle(
              fontSize: 15,
            ),
          ),
          padding: const MaterialStatePropertyAll(
            EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 0,
            ),
          ),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          foregroundColor: const MaterialStatePropertyAll(kWhite),
          backgroundColor: const MaterialStatePropertyAll(kBlack),
        ),
      ),
      textTheme: lightTextTheme,
    );
  }

  static ThemeData getDarkTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: kScaffoldBackgroundDark,
      fontFamily: 'SfProDisplay',
      useMaterial3: true,
      buttonTheme: const ButtonThemeData(
        splashColor: kWhite,
      ),
      textButtonTheme: const TextButtonThemeData(
          style: ButtonStyle(
        foregroundColor: MaterialStatePropertyAll(
          kPrimary600,
        ),
      )),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          textStyle: const MaterialStatePropertyAll(
            TextStyle(
              fontSize: 15,
            ),
          ),
          padding: const MaterialStatePropertyAll(
            EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 0,
            ),
          ),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          foregroundColor: const MaterialStatePropertyAll(kWhite),
          backgroundColor: const MaterialStatePropertyAll(kBlack),
        ),
      ),
      textTheme: darkTextTheme,
    );
  }
}
