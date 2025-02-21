import 'package:aura/features/emotions/presentation/provider/emotions_ui_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/dimensions.dart';

class AreasSelector extends StatelessWidget {
  const AreasSelector({super.key});

  // Áreas que se muestran como chips
  final List<String> _areas = const [
    'Salud',
    'Trabajo',
    'Relaciones',
    'Familia',
    'Economía',
    'Pensamientos',
  ];

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<EmocionDetalleProvider>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "¿Qué área más te representan? (opcional)",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: AppSizes.mediumText(context),
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        SizedBox(height: AppSizes.mediumSpace(context)),

        // Chips de áreas
        Wrap(
          spacing: AppSizes.smallWidthSpace(context),
          runSpacing: AppSizes.smallSpace(context),
          alignment: WrapAlignment.center,
          children: _areas.map((area) {
            final estaSeleccionada = provider.areasSeleccionadas.contains(area);

            return ChoiceChip(
              label: Text(area),
              selected: estaSeleccionada,
              onSelected: (seleccionado) => provider.toggleArea(area),
              selectedColor: AppColors.primaryColor,
              backgroundColor: AppColors.secondaryColor,
              labelStyle: TextStyle(
                color:
                    estaSeleccionada ? AppColors.white : AppColors.textPrimary,
              ),
            );
          }).toList(),
        ),
        SizedBox(height: AppSizes.mediumSpace(context)),

        // Campo "Otro"
        TextField(
          controller: provider.otroController,
          decoration: InputDecoration(
            labelText: "Otro",
            labelStyle: TextStyle(color: AppColors.textSecondary),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.textSecondary,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.primaryColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
