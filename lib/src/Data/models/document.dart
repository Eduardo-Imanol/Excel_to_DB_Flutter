import 'dart:typed_data';

class Document {
  String name;
  Uint8List bytes;
  bool success;

  Document({required this.name, required this.bytes, required this.success});
}
