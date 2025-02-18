import 'package:flutter/material.dart';
import 'app_colors.dart'; // Asegúrate de tener una clase AppColors con los colores definidos

class AppTextStyles {
  // Estilos de texto para los títulos, subtítulos y cuerpo de la aplicación
  static const TextStyle headline1 = TextStyle(
    fontSize: 32.0,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary, // Color principal de texto
  );

  static const TextStyle headline2 = TextStyle(
    fontSize: 28.0,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  static const TextStyle subtitle1 = TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary, // Color de subtítulos
  );

  static const TextStyle bodyText1 = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.normal,
    color: AppColors.textPrimary,
  );

  static const TextStyle bodyText2 = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.normal,
    color: AppColors.textSecondary,
  );

  static const TextStyle buttonText = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
    color: Colors.white, // Texto en botones
  );

  static const TextStyle caption = TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.normal,
    color: AppColors.textTertiary, // Color terciario para textos menores
  );
}

class AppBorders {
  // Bordes reutilizables
  static const BorderRadius smallBorderRadius =
      BorderRadius.all(Radius.circular(8.0));
  static const BorderRadius mediumBorderRadius =
      BorderRadius.all(Radius.circular(16.0));
  static const BorderRadius largeBorderRadius =
      BorderRadius.all(Radius.circular(24.0));

  // Bordes para contenedores o tarjetas
  static const BorderRadius cardBorderRadius =
      BorderRadius.all(Radius.circular(12.0));
}

class AppShadows {
  // Sombras para elementos como botones, tarjetas o modales
  static const BoxShadow lightShadow = BoxShadow(
    color: Color(0x29000000), // sombra ligera
    offset: Offset(0, 4),
    blurRadius: 6,
  );

  static const BoxShadow mediumShadow = BoxShadow(
    color: Color(0x29000000), // sombra media
    offset: Offset(0, 6),
    blurRadius: 12,
  );

  static const BoxShadow heavyShadow = BoxShadow(
    color: Color(0x29000000), // sombra fuerte
    offset: Offset(0, 8),
    blurRadius: 16,
  );
}

class AppButtonStyles {
  // Estilo de botón principal
  static ButtonStyle primaryButtonStyle(BuildContext context) {
    return ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: AppColors.primaryColor, // Color del texto
      padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
      shape: RoundedRectangleBorder(
        borderRadius: AppBorders.mediumBorderRadius,
      ),
    );
  }

  // Estilo de botón secundario
  static ButtonStyle secondaryButtonStyle(BuildContext context) {
    return ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: AppColors.secondaryColor, // Color del texto
      padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
      shape: RoundedRectangleBorder(
        borderRadius: AppBorders.mediumBorderRadius,
      ),
    );
  }

  // Estilo de botón con icono
  static ButtonStyle iconButtonStyle(BuildContext context) {
    return ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: AppColors.softRed,
      padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      shape: RoundedRectangleBorder(
        borderRadius: AppBorders.smallBorderRadius,
      ),
    );
  }
}

class AppSpacing {
  // Espaciado para márgenes y paddings
  static const EdgeInsetsGeometry smallPadding = EdgeInsets.all(8.0);
  static const EdgeInsetsGeometry mediumPadding = EdgeInsets.all(16.0);
  static const EdgeInsetsGeometry largePadding = EdgeInsets.all(24.0);

  static const EdgeInsetsGeometry cardPadding =
      EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0);

  static const EdgeInsetsGeometry verticalSpacingSmall =
      EdgeInsets.symmetric(vertical: 8.0);
  static const EdgeInsetsGeometry verticalSpacingMedium =
      EdgeInsets.symmetric(vertical: 16.0);
  static const EdgeInsetsGeometry verticalSpacingLarge =
      EdgeInsets.symmetric(vertical: 24.0);
}

class AppGradients {
  // Gradientes personalizados para diferentes estados emocionales o fondos
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [AppColors.primaryColor, AppColors.secondaryColor],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static LinearGradient createEmotionGradient(List<Color> colors) {
    return LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: colors,
    );
  }

  static const LinearGradient enojoGradient = LinearGradient(
    colors: [Color(0xFFFF7373), Color(0xFFFFC9C9)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const LinearGradient felicidadGradient = LinearGradient(
    colors: [Color(0xFFFFD966), Color(0xFFFFF9E9)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
