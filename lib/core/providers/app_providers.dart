// core/providers/app_providers.dart
import 'package:aura/features/emotions/presentation/provider/emotions_provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> createAppProviders() {
  return [
    ...createEmotionsProviders(),
    //Agregar más providers
  ];
}
