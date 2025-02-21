// EmocionesRepositoryImpl.dart (Infraestructura)
import 'package:aura/features/emotions/data/datasources/emotions_local_datasource.dart';
import 'package:aura/features/emotions/data/models/emotion_model.dart';
import 'package:aura/features/emotions/domain/entities/emotion.dart';
import 'package:aura/features/emotions/domain/repositories/emotion_repository.dart';

class EmocionesRepositoryImpl implements EmocionesRepository {
  final EmocionesLocalDataSource emocionesLocalDataSource;

  EmocionesRepositoryImpl({required this.emocionesLocalDataSource});

  @override
  Future<List<Emocion>> getAllEmociones() async {
    final result = await emocionesLocalDataSource.getAllEmociones();
    return result.map((e) => e.toDomain()).toList();
  }

  @override
  Future<List<Emocion>> getEmocionesByUserId(int idUsuario) async {
    final result =
        await emocionesLocalDataSource.getEmocionesByUserId(idUsuario);
    return result.map((e) => e.toDomain()).toList();
  }

  @override
  Future<void> insertEmocion(Emocion emocion) async {
    final emocionModel = EmocionModel.fromDomain(emocion);
    await emocionesLocalDataSource.insertEmocion(emocionModel);
  }

  @override
  Future<void> updateEmocion(Emocion emocion) async {
    final emocionModel = EmocionModel.fromDomain(emocion);
    await emocionesLocalDataSource.updateEmocion(emocionModel);
  }

  @override
  Future<void> deleteEmocion(int idEmocion) async {
    await emocionesLocalDataSource.deleteEmocion(idEmocion);
  }

  @override
  Future<List<String>> getEmocionesOpciones() async {
    return ['Enojo', 'Tristeza', 'Calma', 'Felicidad', 'Ansiedad'];
  }
}
