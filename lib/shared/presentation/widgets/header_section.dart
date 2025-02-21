import 'package:flutter/material.dart';
import 'package:aura/core/theme/app_colors.dart';
import 'package:aura/core/theme/dimensions.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: AppSizes.largeIconSize(context),
          backgroundColor: Colors.purple,
        ),
        SizedBox(height: AppSizes.smallSpace(context)),
        Text(
          '¡Buenos días, Luyo!',
          style: TextStyle(
            fontSize: AppSizes.largeText(context),
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        Text(
          'Conviértete en el cambio que deseas ver en el mundo',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: AppSizes.mediumText(context),
            color: AppColors.textSecondary,
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
