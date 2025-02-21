import 'package:aura/core/db/dao/emotion_dao.dart';
import 'package:aura/features/emotions/data/models/emotion_model.dart';

abstract class EmocionesLocalDataSource {
  Future<List<EmocionModel>> getAllEmociones();
  Future<List<EmocionModel>> getEmocionesByUserId(int idUsuario);
  Future<int> insertEmocion(EmocionModel emocion);
  Future<int> updateEmocion(EmocionModel emocion);
  Future<int> deleteEmocion(int idEmocion);
}

class EmocionesLocalDataSourceImpl implements EmocionesLocalDataSource {
  final EmocionesDao emocionesDao;

  EmocionesLocalDataSourceImpl({required this.emocionesDao});

  @override
  Future<List<EmocionModel>> getAllEmociones() async {
    final result = await emocionesDao.getAllEmociones();
    return result.map((e) => EmocionModel.fromMap(e)).toList();
  }

  @override
  Future<List<EmocionModel>> getEmocionesByUserId(int idUsuario) async {
    final result = await emocionesDao.getEmocionesByUserId(idUsuario);
    return result.map((e) => EmocionModel.fromMap(e)).toList();
  }

  @override
  Future<int> insertEmocion(EmocionModel emocion) async {
    return await emocionesDao.insertEmocion(emocion.toMap());
  }

  @override
  Future<int> updateEmocion(EmocionModel emocion) async {
    return await emocionesDao.updateEmocion(
        emocion.idEmocion!, emocion.toMap());
  }

  @override
  Future<int> deleteEmocion(int idEmocion) async {
    return await emocionesDao.deleteEmocion(idEmocion);
  }
}
