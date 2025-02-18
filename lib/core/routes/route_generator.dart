import 'package:flutter/material.dart';
import 'app_routes.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case AppRoutes.home:
      //return MaterialPageRoute(builder: (_) => HomeScreen());
      case AppRoutes.login:
      //return MaterialPageRoute(builder: (_) => LoginScreen());
      case AppRoutes.details:
        if (args is String) {
          //return MaterialPageRoute(builder: (_) => DetailsScreen(data: args),);
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
