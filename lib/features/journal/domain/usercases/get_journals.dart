import 'package:aura/features/journal/domain/entities/journal.dart';
import 'package:aura/features/journal/domain/repositories/journal_repository.dart';

class GetDiarios {
  final DiarioRepository diarioRepository;

  GetDiarios(this.diarioRepository);

  Future<List<Diario>> call(int userId) async {
    return diarioRepository.getDiariosByUserId(userId);
  }
}
