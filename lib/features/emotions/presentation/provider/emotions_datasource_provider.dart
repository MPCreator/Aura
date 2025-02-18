/*
Este proveedor se encarga de crear y proporcionar la instancia de EmocionesLocalDataSourceImpl, que es la implementación concreta de EmocionesLocalDataSource. 
Esta clase se conecta con la base de datos o cualquier fuente local de datos para obtener, insertar, actualizar o eliminar emociones.
*/

import 'package:flutter/material.dart';
import 'package:aura/features/emotions/data/datasources/emotions_local_datasource.dart';
import 'package:aura/core/db/dao/emotion_dao.dart';

class EmocionesLocalDataSourceProvider extends ChangeNotifier {
  final EmocionesLocalDataSource emocionesLocalDataSource;

  EmocionesLocalDataSourceProvider(this.emocionesLocalDataSource);
}

EmocionesLocalDataSourceProvider emocionesLocalDataSourceProvider(
    BuildContext context) {
  final emocionesDao = EmocionesDao();

  final emocionesLocalDataSource =
      EmocionesLocalDataSourceImpl(emocionesDao: emocionesDao);

  return EmocionesLocalDataSourceProvider(emocionesLocalDataSource);
}
