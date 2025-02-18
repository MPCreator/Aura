/*
Este proveedor se encarga de crear y proporcionar la instancia de EmocionesRepositoryImpl, que es la implementación concreta de EmocionesRepository. 
El repositorio actúa como una capa intermedia entre el caso de uso y el datasource, gestionando cómo obtener o almacenar datos de la fuente 
*/

import 'package:aura/features/emotions/data/repositories/emotions_repository.dart';
import 'package:aura/features/emotions/presentation/provider/emotions_datasource_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EmocionesRepositoryProvider extends ChangeNotifier {
  final EmocionesRepositoryImpl emocionesRepository;

  EmocionesRepositoryProvider(this.emocionesRepository);
}

EmocionesRepositoryProvider emocionesRepositoryProvider(BuildContext context) {
  final emocionesLocalDataSource =
      Provider.of<EmocionesLocalDataSourceProvider>(context, listen: false);
  return EmocionesRepositoryProvider(EmocionesRepositoryImpl(
      emocionesLocalDataSource:
          emocionesLocalDataSource.emocionesLocalDataSource));
}
