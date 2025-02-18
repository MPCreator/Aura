import 'package:aura/features/emotions/domain/entities/emotion.dart';
import 'package:aura/features/emotions/domain/repositories/emotion_repository.dart';

class GetEmociones {
  final EmocionesRepository repository;

  GetEmociones(this.repository);

  Future<List<Emocion>> call() async {
    return await repository.getAllEmociones();
  }
}
