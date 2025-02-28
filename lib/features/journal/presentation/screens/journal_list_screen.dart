import 'package:aura/core/routes/app_routes.dart';
import 'package:aura/core/theme/app_colors.dart';
import 'package:aura/core/theme/dimensions.dart';
import 'package:aura/features/journal/presentation/provider/journals_ui_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListaDiarioScreen extends StatefulWidget {
  const ListaDiarioScreen({super.key});

  @override
  State<ListaDiarioScreen> createState() => _ListaDiarioScreenState();
}

class _ListaDiarioScreenState extends State<ListaDiarioScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final diarioProvider = context.read<DiarioProvider>();
      final int userId = 1;
      diarioProvider.fetchDiariosByUser(userId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final diarioProvider = context.watch<DiarioProvider>();

    // Manejamos estados de carga/error
    if (diarioProvider.isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (diarioProvider.errorMessage != null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Diarios"),
        ),
        body: Center(
          child: Text(diarioProvider.errorMessage!),
        ),
      );
    }

    final diariosPorMes = diarioProvider.diariosPorMes;

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: Text(
          'Diarios',
          style: TextStyle(
            fontSize: AppSizes.mediumText(context),
            color: AppColors.textPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.iconColor),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.calendar_today,
              color: AppColors.iconColor,
            ),
            onPressed: () {
              // Filtros
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.mediumWidthSpace(context),
          vertical: AppSizes.mediumSpace(context),
        ),
        child: Column(
          children: [
            // Año (podrías hacerlo dinámico si lo deseas)
            Center(
              child: Text(
                "2024",
                style: TextStyle(
                  fontSize: AppSizes.largeText(context),
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
            ),
            SizedBox(height: AppSizes.largeSpace(context)),

            ...diariosPorMes.entries.map((entry) {
              final mes = entry.key;
              final diariosDelMes = entry.value;

              final widgetsMes = diariosDelMes.map((diario) {
                return _buildImageCard(
                  context,
                  "https://images.unsplash.com/photo-1526312426976-f4d754fa9bd6",
                );
              }).toList();

              return _buildTimelineMonth(
                context,
                mes,
                widgetsMes,
                isLast: mes == diariosPorMes.keys.last,
              );
            }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryColor,
        child: const Icon(
          Icons.add,
          color: AppColors.backgroundColor,
        ),
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.journalEntry);
        },
      ),
    );
  }

  Widget _buildTimelineMonth(
    BuildContext context,
    String mes,
    List<Widget> entradasMes, {
    bool isLast = false,
  }) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: AppSizes.smallSpace(context)),
                  width: 14,
                  height: 14,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    shape: BoxShape.circle,
                  ),
                ),
                if (!isLast)
                  Container(
                    width: 2,
                    height: 100,
                    color: AppColors.primaryColor,
                  ),
              ],
            ),
            SizedBox(width: AppSizes.mediumWidthSpace(context)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    mes,
                    style: TextStyle(
                      fontSize: AppSizes.mediumText(context),
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  SizedBox(height: AppSizes.smallSpace(context)),
                  ...entradasMes.map(
                    (entrada) => Padding(
                      padding: EdgeInsets.only(
                        bottom: AppSizes.mediumSpace(context),
                      ),
                      child: entrada,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildImageCard(BuildContext context, String imageUrl) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.network(
        imageUrl,
        height: 120,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}
