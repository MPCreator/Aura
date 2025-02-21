import 'package:flutter/material.dart';
import 'package:aura/core/theme/app_colors.dart';
import 'package:aura/core/theme/dimensions.dart';

class JournalSection extends StatelessWidget {
  const JournalSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSizes.customSizeHeight(context, 0.15),
      width: AppSizes.customSizeWidth(context, 0.9),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSizes.smallSpace(context)),
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
          ),
        ],
        image: DecorationImage(
          image: AssetImage('assets/imagenes/diario/playa.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(AppSizes.smallSpace(context)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Agosto',
              style: TextStyle(
                fontSize: AppSizes.mediumText(context),
                fontWeight: FontWeight.bold,
                color: AppColors.black,
              ),
            ),
            SizedBox(height: AppSizes.smallSpace(context)),
            Text(
              '15 días',
              style: TextStyle(
                fontSize: AppSizes.smallText(context),
                color: AppColors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
