import 'package:aura/features/emotions/domain/entities/emotion.dart';
import 'package:aura/features/emotions/domain/repositories/emotion_repository.dart';

class InsertEmocion {
  final EmocionesRepository repository;

  InsertEmocion(this.repository);

  Future<void> ejecutar(Emocion emocion) async {
    await repository.insertEmocion(emocion);
  }
}
