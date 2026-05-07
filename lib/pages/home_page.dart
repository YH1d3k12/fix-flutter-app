import 'package:flutter/material.dart';
import '../routes/app_routes.dart';
import '../shared/widgets/header.dart';
import '../shared/widgets/footer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HeaderWidget(title: 'VERSÃO OTIMIZADA 🚀'),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          ListTile(
            leading: const Icon(Icons.list),
            title: const Text('Lista Otimizada (ListView.builder)'),
            onTap: () => Navigator.pushNamed(context, AppRoutes.list),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.grid_view),
            title: const Text('Grid Otimizado (GridView.builder)'),
            onTap: () => Navigator.pushNamed(context, AppRoutes.grid),
          ),
        ],
      ),
      bottomNavigationBar: const FooterWidget(),
    );
  }
}