import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/fertilizer_repository.dart';
import '../models/fertilizer.dart';
import '../state/favorites_model.dart';
import '../widgets/fertilizer_card.dart';
import 'detail_page.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final fav = context.watch<FavoritesModel>();
    return FutureBuilder<List<Fertilizer>>(
      future: FertilizerRepository.instance.getAll(),
      builder: (context, snap) {
        if (snap.connectionState != ConnectionState.done) {
          return const Center(child: CircularProgressIndicator());
        }
        final all = snap.data ?? [];
        final items = all.where((f) => fav.ids.contains(f.id)).toList();
        return Scaffold(
          appBar: AppBar(title: const Text('Favoriti')),
          body: items.isEmpty
              ? const Center(child: Text('Još nema spremljenih gnojiva.'))
              : ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, i) {
                    final f = items[i];
                    return FertilizerCard(
                      fertilizer: f,
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => DetailPage(fertilizer: f),
                      )),
                    );
                  },
                ),
        );
      },
    );
  }
}
