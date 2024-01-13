// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'package:http/http.dart' as http;

//This is tha class for do the connection with the data base
class DBMySQL {
//Change your URL, this is the URL of mode debbug
  static String baseUrl = "http://192.168.1.71:3000";

  //Headers
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
  };

  //Methods for get, post and delete
  static Future<dynamic> get(String path) async {
    try {
      final response =
          await http.get(Uri.parse('$baseUrl/$path'), headers: headers);

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        print("Error en el GET: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print(e);
      print("Error en el GET");
      return null;
    }
  }

  static Future<dynamic> post(String path, dynamic body) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/$path'),
        headers: headers,
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        print("POST completado con éxito");
        return jsonDecode(response.body);
      } else {
        throw ("Error en el POST: ${response.statusCode}");
      }
    } catch (e) {
      print(e);
      throw ("Error en el POST");
    }
  }

  static Future<dynamic> delete(String path) async {
    try {
      final response =
          await http.delete(Uri.parse('$baseUrl/$path'), headers: headers);

      if (response.statusCode == 200) {
        print("DELETE completado con éxito");
        return jsonDecode(response.body);
      } else {
        throw ("Error en el DELETE: ${response.statusCode}");
      }
    } catch (e) {
      print(e);
      throw ("Error en el DELETE");
    }
  }
}
