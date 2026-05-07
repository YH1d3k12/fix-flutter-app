import 'package:flutter/material.dart';

class ListItemWidget extends StatelessWidget {
  final int index;

  const ListItemWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Image.network(
            'https://picsum.photos/800/600?random=$index',
            cacheWidth: 800, 
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return const Center(child: CircularProgressIndicator());
            },
          ),
          const SizedBox(height: 12),
          Text('Item $index', style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}