import 'package:aura/features/emotions/domain/entities/emotion.dart';

abstract class EmocionesRepository {
  Future<List<Emocion>> getAllEmociones();
  Future<List<Emocion>> getEmocionesByUserId(int idUsuario);
  Future<void> insertEmocion(Emocion emocion);
  Future<void> updateEmocion(Emocion emocion);
  Future<void> deleteEmocion(int idEmocion);
}
