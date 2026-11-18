
import 'package:flutter/material.dart';
import '../models/fertilizer.dart';

class FertilizerCard extends StatelessWidget {
  final Fertilizer fertilizer;
  final VoidCallback? onTap;
  const FertilizerCard({super.key, required this.fertilizer, this.onTap});

  @override
  Widget build(BuildContext context) {
    final npk = fertilizer.npkLabel();
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: ListTile(
        onTap: onTap,
        title: Text(fertilizer.nameFor('hr'), maxLines: 1, overflow: TextOverflow.ellipsis),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (npk.isNotEmpty) Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text('N-P-K: $npk'),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(fertilizer.company),
            ),
          ],
        ),
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }
}
