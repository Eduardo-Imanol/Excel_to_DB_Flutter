// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sql_excel_spydiagram_test1/src/Core/utils/settings/colors.dart';

ThemeData themeData() {
  return ThemeData(
    primaryColor: ColorsApp.primary,
    primarySwatch: ColorsApp.createMaterialColor(ColorsApp.primary),
    scaffoldBackgroundColor: ColorsApp.background,
    // textTheme: maven(const TextStyle(color: ColorsApp.text)),
    fontFamily: GoogleFonts.mavenPro().fontFamily,
    iconTheme: const IconThemeData(color: ColorsApp.icon),
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
      backgroundColor: ColorsApp.background,
    )),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(backgroundColor: ColorsApp.primary)),
    outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
      backgroundColor: ColorsApp.primary,
    )),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: ColorsApp.text,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: ColorsApp.primary,
      foregroundColor: ColorsApp.text,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: ColorsApp.primary,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    colorScheme: ColorScheme.fromSwatch(
            primarySwatch: ColorsApp.createMaterialColor(ColorsApp.primary))
        .copyWith(background: ColorsApp.background),
  );
}
