import 'package:flutter/material.dart';

class AppSizes {
  // Tamaño de pantalla
  static double screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;
  static double screenWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  // Tamaños de texto dinamicos
  static double smallText(BuildContext context) =>
      screenHeight(context) * 0.015;
  static double mediumText(BuildContext context) =>
      screenHeight(context) * 0.02;
  static double largeText(BuildContext context) =>
      screenHeight(context) * 0.025;
  static double extraLargeText(BuildContext context) =>
      screenHeight(context) * 0.035;

  // Espacios dinámicos
  static double smallSpace(BuildContext context) =>
      screenHeight(context) * 0.01;
  static double mediumSpace(BuildContext context) =>
      screenHeight(context) * 0.03;
  static double largeSpace(BuildContext context) =>
      screenHeight(context) * 0.05;

  static double smallWidthSpace(BuildContext context) =>
      screenWidth(context) * 0.01;
  static double mediumWidthSpace(BuildContext context) =>
      screenWidth(context) * 0.03;
  static double largeWidthSpace(BuildContext context) =>
      screenWidth(context) * 0.05;

  // Tamaños de iconos
  static double smallIconSize(BuildContext context) =>
      screenHeight(context) * 0.02;
  static double mediumIconSize(BuildContext context) =>
      screenHeight(context) * 0.04;
  static double largeIconSize(BuildContext context) =>
      screenHeight(context) * 0.06;

  // Tamaños de botones
  static double smallButtonHeight(BuildContext context) =>
      screenHeight(context) * 0.05;
  static double mediumButtonHeight(BuildContext context) =>
      screenHeight(context) * 0.07;
  static double largeButtonHeight(BuildContext context) =>
      screenHeight(context) * 0.09;

  // Tamaños de elementos de listas (altura)
  static double listItemHeight(BuildContext context) =>
      screenHeight(context) * 0.1;

  // Altura de AppBar
  static double appBarHeight(BuildContext context) =>
      screenHeight(context) * 0.08;

  // Tamaños personalizados
  static double customSizeHeight(BuildContext context, double percentage) {
    return screenHeight(context) * percentage;
  }

  static double customSizeWidth(BuildContext context, double percentage) {
    return screenWidth(context) * percentage;
  }
}
