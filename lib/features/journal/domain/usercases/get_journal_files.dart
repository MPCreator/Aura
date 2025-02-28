import 'package:aura/features/journal/domain/entities/journal_file.dart';
import 'package:aura/features/journal/domain/repositories/journal_file_repository.dart';

class GetArchivosDiario {
  final ArchivoDiarioRepository repository;

  GetArchivosDiario(this.repository);

  Future<List<ArchivoDiario>> call() async {
    return await repository.getAllArchivosDiario();
  }
}
