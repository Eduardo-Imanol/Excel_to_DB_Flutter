// ignore_for_file: depend_on_referenced_packages

import 'package:excel/excel.dart';
import 'package:flutter/foundation.dart';
import 'package:sql_excel_spydiagram_test1/src/Data/models/data_db.dart';

Future<List> procesarArchivoExcel(Uint8List bytes) async {
  var excel = Excel.decodeBytes(bytes);

  int id = 0;
  List<dynamic> datesDB = [];

  for (var table in excel.tables.keys) {
    for (var row in excel.tables[table]!.rows) {
      var nombre = row[0]?.value;
      var math = row[1]?.value;
      var physical = row[2]?.value;
      var chemistry = row[3]?.value;
      var biologi = row[4]?.value;
      var histori = row[5]?.value;
      var geografi = row[6]?.value;
      var literature = row[7]?.value;
      var spanish = row[8]?.value;
      var english = row[9]?.value;

      if (nombre != null) {
        id += 1;
        if (id >= 2) {
          MyData data = MyData(
              id: id.toInt(),
              nombre: nombre.toString(),
              math: math.toString(),
              physical: physical.toString(),
              chemistry: chemistry.toString(),
              biologi: biologi.toString(),
              histori: histori.toString(),
              geografi: geografi.toString(),
              literature: literature.toString(),
              spanish: spanish.toString(),
              english: english.toString());

          var dataJson = data.toJson();
          datesDB.add(dataJson);
        }
      }
    }
  }
  return datesDB;
}
