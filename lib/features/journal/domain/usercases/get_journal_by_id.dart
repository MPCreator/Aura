import 'package:aura/features/journal/domain/entities/journal.dart';
import 'package:aura/features/journal/domain/repositories/journal_repository.dart';

class GetDiarioById {
  final DiarioRepository repository;

  GetDiarioById(this.repository);

  Future<List<Diario>> call(id) async {
    return await repository.getDiarioById(id);
  }
}
