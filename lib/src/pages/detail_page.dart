
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';
import '../models/fertilizer.dart';
import '../state/favorites_model.dart';

class DetailPage extends StatelessWidget {
  final Fertilizer fertilizer;
  const DetailPage({super.key, required this.fertilizer});

  @override
  Widget build(BuildContext context) {
    final fav = context.watch<FavoritesModel>();
    final isFav = fav.isFavorite(fertilizer.id);

    final desc = fertilizer.descriptionFor('hr');
    return Scaffold(
      appBar: AppBar(
        title: Text(fertilizer.nameFor('hr')),
        actions: [
          IconButton(
            icon: Icon(isFav ? Icons.favorite : Icons.favorite_border),
            onPressed: () => fav.toggle(fertilizer.id),
            tooltip: isFav ? 'Ukloni iz favorita' : 'Dodaj u favorite',
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (fertilizer.npkLabel().isNotEmpty)
              Text('N-P-K: ${fertilizer.npkLabel()}', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: fertilizer.elements.map((e) => Chip(label: Text('${e.symbol} ${e.percentage}%'))).toList(),
            ),
            const SizedBox(height: 16),
            if (desc != null && desc.isNotEmpty)
              Html(data: desc)
            else
              const Text('Nema opisa.'),
          ],
        ),
      ),
    );
  }
}
