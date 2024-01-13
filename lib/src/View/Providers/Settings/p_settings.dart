import 'package:flutter/material.dart';

class SettingsProvider with ChangeNotifier {
  // Variable for controlling the text size in app
  int textSize = 0;

  //metod for change the size of text with provider
  void setTextSize(newSize) {
    textSize = newSize;
    notifyListeners();
  }
}
