class GetTipoArchivo {
  String obtenerTipoArchivo(String path) {
    final extension = path.split('.').last.toLowerCase();
    if (['jpg', 'jpeg', 'png'].contains(extension)) return 'imagen';
    if (['mp3', 'wav'].contains(extension)) return 'audio';
    return 'otro';
  }
}
