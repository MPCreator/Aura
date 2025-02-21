import 'package:aura/core/routes/app_routes.dart';
import 'package:aura/core/theme/app_colors.dart';
import 'package:aura/core/theme/dimensions.dart';
import 'package:aura/features/emotions/presentation/provider/emotions_ui_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/emotions_selector_widgets.dart';

class EmocionesScreen extends StatelessWidget {
  const EmocionesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: Transform.rotate(
            angle: 3.14159, // 180 grados en radianes
            child: Icon(
              Icons.arrow_forward_ios_outlined,
              color: AppColors.iconColor,
              size: AppSizes.mediumIconSize(context),
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Consumer<EmocionesProvider>(
        builder: (context, emocionesProvider, child) {
          if (emocionesProvider.emocionSeleccionada == null) {
            return const Center(child: CircularProgressIndicator());
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "¿Cómo te sentiste\n hoy?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: AppSizes.extraLargeText(context),
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              SizedBox(height: AppSizes.mediumSpace(context)),
              buildEmotionCircle(emocionesProvider.emocionSeleccionada),
              SizedBox(height: AppSizes.largeSpace(context)),
              Text(
                "Siento ${emocionesProvider.emocionSeleccionada}",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: AppSizes.largeText(context),
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              SizedBox(height: AppSizes.largeSpace(context)),
              buildEmotionSelector(emocionesProvider),
              SizedBox(height: AppSizes.largeSpace(context)),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.emotionDetail,
                    arguments: emocionesProvider.emocionSeleccionada,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                ),
                child: const Text("Aceptar",
                    style: TextStyle(color: Colors.white)),
              ),
            ],
          );
        },
      ),
    );
  }
}
