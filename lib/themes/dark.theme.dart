import 'package:flutter/material.dart';

ThemeData dark({
  required BuildContext context,
}) =>
    ThemeData.dark(
      useMaterial3: false,
    ).copyWith(
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: MaterialColor(
          const Color(
            0xFFa58976,
          ).value,
          const {
            50: Color(
              0xFFf5eae0,
            ),
            100: Color(
              0xFFddccbf,
            ),
            200: Color(
              0xFFc1aa9b,
            ),
            300: Color(
              0xFFa58976,
            ),
            400: Color(
              0xFF907059,
            ),
            500: Color(
              0xFF7a583d,
            ),
            600: Color(
              0xFF6f4e37,
            ),
            700: Color(
              0xFF60422e,
            ),
            800: Color(
              0xFF523526,
            ),
            900: Color(
              0xFF42281b,
            ),
          },
        ),
        accentColor: const Color(
          0xFF5aac85,
        ),
        backgroundColor: const Color(
          0xFF121212,
        ),
        brightness: Brightness.dark,
        cardColor: const Color(
          0xFF121212,
        ),
        errorColor: const Color(
          0xFFCF6679,
        ),
      ),
      appBarTheme: const AppBarTheme(
        color: Color(
          0xFF6F4E37,
        ),
      ),
    );
