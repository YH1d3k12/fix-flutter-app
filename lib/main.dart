import 'package:flutter/material.dart';
import 'routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Otimizado',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink),
        textTheme: const TextTheme(bodyMedium: TextStyle(fontSize: 20)),
        useMaterial3: true,
      ),
      // Configuração inicial das rotas da aplicação
      initialRoute: AppRoutes.home,
      routes: AppRoutes.routes,
    );
  }
}