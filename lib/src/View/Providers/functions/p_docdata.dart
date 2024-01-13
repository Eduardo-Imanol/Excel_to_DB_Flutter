import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:sql_excel_spydiagram_test1/src/Data/models/document.dart';

class DocData extends ChangeNotifier {
  String message = "Arrastre su documento excel aquí";
  int zoneState = 0;

  String nameDoc = "";
  Uint8List? bytesDoc;
  bool isExcel = false;
  List<List<String>> _data = [];

  List<List<String>> get data => _data;

  void setZoneState(int newState) {
    zoneState = newState;
    notifyListeners();
  }

  Color getZoneDropStateColor() {
    if (zoneState == 1) {
      return Colors.blue;
    } else if (zoneState == 2) {
      return Colors.red;
    } else if (zoneState == 3) {
      return Colors.green;
    } else {
      return Colors.grey;
    }
  }

  String getZoneDropStateIcon() {
    if (zoneState == 1) {
      return "BUSCANDO ARCHIVO";
    } else if (zoneState == 2) {
      return "ERROR DE ARCHIVO";
    } else if (zoneState == 3) {
      return "ARCHIVO OBTENIDO";
    } else {
      return "SIN ARCHIVO";
    }
  }

  String getZoneDropStateImage() {
    if (zoneState == 1) {
      return "assets/pChosingDoc.png";
    } else if (zoneState == 2) {
      return "assets/pErrorDoc.png";
    } else if (zoneState == 3) {
      return "assets/pConDoc.png";
    } else {
      return "assets/pSinDoc.png";
    }
  }

  List<String> knowExtensionNameDoc(String doc) {
    if (doc.isEmpty) {
      return [""];
    } else {
      List<String> extention = doc.split('.');
      setIsExcel(extention[1]);
      return extention;
    }
  }

  void getName(String newName) {
    nameDoc = newName;
    notifyListeners();
  }

  void getBytes(Uint8List newBytes) {
    bytesDoc = newBytes;
    notifyListeners();
  }

  void setMessage(String newMessage) {
    message = newMessage;
    notifyListeners();
  }

  Document getDocument() {
    Document document;
    document = Document(name: nameDoc, bytes: bytesDoc!, success: isExcel);
    return document;
  }

  void setIsExcel(String extention) {
    if (extention == 'xls' || extention == 'xlsx') {
      isExcel = true;
    } else {
      isExcel = false;
    }
    notifyListeners();
  }

  // Método para actualizar la información del Excel
  void updateData(List<List<String>> newData) {
    _data = newData;
    notifyListeners();
  }
}
