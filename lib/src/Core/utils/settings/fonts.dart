// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sql_excel_spydiagram_test1/src/Core/utils/settings/colors.dart';
import 'package:sql_excel_spydiagram_test1/src/Core/utils/settings/size.dart';

class MavenText extends StatelessWidget {
  const MavenText({
    Key? key,
    this.noCen,
    required this.text,
    required this.textStyle,
  }) : super(key: key);
  final String text;
  final TextStyle textStyle;
  final dynamic noCen;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: maven(textStyle),
        textAlign: noCen == null ? TextAlign.center : TextAlign.start);
  }
}

class CavenText extends StatelessWidget {
  const CavenText({
    Key? key,
    this.noCen,
    required this.text,
    required this.textStyle,
  }) : super(key: key);
  final String text;
  final TextStyle textStyle;
  final dynamic noCen;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: cav(textStyle),
        textAlign: noCen == null ? TextAlign.center : TextAlign.start);
  }
}

// ignore: must_be_immutable
class NunitoText extends StatelessWidget {
  NunitoText({
    Key? key,
    this.noCen,
    required this.text,
    required this.textStyle,
  }) : super(key: key);
  final String text;
  final TextStyle textStyle;
  dynamic noCen;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: maven(textStyle),
        textAlign: noCen == null ? TextAlign.center : TextAlign.start);
  }
}

class NotoText extends StatelessWidget {
  const NotoText({
    Key? key,
    required this.text,
    required this.textStyle,
  }) : super(key: key);
  final String text;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: noto(textStyle),
      textAlign: TextAlign.center,
    );
  }
}

smallText(BuildContext context, dynamic color, int size) {
  return TextStyle(
      fontSize: (sizeText(context) + size) * .6,
      fontWeight: FontWeight.w500,
      color: color ?? ColorsApp.text);
}

normalText(BuildContext context, dynamic color, int size) {
  return TextStyle(
      fontSize: (sizeText(context) + size),
      fontWeight: FontWeight.w100,
      color: color ?? ColorsApp.text);
}

bigText(BuildContext context, dynamic color, int size) {
  return TextStyle(
      fontSize: (sizeText(context) + size) * 1.5,
      fontWeight: FontWeight.w100,
      color: color ?? ColorsApp.text);
}

maven(TextStyle textStyle) => GoogleFonts.mavenPro(textStyle: textStyle);
nunito(TextStyle textStyle) => GoogleFonts.nunito(textStyle: textStyle);
noto(TextStyle textStyle) => GoogleFonts.notoSans(textStyle: textStyle);
cav(TextStyle textStyle) => GoogleFonts.caveat(textStyle: textStyle);

double sizeText(BuildContext context) {
  double width = screenWidth(context);
  double heigth = screenHeigth(context);
  if (width < heigth) {
    if (width / 24 <= 20) {
      return 20;
    } else if (width / 24 >= 40) {
      return 40;
    } else {
      return width / 24;
    }
  } else {
    if (heigth / 24 <= 20) {
      return 20;
    } else if (heigth / 24 >= 40) {
      return 40;
    } else {
      return heigth / 24;
    }
  }
}
