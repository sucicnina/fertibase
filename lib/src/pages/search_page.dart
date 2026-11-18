
import 'package:flutter/material.dart';
import '../data/fertilizer_repository.dart';
import '../models/fertilizer.dart';
import '../utils/filters.dart';
import '../widgets/fertilizer_card.dart';
import 'detail_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Fertilizer> _all = [];
  List<Fertilizer> _filtered = [];

  String q = '';
  String? type;
  String? company;
  final nMinCtrl = TextEditingController();
  final nMaxCtrl = TextEditingController();
  final pMinCtrl = TextEditingController();
  final pMaxCtrl = TextEditingController();
  final kMinCtrl = TextEditingController();
  final kMaxCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    FertilizerRepository.instance.getAll().then((value) {
      setState(() {
        _all = value;
        _filtered = value;
      });
    });
  }

  @override
  void dispose() {
    nMinCtrl.dispose();
    nMaxCtrl.dispose();
    pMinCtrl.dispose();
    pMaxCtrl.dispose();
    kMinCtrl.dispose();
    kMaxCtrl.dispose();
    super.dispose();
  }

  void _apply() {
    double? pD(String s) => s.trim().isEmpty ? null : double.tryParse(s.trim());
    setState(() {
      _filtered = applyFilters(
        _all,
        q: q,
        type: type,
        company: company,
        nMin: pD(nMinCtrl.text),
        nMax: pD(nMaxCtrl.text),
        pMin: pD(pMinCtrl.text),
        pMax: pD(pMaxCtrl.text),
        kMin: pD(kMinCtrl.text),
        kMax: pD(kMaxCtrl.text),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final types = _all.map((e) => e.type).where((e) => e.isNotEmpty).toSet().toList()..sort();
    final companies = _all.map((e) => e.company).where((e) => e.isNotEmpty).toSet().toList()..sort();

    return Scaffold(
      appBar: AppBar(title: const Text('Pretraga')),
      body: _all.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      TextField(
                        decoration: const InputDecoration(prefixIcon: Icon(Icons.search), hintText: 'Pretraži po nazivu ili proizvođaču'),
                        onChanged: (v) {
                          q = v;
                          _apply();
                        },
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            child: DropdownButtonFormField<String>(
                              value: type,
                              isExpanded: true,
                              decoration: const InputDecoration(labelText: 'Vrsta gnojiva'),
                              items: [const DropdownMenuItem(value: null, child: Text('Sve')),
                                ...types.map((t) => DropdownMenuItem(value: t, child: Text(t)))],
                              onChanged: (v) { type = v; _apply(); },
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: DropdownButtonFormField<String>(
                              value: company,
                              isExpanded: true,
                              decoration: const InputDecoration(labelText: 'Proizvođač'),
                              items: [const DropdownMenuItem(value: null, child: Text('Svi')),
                                ...companies.map((c) => DropdownMenuItem(value: c, child: Text(c)))],
                              onChanged: (v) { company = v; _apply(); },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(child: TextField(controller: nMinCtrl, decoration: const InputDecoration(labelText: 'N min'), keyboardType: TextInputType.number)),
                          const SizedBox(width: 8),
                          Expanded(child: TextField(controller: nMaxCtrl, decoration: const InputDecoration(labelText: 'N max'), keyboardType: TextInputType.number)),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(child: TextField(controller: pMinCtrl, decoration: const InputDecoration(labelText: 'P min'), keyboardType: TextInputType.number)),
                          const SizedBox(width: 8),
                          Expanded(child: TextField(controller: pMaxCtrl, decoration: const InputDecoration(labelText: 'P max'), keyboardType: TextInputType.number)),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(child: TextField(controller: kMinCtrl, decoration: const InputDecoration(labelText: 'K min'), keyboardType: TextInputType.number)),
                          const SizedBox(width: 8),
                          Expanded(child: TextField(controller: kMaxCtrl, decoration: const InputDecoration(labelText: 'K max'), keyboardType: TextInputType.number)),
                        ],
                      ),
                    ],
                  ),
                ),
                const Divider(height: 1),
                Expanded(
                  child: ListView.builder(
                    itemCount: _filtered.length,
                    itemBuilder: (context, i) {
                      final f = _filtered[i];
                      return FertilizerCard(
                        fertilizer: f,
                        onTap: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => DetailPage(fertilizer: f),
                        )),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
