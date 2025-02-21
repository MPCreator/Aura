import 'package:aura/core/db/dao/journal_file_dao.dart';
import 'package:aura/features/journal/data/models/journal_file_model.dart';

abstract class ArchivoDiarioLocalDataSource {
  Future<List<ArchivoDiarioModel>> getAllArchivoDiario();
  Future<List<ArchivoDiarioModel>> getArchivoDiarioByUserId(int idUsuario);
  Future<int> insertArchivoDiario(ArchivoDiarioModel archivoDiario);
  Future<int> updateArchivoDiario(ArchivoDiarioModel archivoDiario);
  Future<int> deleteArchivoDiario(int idArchivoDiario);
}

class ArchivoDiarioLocalDataSourceImpl implements ArchivoDiarioLocalDataSource {
  final ArchivoDiarioDao archivoDiarioDao;

  ArchivoDiarioLocalDataSourceImpl({required this.archivoDiarioDao});

  @override
  Future<List<ArchivoDiarioModel>> getAllArchivoDiario() async {
    final result = await archivoDiarioDao.getAllArchivosDiarios();
    return result.map((e) => ArchivoDiarioModel.fromMap(e)).toList();
  }

  @override
  Future<List<ArchivoDiarioModel>> getArchivoDiarioByUserId(
      int idUsuario) async {
    final result = await archivoDiarioDao.getArchivosDiariosByUserId(idUsuario);
    return result.map((e) => ArchivoDiarioModel.fromMap(e)).toList();
  }

  @override
  Future<int> insertArchivoDiario(ArchivoDiarioModel archivoDiario) async {
    return await archivoDiarioDao.insertArchivoDiario(archivoDiario.toMap());
  }

  @override
  Future<int> updateArchivoDiario(ArchivoDiarioModel archivoDiario) async {
    return await archivoDiarioDao.updateArchivoDiario(
        archivoDiario.idArchivoDiario!, archivoDiario.toMap());
  }

  @override
  Future<int> deleteArchivoDiario(int idArchivoDiario) async {
    return await archivoDiarioDao.deleteArchivoDiario(idArchivoDiario);
  }
}
