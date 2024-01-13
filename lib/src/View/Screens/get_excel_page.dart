// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:sql_excel_spydiagram_test1/src/Core/utils/settings/fonts.dart';
import 'package:sql_excel_spydiagram_test1/src/Core/utils/settings/size.dart'
    as size;
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:provider/provider.dart';
import 'package:sql_excel_spydiagram_test1/src/View/Functions/get_data_db.dart';
import 'package:sql_excel_spydiagram_test1/src/View/Functions/get_excel_data.dart';
import 'package:sql_excel_spydiagram_test1/src/View/Providers/Settings/p_settings.dart';
import 'package:sql_excel_spydiagram_test1/src/View/Providers/functions/p_docdata.dart';

//
class GetExcelPage extends StatefulWidget {
  const GetExcelPage({super.key});

  @override
  State<GetExcelPage> createState() => _GetExcelPageState();
}

class _GetExcelPageState extends State<GetExcelPage> {
  @override
  Widget build(BuildContext context) {
    final pSettings = Provider.of<SettingsProvider>(context);
    DocData pDoc = Provider.of<DocData>(context);

    int textSize = pSettings.textSize;

    return Scaffold(
      appBar: AppBar(
          title: NunitoText(
              text: 'Cargar Excel',
              textStyle: normalText(context, null, textSize))),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const DrawAndDropZone(),
            MavenText(
                text: "Presione para ransferir datos al servidor",
                textStyle: smallText(context, null, textSize)),
            FloatingActionButton(onPressed: () async {
              if (pDoc.zoneState == 3) {
                List<dynamic> extractExcel =
                    await procesarArchivoExcel(pDoc.bytesDoc!);
                postAllData(extractExcel);
              } else {
                pDoc.setZoneState(2);
                pDoc.setMessage(
                    "Error al agregar su documento excel\nintentelo de nuevo");
              }
            })
          ],
        ),
      ),
    );
  }
}

class DrawAndDropZone extends StatefulWidget {
  const DrawAndDropZone({super.key});

  @override
  State<DrawAndDropZone> createState() => _DrawAndDropZoneState();
}

class _DrawAndDropZoneState extends State<DrawAndDropZone> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.screenWidth(context) * 0.5,
      height: size.screenHeigth(context) * 0.5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Container(
              color: Colors.transparent,
              child: const Stack(
                children: [DrawAndDrop()],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DrawAndDrop extends StatefulWidget {
  const DrawAndDrop({super.key});

  @override
  State<DrawAndDrop> createState() => _DrawAndDropState();
}

class _DrawAndDropState extends State<DrawAndDrop> {
  late DropzoneViewController controller1;

  @override
  Widget build(BuildContext context) {
    final pDoc = Provider.of<DocData>(context);

    final pSettings = Provider.of<SettingsProvider>(context);

    int textSize = pSettings.textSize;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: Container(
            color: pDoc.getZoneDropStateColor(),
            child: Stack(
              children: [
                buildZone1(context),
                Center(
                  child: SizedBox(
                    height: size.screenHeigth(context) * 0.4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        NunitoText(
                          text: pDoc.message,
                          textStyle: normalText(context, null, textSize - 2),
                        ),
                        Image.asset(
                          pDoc.getZoneDropStateImage(),
                          width: size.screenHeigth(context) * 0.25,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: ElevatedButton(
              onPressed: () async {
                final files =
                    await controller1.pickFiles(mime: ['xls', 'xlsx']);
                if (files.isEmpty) {
                  pDoc.setZoneState(2);
                  pDoc.setMessage(
                      "Error al agregar su documento excel\nintentelo de nuevo");
                } else {
                  final file = files.first;
                  final bytes = await controller1.getFileData(file);
                  final name = file.name;
                  final extention = pDoc.knowExtensionNameDoc(name);
                  if (extention.length > 1 && pDoc.isExcel) {
                    pDoc.setZoneState(3);
                    pDoc.getName(name);
                    pDoc.getBytes(bytes);
                    pDoc.setMessage("¡Archivo cargado exitosamente!");
                    pDoc.getDocument();
                  } else {
                    pDoc.setZoneState(2);
                    pDoc.setMessage(
                        "Archivo denegado, intente con otro\nasegurese que sea excel");
                  }
                }
              },
              child: NunitoText(
                  text: 'Seleccione un archivo',
                  textStyle: smallText(context, null, textSize))),
        ),
      ],
    );
  }

  Widget buildZone1(BuildContext context) {
    final pDoc = Provider.of<DocData>(context);

    return Builder(
      builder: (context) => DropzoneView(
        operation: DragOperation.copy,
        cursor: CursorType.grab,
        onCreated: (ctrl) => controller1 = ctrl,
        onLoaded: () {
          pDoc.setZoneState(0);
          pDoc.setMessage("Arrastre su documento excel aquí");
        },
        onError: (ev) {
          pDoc.setZoneState(2);
          pDoc.setMessage(
              "Error al agregar su documento excel\nintentelo de nuevo");
        },
        onHover: () {
          pDoc.setZoneState(1);
          pDoc.setMessage("Suelte su documento excel aquí");
        },
        onLeave: () {
          pDoc.setZoneState(0);
          pDoc.setMessage("Arrastre su documento excel aquí");
        },
        onDrop: (ev) async {
          final bytes = await controller1.getFileData(ev);
          final name = ev.name;
          final extention = pDoc.knowExtensionNameDoc(name);

          if (extention.length > 1 && pDoc.isExcel) {
            pDoc.setZoneState(3);
            pDoc.getName(name);
            pDoc.getBytes(bytes);
            pDoc.setMessage("¡Archivo cargado exitosamente!");
            pDoc.getDocument();
          } else {
            pDoc.setZoneState(2);
            pDoc.setMessage(
                "Archivo denegado, intente con otro\nasegurese que sea excel");
          }
        },
        onDropInvalid: (ev) {
          pDoc.setZoneState(2);
          pDoc.setMessage(
              "Archivo denegado, intente con otro\nasegurese que sea excel");
        },
        onDropMultiple: (ev) async {
          pDoc.setMessage(
              "Error, unicamente se acepta un solo documento\nintentelo nuevamente");
          pDoc.setZoneState(2);
        },
      ),
    );
  }
}
