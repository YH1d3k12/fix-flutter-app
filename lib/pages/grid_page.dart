import 'package:flutter/material.dart';
import '../shared/widgets/footer.dart';
import '../shared/widgets/header.dart';
import '../shared/widgets/grid_item.dart';

class GridPage extends StatelessWidget {
  const GridPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HeaderWidget(title: 'BOM — GridView.builder'),
      body: GridView.builder(
        padding: const EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: 200,
        itemBuilder: (context, index) {
          return GridItemWidget(index: index);
        },
      ),
      bottomNavigationBar: const FooterWidget(),
    );
  }
}