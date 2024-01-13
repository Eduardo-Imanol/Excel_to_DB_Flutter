import 'package:flutter/material.dart';

//This is a class that contains all the colors used in the app
class ColorsApp {
  static const Color primary = Color.fromARGB(255, 88, 148, 196);
  static const Color secondary = Color.fromARGB(255, 255, 255, 255);
  static const Color background = Color.fromARGB(255, 255, 255, 255);
  static const Color text = Color.fromARGB(255, 0, 0, 0);
  static const Color border = Color.fromARGB(255, 0, 0, 0);
  static const Color icon = Color.fromARGB(255, 0, 0, 0);
  static const Color error = Color.fromARGB(255, 255, 0, 0);
  static const Color warning = Color.fromARGB(255, 255, 255, 0);

  //This is a method that creates a material color from a color
  static MaterialColor createMaterialColor(Color color) {
    List strengths = <double>[.05];
    Map<int, Color> swatch = {};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }

    for (final double strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }

    return MaterialColor(color.value, swatch);
  }
}
