import 'package:aura/features/journal/domain/entities/journal.dart';

abstract class DiarioRepository {
  Future<List<Diario>> getAllDiarios();
  Future<List<Diario>> getDiariosByUserId(int idUsuario);
  Future<List<Diario>> getDiarioById(int id);
  Future<int> insertDiario(Diario diario);
  Future<void> updateDiario(Diario diario);
  Future<void> deleteDiario(int idDiario);
}
