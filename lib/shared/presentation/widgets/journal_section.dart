import 'package:aura/core/routes/app_routes.dart';
import 'package:aura/core/utils/date_utils.dart';
import 'package:aura/features/journal/domain/entities/journal.dart';
import 'package:aura/features/journal/presentation/provider/journals_ui_provider.dart';
import 'package:flutter/material.dart';
import 'package:aura/core/theme/app_colors.dart';
import 'package:aura/core/theme/dimensions.dart';
import 'package:provider/provider.dart';

class JournalSection extends StatelessWidget {
  const JournalSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSizes.customSizeWidth(context, 0.90),
      height: AppSizes.customSizeHeight(context, 0.20),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: AppSizes.customSizeHeight(context, 0.018),
            child: Container(
              height: AppSizes.customSizeHeight(context, 0.15),
              width: AppSizes.customSizeWidth(context, 0.88),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: AppColors.textTertiary.withValues(alpha: 0.4),
              ),
            ),
          ),

          // Botón interactivo
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.journalList);
            },
            child: Container(
              height: AppSizes.customSizeHeight(context, 0.15),
              width: AppSizes.customSizeWidth(context, 0.9),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: AppColors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                  ),
                ],
                image: const DecorationImage(
                  image: AssetImage('assets/imagenes/diario/playa.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(AppSizes.smallSpace(context)),
                child: Consumer<DiarioProvider>(
                  builder: (context, diarioProvider, child) {
                    final Diario? latestDiario = diarioProvider.latestDiario;
                    String monthText = 'Sin datos';
                    if (latestDiario != null) {
                      try {
                        final parsedDate =
                            DateFormatter.parseDate(latestDiario.fecha);
                        monthText = DateFormatter.formatMonth(parsedDate);
                      } catch (e) {
                        monthText = 'Fecha inválida';
                      }
                    }
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          monthText,
                          style: TextStyle(
                            fontSize: AppSizes.mediumText(context),
                            fontWeight: FontWeight.bold,
                            color: AppColors.black,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
