import 'package:aura/features/journal/data/datasources/journal_file_local_datasource.dart';
import 'package:aura/features/journal/data/models/journal_file_model.dart';
import 'package:aura/features/journal/domain/entities/journal_file.dart';
import 'package:aura/features/journal/domain/repositories/journal_file_repository.dart';

class ArchivoDiarioRepositoryImpl implements ArchivoDiarioRepository {
  final ArchivoDiarioLocalDataSource archivoDiarioLocalDataSource;

  ArchivoDiarioRepositoryImpl({required this.archivoDiarioLocalDataSource});

  @override
  Future<List<ArchivoDiario>> getAllArchivosDiario() async {
    final result = await archivoDiarioLocalDataSource.getAllArchivosDiario();
    return result.map((e) => e.toDomain()).toList();
  }

  @override
  Future<List<ArchivoDiario>> getArchivosDiarioByDiarioId(int idDiario) async {
    final result = await archivoDiarioLocalDataSource
        .getArchivosDiarioByDiarioId(idDiario);
    return result.map((e) => e.toDomain()).toList();
  }

  @override
  Future<int> insertArchivoDiario(ArchivoDiario archivoDiario) async {
    final archivoDiarioModel = ArchivoDiarioModel.fromDomain(archivoDiario);
    return await archivoDiarioLocalDataSource
        .insertArchivoDiario(archivoDiarioModel);
  }

  @override
  Future<void> updateArchivoDiario(ArchivoDiario archivoDiario) async {
    final archivoDiarioModel = ArchivoDiarioModel.fromDomain(archivoDiario);
    await archivoDiarioLocalDataSource.updateArchivoDiario(archivoDiarioModel);
  }

  @override
  Future<void> deleteArchivoDiario(int idArchivoDiario) async {
    await archivoDiarioLocalDataSource.deleteArchivoDiario(idArchivoDiario);
  }
}
