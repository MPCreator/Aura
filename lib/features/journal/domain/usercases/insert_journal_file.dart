import 'package:aura/features/journal/domain/entities/journal_file.dart';
import 'package:aura/features/journal/domain/repositories/journal_file_repository.dart';

class InsertArchivoDiario {
  final ArchivoDiarioRepository repository;

  InsertArchivoDiario(this.repository);

  Future<int> ejecutar(ArchivoDiario archivo) {
    return repository.insertArchivoDiario(archivo);
  }
}
