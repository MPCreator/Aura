import 'package:aura/core/db/dao/journal_dao.dart';
import 'package:aura/features/journal/data/models/journal_model.dart';

abstract class DiarioLocalDataSource {
  Future<List<DiarioModel>> getAllDiarios();
  Future<List<DiarioModel>> getDiarioByUserId(int idUsuario);
  Future<List<DiarioModel>> getDiarioById(int id);
  Future<int> insertDiario(DiarioModel diario);
  Future<int> updateDiario(DiarioModel diario);
  Future<int> deleteDiario(int idDiario);
}

class DiarioLocalDataSourceImpl implements DiarioLocalDataSource {
  final DiarioDao diarioDao;

  DiarioLocalDataSourceImpl({required this.diarioDao});

  @override
  Future<List<DiarioModel>> getAllDiarios() async {
    final result = await diarioDao.getAllDiarios();
    return result.map((e) => DiarioModel.fromMap(e)).toList();
  }

  @override
  Future<List<DiarioModel>> getDiarioByUserId(int idUsuario) async {
    final result = await diarioDao.getDiariosByUserId(idUsuario);
    return result.map((e) => DiarioModel.fromMap(e)).toList();
  }

  @override
  Future<List<DiarioModel>> getDiarioById(int id) async {
    final result = await diarioDao.getDiarioById(id);
    return result.map((e) => DiarioModel.fromMap(e)).toList();
  }

  @override
  Future<int> insertDiario(DiarioModel diario) async {
    return await diarioDao.insertDiario(diario.toMap());
  }

  @override
  Future<int> updateDiario(DiarioModel diario) async {
    return await diarioDao.updateDiario(diario.idDiario!, diario.toMap());
  }

  @override
  Future<int> deleteDiario(int idDiario) async {
    return await diarioDao.deleteDiario(idDiario);
  }
}
