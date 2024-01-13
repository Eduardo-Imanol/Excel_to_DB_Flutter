// ignore_for_file: depend_on_referenced_packages

import 'package:provider/provider.dart';
import 'package:sql_excel_spydiagram_test1/src/View/Providers/Settings/p_settings.dart';
import 'package:sql_excel_spydiagram_test1/src/View/Providers/functions/p_docdata.dart';

import 'package:provider/single_child_widget.dart';

class InjectorProviders {
  static List<SingleChildWidget> dependencies = [
    ChangeNotifierProvider(create: (_) => SettingsProvider()),
    ChangeNotifierProvider(create: (_) => DocData())
  ];
}
