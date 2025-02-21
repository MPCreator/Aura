import 'package:flutter/material.dart';
import 'package:aura/core/theme/app_colors.dart';

List<Color> getEmotionGradient(String emotion) {
  switch (emotion.toLowerCase()) {
    case 'enojo':
      return AppColors.enojoGradient;
    case 'tristeza':
      return AppColors.tristezaGradient;
    case 'calma':
      return AppColors.calmaGradient;
    case 'felicidad':
      return AppColors.felicidadGradient;
    case 'ansiedad':
      return AppColors.ansiedadGradient;
    default:
      return [Colors.grey, Colors.grey.shade300];
  }
}

Color getPrimaryGradientColor(String emotion) {
  return getEmotionGradient(emotion).first;
}

Color getSecondaryGradientColor(String emotion) {
  return getEmotionGradient(emotion).last;
}
