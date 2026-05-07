import 'package:flutter/material.dart';
import '../shared/widgets/footer.dart';
import '../shared/widgets/header.dart';
import '../shared/widgets/list_item.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HeaderWidget(title: 'BOM — ListView.builder'),
      body: ListView.builder(
        itemCount: 200,
        itemBuilder: (context, index) {
          return ListItemWidget(index: index);
        },
      ),
      bottomNavigationBar: const FooterWidget(),
    );
  }
}