import 'package:aura/features/emotions/domain/repositories/emotion_repository.dart';

class GetEmocionesOpciones {
  final EmocionesRepository repository;

  GetEmocionesOpciones(this.repository);

  Future<List<String>> execute() async {
    return await repository.getEmocionesOpciones();
  }
}
