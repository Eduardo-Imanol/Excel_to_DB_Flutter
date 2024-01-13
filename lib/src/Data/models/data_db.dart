//Modelado de datos

class MyData {
  final int id;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic deletedAt;
  final String nombre;
  final String math;
  final String physical;
  final String chemistry;
  final String biologi;
  final String histori;
  final String geografi;
  final String literature;
  final String spanish;
  final String english;

  MyData({
    required this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    required this.nombre,
    required this.math,
    required this.physical,
    required this.chemistry,
    required this.biologi,
    required this.histori,
    required this.geografi,
    required this.literature,
    required this.spanish,
    required this.english,
  });

  factory MyData.fromJson(Map<String, dynamic> json) {
    return MyData(
      id: json['ID'],
      createdAt: json['CreatedAt'],
      updatedAt: json['UpdatedAt'],
      deletedAt: json['DeletedAt'],
      nombre: json['nombre'],
      math: json['math'],
      physical: json['physical'],
      chemistry: json['chemistry'],
      biologi: json['biologi'],
      histori: json['histori'],
      geografi: json['geografi'],
      literature: json['literature'],
      spanish: json['spanish'],
      english: json['english'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nombre': nombre,
      'math': math,
      'physical': physical,
      'chemistry': chemistry,
      'biologi': biologi,
      'histori': histori,
      'geografi': geografi,
      'literature': literature,
      'spanish': spanish,
      'english': english,
    };
  }
}
