import 'package:aura/features/journal/domain/entities/journal.dart';

abstract class DiarioRepository {
  Future<List<Diario>> getAllDiarios();
  Future<List<Diario>> getDiarioByUserId(int idUsuario);
  Future<void> insertDiario(Diario diario);
  Future<void> updateDiario(Diario diario);
  Future<void> deleteDiario(int idDiario);
}
