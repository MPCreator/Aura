import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'styles.dart';

final ThemeData appTheme = ThemeData(
  // Colores principales
  primaryColor: AppColors.primaryColor,
  secondaryHeaderColor: AppColors.secondaryColor,
  scaffoldBackgroundColor: AppColors.backgroundColor,

  // Colores para elementos de texto
  textTheme: TextTheme(
    displayLarge: AppTextStyles.headline1,
    displayMedium: AppTextStyles.headline2,
    titleMedium: AppTextStyles.subtitle1,
    bodyLarge: AppTextStyles.bodyText1,
    bodyMedium: AppTextStyles.bodyText2,
    labelLarge: AppTextStyles.buttonText,
    bodySmall: AppTextStyles.caption,
  ),

  // Colores para el AppBar
  appBarTheme: AppBarTheme(
    color: AppColors.primaryColor,
    iconTheme: IconThemeData(color: AppColors.white),
    titleTextStyle: TextStyle(color: AppColors.white),
    elevation: 4, // Sombra del AppBar
  ),

  // Estilo para botones
  buttonTheme: ButtonThemeData(
    buttonColor: AppColors.primaryColor,
    shape: RoundedRectangleBorder(
      borderRadius: AppBorders.mediumBorderRadius,
    ),
  ),

  // Estilo para botones flotantes (FAB)
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: AppColors.softRed,
  ),

  // Estilo de los iconos
  iconTheme: IconThemeData(
    color: AppColors.iconColor,
  ),

  // Estilo de los campos de texto
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: AppColors.white,
    border: OutlineInputBorder(
      borderRadius: AppBorders.smallBorderRadius,
      borderSide: BorderSide(color: AppColors.primaryColor),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: AppBorders.smallBorderRadius,
      borderSide: BorderSide(color: AppColors.primaryColor),
    ),
    labelStyle: AppTextStyles.bodyText2.copyWith(color: AppColors.textPrimary),
    hintStyle: AppTextStyles.bodyText2.copyWith(color: AppColors.textSecondary),
  ),

  // Estilo para los diálogos
  dialogTheme: DialogTheme(
    backgroundColor: AppColors.backgroundColor,
    titleTextStyle:
        AppTextStyles.headline2.copyWith(color: AppColors.textPrimary),
    contentTextStyle:
        AppTextStyles.bodyText1.copyWith(color: AppColors.textSecondary),
  ),

  // Estilo para las tarjetas
  cardTheme: CardTheme(
    color: AppColors.white,
    elevation: 4,
    margin: EdgeInsets.all(8.0),
    shape: RoundedRectangleBorder(
      borderRadius: AppBorders.cardBorderRadius,
    ),
  ),

  // Colores de los iconos y botones flotantes
  hintColor: AppColors.textSecondary,

  // Color de las barras de navegación
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: AppColors.primaryColor,
    selectedItemColor: AppColors.white,
    unselectedItemColor: AppColors.textSecondary,
    elevation: 8,
  ),
);
