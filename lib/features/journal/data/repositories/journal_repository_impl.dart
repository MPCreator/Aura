import 'package:aura/features/journal/data/datasources/journal_local_datasource.dart';
import 'package:aura/features/journal/data/models/journal_model.dart';
import 'package:aura/features/journal/domain/entities/journal.dart';
import 'package:aura/features/journal/domain/repositories/journal_repository.dart';

class DiarioRepositoryImpl implements DiarioRepository {
  final DiarioLocalDataSource diarioLocalDataSource;

  DiarioRepositoryImpl({required this.diarioLocalDataSource});

  @override
  Future<List<Diario>> getAllDiarios() async {
    final result = await diarioLocalDataSource.getAllDiarios();
    return result.map((e) => e.toDomain()).toList();
  }

  @override
  Future<List<Diario>> getDiariosByUserId(int idUsuario) async {
    final result = await diarioLocalDataSource.getDiarioByUserId(idUsuario);
    return result.map((e) => e.toDomain()).toList();
  }

  @override
  Future<List<Diario>> getDiarioById(int id) async {
    final result = await diarioLocalDataSource.getDiarioById(id);
    return result.map((e) => e.toDomain()).toList();
  }

  @override
  Future<int> insertDiario(Diario diario) async {
    final diarioModel = DiarioModel.fromDomain(diario);
    return await diarioLocalDataSource.insertDiario(diarioModel);
  }

  @override
  Future<void> updateDiario(Diario diario) async {
    final diarioModel = DiarioModel.fromDomain(diario);
    await diarioLocalDataSource.updateDiario(diarioModel);
  }

  @override
  Future<void> deleteDiario(int idDiario) async {
    await diarioLocalDataSource.deleteDiario(idDiario);
  }
}
