import 'package:aura/features/emotions/presentation/provider/emotions_ui_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/dimensions.dart';

class IntensitySelector extends StatelessWidget {
  final List<Color> gradient;

  const IntensitySelector({
    super.key,
    required this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<EmocionDetalleProvider>(context);
    final intensidadActual = provider.intensidad;

    return Column(
      children: [
        Text(
          "Intensidad",
          style: TextStyle(
            fontSize: AppSizes.largeText(context),
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        SizedBox(height: AppSizes.mediumSpace(context)),

        // Escala de intensidad (vertical)
        Column(
          children: List.generate(5, (index) {
            // Nivel 5 corresponde al primer cuadro y 1 al último.
            final nivel = 5 - index;
            final estaSeleccionado = nivel <= intensidadActual;
            // Calcular la interpolación:
            // t = 0 para nivel 1 (más claro) y t = 1 para nivel 5 (más intenso)
            final double t = (nivel - 1) / 4;
            final Color barColor =
                Color.lerp(gradient.last, gradient.first, t)!;

            return GestureDetector(
              onTap: () => provider.intensidad = nivel,
              child: Container(
                margin: EdgeInsets.only(
                  bottom: AppSizes.smallSpace(context),
                ),
                width: AppSizes.screenWidth(context) * 0.5,
                height: AppSizes.screenHeight(context) * 0.04,
                decoration: BoxDecoration(
                  color: estaSeleccionado ? barColor : AppColors.secondaryColor,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}
