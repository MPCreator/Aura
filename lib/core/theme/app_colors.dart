import 'package:flutter/material.dart';

class AppColors {
  // Colores principales de la aplicación
  static const Color primaryColor = Color(0xFFEE4230); // Color primario
  static const Color secondaryColor = Color(0xFFF6E1CB); // Color secundario
  static const Color backgroundColor = Color(0xFFF6F6F6); // Fondo principal
  static const Color darkRed = Color(0xFF730613); // Rojo oscuro
  static const Color brown = Color(0xFF763A39); // Marrón
  static const Color softRed = Color(0xFFFF7465); // Rojo suave
  static const Color yellow = Color(0xFFFFD114); // Amarillo
  static const Color white = Color(0xFFFFFFFF); // Blanco
  static const Color black = Color(0xFF000000); // Negro

  // Colores de texto
  static const Color textPrimary = Color(0xFF333333); // Texto principal
  static const Color textSecondary = Color(0xFF666666); // Texto secundario
  static const Color textTertiary = Color(0xFF999999); // Texto terciario

  // Colores emocionales (gradientes)
  static const List<Color> enojoGradient = [
    Color(0xFFFF7373), // 0%
    Color(0xFFFFC9C9), // 100%
  ];

  static const List<Color> tristezaGradient = [
    Color(0xFF5DADE2), // 0%
    Color(0xFFD8F1FF), // 100%
  ];

  static const List<Color> calmaGradient = [
    Color(0xFFFFBC82), // 0%
    Color(0xFFFFECDB), // 100%
  ];

  static const List<Color> felicidadGradient = [
    Color(0xFFFFD966), // 0%
    Color(0xFFFFF9E9), // 100%
  ];

  static const List<Color> ansiedadGradient = [
    Color(0xFFA9DFBF), // 0%
    Color(0xFFD7FFE7), // 100%
  ];

  // Colores de estado
  static const Color successColor = Color(0xFF28A745); // Verde de éxito
  static const Color errorColor = Color(0xFFDC3545); // Rojo de error
  static const Color warningColor =
      Color(0xFFFFC107); // Amarillo de advertencia
  static const Color infoColor = Color(0xFF17A2B8); // Azul de información

  // Colores de iconos
  static const Color iconColor =
      Color(0xFF4B4B4B); // Color de iconos principales
}
