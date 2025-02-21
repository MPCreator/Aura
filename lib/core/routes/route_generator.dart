import 'package:aura/features/emotions/presentation/screens/emotion_detail_screen.dart';
import 'package:aura/features/emotions/presentation/screens/emotion_screen.dart';
import 'package:aura/shared/presentation/home_screen.dart';
import 'package:flutter/material.dart';
import 'app_routes.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case AppRoutes.login:
      //return MaterialPageRoute(builder: (_) => LoginScreen());
      case AppRoutes.emotionSelector:
        return MaterialPageRoute(builder: (_) => EmocionesScreen());
      case AppRoutes.emotionDetail:
        if (args is String) {
          return MaterialPageRoute(
            builder: (_) => EmocionDetalleScreen(emocionSeleccionada: args),
          );
        }
        return _errorRoute();
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('Ruta no encontrada'),
        ),
      ),
    );
  }
}
