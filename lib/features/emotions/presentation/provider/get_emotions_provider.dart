/*
Este proveedor se encarga de crear y proporcionar la instancia de GetEmociones, que es el caso de uso (Use Case). 
El caso de uso orquesta la lógica de negocio y coordina las interacciones con el repositorio para obtener los datos.
*/

import 'package:aura/features/emotions/domain/usecases/get_emotions.dart';
import 'package:aura/features/emotions/presentation/provider/emotions_repository_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GetEmocionesProvider extends ChangeNotifier {
  final GetEmociones getEmociones;

  GetEmocionesProvider(this.getEmociones);
}

GetEmocionesProvider getEmocionesProvider(BuildContext context) {
  final emocionesRepositoryProvider =
      Provider.of<EmocionesRepositoryProvider>(context, listen: false);
  return GetEmocionesProvider(
      GetEmociones(emocionesRepositoryProvider.emocionesRepository));
}
