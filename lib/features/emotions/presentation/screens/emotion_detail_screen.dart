import 'package:aura/core/routes/app_routes.dart';
import 'package:aura/core/utils/emotion_gradient.dart';
import 'package:aura/features/emotions/domain/entities/emotion.dart';
import 'package:aura/features/emotions/domain/usecases/insert_emotion.dart';
import 'package:aura/features/emotions/presentation/provider/emotions_ui_provider.dart';
import 'package:flutter/material.dart';
import 'package:aura/core/theme/app_colors.dart';
import 'package:aura/core/theme/dimensions.dart';

import 'package:provider/provider.dart';
import '../widgets/intensity_selector.dart';
import '../widgets/areas_selector.dart';

class EmocionDetalleScreen extends StatefulWidget {
  final String emocionSeleccionada;

  const EmocionDetalleScreen({super.key, required this.emocionSeleccionada});

  @override
  State<EmocionDetalleScreen> createState() => EmocionDetalleScreenState();
}

class EmocionDetalleScreenState extends State<EmocionDetalleScreen> {
  @override
  Widget build(BuildContext context) {
    final List<Color> emotionGradient =
        getEmotionGradient(widget.emocionSeleccionada);
    final Color emotionPrimaryColor =
        getPrimaryGradientColor(widget.emocionSeleccionada);

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
              widget.emocionSeleccionada,
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
                      onPressed: () async {
                        final provider = context.read<EmocionDetalleProvider>();
                        final intensidad = provider.intensidad;
                        final areas = provider.areasSeleccionadas;
                        final otro = provider.otroController.text;

                        // Obtener el ID del usuario
                        final int idUsuario = 1;

                        // Crear la emoción
                        final emocion = Emocion(
                          idUsuario: idUsuario,
                          emocion: widget.emocionSeleccionada,
                          intensidad: intensidad,
                          categoria: areas.isNotEmpty || otro.isNotEmpty
                              ? [...areas, otro].join(', ')
                              : null,
                        );

                        final insertEmocion =
                            Provider.of<InsertEmocion>(context, listen: false);

                        // Guardar referencias necesarias antes del await
                        final messenger = ScaffoldMessenger.of(context);
                        final navigator = Navigator.pushNamed(
                          context,
                          AppRoutes.home,
                        );

                        if (!mounted) return;
                        await insertEmocion.ejecutar(emocion);
                        if (!mounted) return;

                        messenger.showSnackBar(
                          SnackBar(
                              content: Text('Emoción insertada con éxito!')),
                        );
                        navigator;
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
                    )
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
