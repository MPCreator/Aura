import 'package:aura/core/providers/app_providers.dart';
import 'package:aura/core/routes/app_routes.dart';
import 'package:aura/core/routes/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('es_ES', null);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: createAppProviders(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Aluna',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: AppRoutes.home,
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
