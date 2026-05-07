import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class GridItemWidget extends StatelessWidget {
  final int index;

  const GridItemWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.pinkAccent,
        borderRadius: BorderRadius.circular(12),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: CachedNetworkImage(
              imageUrl: 'https://picsum.photos/800/600?random=$index',
              memCacheWidth: 400,
              fit: BoxFit.cover,
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            color: Colors.black26,
            child: Text(
              'Item $index',
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}