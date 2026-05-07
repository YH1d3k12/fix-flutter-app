import 'package:flutter/material.dart';
import '../pages/home_page.dart';
import '../pages/list_page.dart';
import '../pages/grid_page.dart';

class AppRoutes {
  static const String home = '/';
  static const String list = '/list';
  static const String grid = '/grid';

  static Map<String, WidgetBuilder> get routes => {
        home: (context) => const HomePage(),
        list: (context) => const ListPage(),
        grid: (context) => const GridPage(),
      };
}