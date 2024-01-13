//Crea clases que ayuden a mantener la responsividad de la app en distintos dispositivos

import 'package:flutter/widgets.dart';

sizeScreen(BuildContext context) => MediaQuery.of(context);

screenWidth(BuildContext context) => sizeScreen(context).size.width;
screenHeigth(BuildContext context) => sizeScreen(context).size.height;
lockSizeHorizontal(BuildContext context) => screenWidth(context) / 100;
blockSizeVertical(BuildContext context) => screenHeigth(context) / 100;
safeBlockHorizontal(BuildContext context) =>
    (screenWidth(context) - safeAreaHorizontal(context)) / 100;
safeBlockVertical(BuildContext context) =>
    (screenHeigth(context) - safeBlockVertical(context)) / 100;
textScaleFactor(BuildContext context) => sizeScreen(context).textScaleFactor;
safeAreaHorizontal(BuildContext context) =>
    sizeScreen(context).padding.left + MediaQuery.of(context).padding.right;
safeAreaVertical(BuildContext context) =>
    sizeScreen(context).padding.top + MediaQuery.of(context).padding.bottom;
