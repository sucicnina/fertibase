
import 'package:flutter/material.dart';
import '../data/fertilizer_repository.dart';
import '../models/fertilizer.dart';
import '../widgets/fertilizer_card.dart';
import 'detail_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Fertilizer>>(
      future: FertilizerRepository.instance.getAll(),
      builder: (context, snap) {
        if (snap.connectionState != ConnectionState.done) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snap.hasError) {
          return Center(child: Text('Greška: ${snap.error}'));
        }
        final items = snap.data ?? [];
        return CustomScrollView(
          slivers: [
            const SliverAppBar(
              pinned: true,
              title: Text('Gnojiva'),
            ),
            SliverList.builder(
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
            )
          ],
        );
      },
    );
  }
}
