import 'package:sql_excel_spydiagram_test1/src/Data/Repositories/back_connection.dart';
import 'package:sql_excel_spydiagram_test1/src/Data/models/data_db.dart';

Future<dynamic> getOneData(int id) async {
  var resp = await DBMySQL.get("names/$id");

  if (resp != null) {
    return null;
  } else {
    MyData data = MyData.fromJson(resp);
    return data;
  }
}

Future<List<MyData>> getAllData() async {
  List<MyData> dates = [];
  List resp = await DBMySQL.get("names");

  if (resp.isNotEmpty) {
    for (var data in resp) {
      MyData onlyResp = MyData.fromJson(data);
      dates.add(onlyResp);
    }
    return dates;
  } else {
    return dates;
  }
}

deleteAllData() async {
  await DBMySQL.delete("names");
}

deleteOneData(int id) async {
  await DBMySQL.delete("names/$id");
}

postOneData(MyData data) async {
  await DBMySQL.post("names", data.toJson());
}

postAllData(List<dynamic> date) async {
  for (var i = 0; i < date.length; i++) {
    await DBMySQL.post("names", date[i]);
  }
}
