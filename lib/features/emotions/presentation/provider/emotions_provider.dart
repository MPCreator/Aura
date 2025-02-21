import 'package:aura/features/emotions/domain/repositories/emotion_repository.dart';
import 'package:aura/features/emotions/domain/usecases/get_emotions_options.dart';
import 'package:aura/features/emotions/presentation/provider/emotions_ui_provider.dart';
import 'package:provider/provider.dart';
import 'package:aura/features/emotions/data/datasources/emotions_local_datasource.dart';
import 'package:aura/features/emotions/data/repositories/emotions_repository.dart';
import 'package:aura/features/emotions/domain/usecases/get_emotions.dart';
import 'package:aura/core/db/dao/emotion_dao.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> createEmotionsProviders() {
  return [
    Provider<EmocionesDao>(create: (_) => EmocionesDao()),
    Provider<EmocionesLocalDataSource>(
      create: (context) => EmocionesLocalDataSourceImpl(
        emocionesDao: Provider.of<EmocionesDao>(context, listen: false),
      ),
    ),
    Provider<EmocionesRepository>(
      create: (context) => EmocionesRepositoryImpl(
        emocionesLocalDataSource:
            Provider.of<EmocionesLocalDataSource>(context, listen: false),
      ),
    ),

    //Casos de uso
    Provider<GetEmociones>(
      create: (context) => GetEmociones(
        Provider.of<EmocionesRepository>(context, listen: false),
      ),
    ),
    Provider<GetEmocionesOpciones>(
      create: (context) => GetEmocionesOpciones(
        Provider.of<EmocionesRepository>(context, listen: false),
      ),
    ),

    //Providers de UI
    ChangeNotifierProvider<EmocionesProvider>(
      create: (context) => EmocionesProvider(
        Provider.of<GetEmocionesOpciones>(context, listen: false),
      ),
    ),

    ChangeNotifierProvider<EmocionDetalleProvider>(
      create: (context) => EmocionDetalleProvider(),
    ),
  ];
}
