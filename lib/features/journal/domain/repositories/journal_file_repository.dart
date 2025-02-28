import 'package:aura/features/journal/domain/entities/journal_file.dart';

abstract class ArchivoDiarioRepository {
  Future<List<ArchivoDiario>> getAllArchivosDiario();
  Future<List<ArchivoDiario>> getArchivosDiarioByDiarioId(int idDiario);
  Future<int> insertArchivoDiario(ArchivoDiario diario);
  Future<void> updateArchivoDiario(ArchivoDiario diario);
  Future<void> deleteArchivoDiario(int idDiario);
}
