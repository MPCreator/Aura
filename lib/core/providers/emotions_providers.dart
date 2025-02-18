import 'package:aura/features/emotions/data/repositories/emotions_repository.dart';
import 'package:aura/features/emotions/domain/repositories/emotion_repository.dart';
import 'package:aura/features/emotions/domain/usecases/get_emotions.dart';
import 'package:provider/provider.dart';
import 'package:aura/core/db/dao/emotion_dao.dart';
import 'package:aura/features/emotions/data/datasources/emotions_local_datasource.dart';
import 'package:provider/single_child_widget.dart';

// Función para crear todos los providers
List<SingleChildWidget> createEmocionesProviders() {
  return [
    // Proveedor de EmocionesDao
    Provider<EmocionesDao>(
      create: (_) => EmocionesDao(),
    ),

    // Proveedor del DataSource
    Provider<EmocionesLocalDataSource>(
      create: (context) {
        final emocionesDao = Provider.of<EmocionesDao>(context, listen: false);
        return EmocionesLocalDataSourceImpl(emocionesDao: emocionesDao);
      },
    ),

    // Proveedor del Repositorio
    Provider<EmocionesRepository>(
      create: (context) {
        final emocionesLocalDataSource =
            Provider.of<EmocionesLocalDataSource>(context, listen: false);
        return EmocionesRepositoryImpl(
            emocionesLocalDataSource: emocionesLocalDataSource);
      },
    ),

    // Proveedor del caso de uso (GetEmociones)
    Provider<GetEmociones>(
      create: (context) {
        final emocionesRepository =
            Provider.of<EmocionesRepository>(context, listen: false);
        return GetEmociones(emocionesRepository);
      },
    ),
  ];
}
