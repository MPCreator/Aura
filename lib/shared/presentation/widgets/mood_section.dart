import 'package:aura/core/routes/app_routes.dart';
import 'package:aura/core/theme/app_colors.dart';
import 'package:aura/core/theme/dimensions.dart';
import 'package:flutter/material.dart';

class MoodSection extends StatelessWidget {
  const MoodSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MoodButton(
          text: 'Ánimo',
          icon: Icons.favorite,
          color: AppColors.backgroundColor,
          onPressed: () {
            Navigator.pushNamed(context, AppRoutes.emotionSelector);
          },
        ),
        MoodButton(
          text: '¿Necesitas\n hablar?',
          icon: Icons.pets,
          color: AppColors.iconColor,
          onPressed: () {
            debugPrint("Botón de ¿Necesitas hablar? presionado");
          },
        ),
      ],
    );
  }
}

class MoodButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color color;
  final VoidCallback onPressed;

  const MoodButton({
    super.key,
    required this.text,
    required this.icon,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final double buttonSize = AppSizes.customSizeWidth(context, 0.4);

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.smallSpace(context)),
        ),
        padding: EdgeInsets.zero,
        maximumSize: Size(buttonSize, buttonSize),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: AppSizes.mediumText(context),
                fontWeight: FontWeight.bold,
                color: color == AppColors.backgroundColor
                    ? AppColors.black
                    : AppColors.white,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: AppSizes.smallSpace(context)),
            Icon(icon,
                color: color == AppColors.backgroundColor
                    ? AppColors.iconColor
                    : AppColors.white,
                size: AppSizes.mediumIconSize(context)),
          ],
        ),
      ),
    );
  }
}
