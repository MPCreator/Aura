import 'package:aura/core/utils/emotion_gradient.dart';
import 'package:aura/features/emotions/presentation/provider/emotions_ui_provider.dart';
import 'package:flutter/material.dart';
import 'package:aura/core/theme/app_colors.dart';
import 'package:aura/core/theme/dimensions.dart';

import 'package:provider/provider.dart';
import '../widgets/intensity_selector.dart';
import '../widgets/areas_selector.dart';

class EmocionDetalleScreen extends StatelessWidget {
  final String emocion;

  const EmocionDetalleScreen({super.key, required this.emocion});

  @override
  Widget build(BuildContext context) {
    final List<Color> emotionGradient = getEmotionGradient(emocion);
    final Color emotionPrimaryColor = getPrimaryGradientColor(emocion);

    return ChangeNotifierProvider(
      create: (_) => EmocionDetalleProvider(),
      builder: (context, child) {
        return Scaffold(
          backgroundColor: AppColors.backgroundColor,
          appBar: AppBar(
            backgroundColor: AppColors.backgroundColor,
            elevation: 0,
            centerTitle: true,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios_new,
                color: AppColors.primaryColor,
                size: AppSizes.mediumIconSize(context),
              ),
              onPressed: () => Navigator.pop(context),
            ),
            title: Text(
              emocion,
              style: TextStyle(
                color: emotionPrimaryColor,
                fontSize: AppSizes.largeText(context),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppSizes.mediumWidthSpace(context),
                vertical: AppSizes.mediumSpace(context),
              ),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.white,
                ),
                padding: EdgeInsets.all(AppSizes.mediumSpace(context)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IntensitySelector(gradient: emotionGradient),
                    SizedBox(height: AppSizes.mediumSpace(context)),
                    const AreasSelector(),
                    SizedBox(height: AppSizes.largeSpace(context)),
                    ElevatedButton(
                      onPressed: () {
                        final provider = context.read<EmocionDetalleProvider>();
                        final intensidad = provider.intensidad;
                        final areas = provider.areasSeleccionadas;
                        final otro = provider.otroController.text;

                        debugPrint("Emoción: $emocion");
                        debugPrint("Intensidad: $intensidad");
                        debugPrint("Áreas seleccionadas: $areas");
                        debugPrint("Otro: $otro");

                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: emotionPrimaryColor,
                        padding: EdgeInsets.symmetric(
                          horizontal: AppSizes.mediumWidthSpace(context) * 2,
                          vertical: AppSizes.smallSpace(context) * 1.5,
                        ),
                      ),
                      child: Text(
                        "Aceptar",
                        style: TextStyle(color: AppColors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
