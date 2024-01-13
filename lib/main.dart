// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:sql_excel_spydiagram_test1/src/Core/utils/providers_injector.dart';
import 'package:provider/provider.dart';
import 'package:sql_excel_spydiagram_test1/src/Core/utils/settings/theme_data.dart';
import 'package:sql_excel_spydiagram_test1/src/View/Screens/get_excel_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: InjectorProviders.dependencies,
        child: const MyMaterialApp());
  }
}

class MyMaterialApp extends StatelessWidget {
  const MyMaterialApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: themeData(),
        themeMode: ThemeMode.system,
        home: const GetExcelPage());
  }
}
