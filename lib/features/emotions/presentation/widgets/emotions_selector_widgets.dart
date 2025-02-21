import 'package:aura/core/theme/app_colors.dart';
import 'package:aura/core/utils/emotion_gradient.dart';
import 'package:aura/features/emotions/presentation/provider/emotions_ui_provider.dart';
import 'package:flutter/material.dart';

Widget buildEmotionCircle(String? emocion) {
  List<Color> gradient = getEmotionGradient(emocion!);
  return Container(
    width: 300,
    height: 300,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      gradient: LinearGradient(
        colors: gradient,
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    ),
  );
}

Widget buildEmotionSelector(EmocionesProvider emocionesProvider) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: emocionesProvider.emociones.map((emocion) {
      bool isSelected = emocionesProvider.emocionSeleccionada == emocion;
      return GestureDetector(
        onTap: () => emocionesProvider.seleccionarEmocion(emocion),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          width: 60,
          height: 30,
          decoration: BoxDecoration(
            color: isSelected ? AppColors.black : AppColors.textTertiary,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      );
    }).toList(),
  );
}
