
import 'chemical_element.dart';
import 'translation.dart';

class Fertilizer {
  final int id;
  final String? name;    // fallback
  final String type;
  final String company;
  final List<ChemicalElement> elements;
  final List<Translation> translations;

  Fertilizer({
    required this.id,
    this.name,
    required this.type,
    required this.company,
    required this.elements,
    required this.translations,
  });

  factory Fertilizer.fromJson(Map<String, dynamic> j) => Fertilizer(
        id: j['id'] is int ? j['id'] as int : int.tryParse(j['id'].toString()) ?? 0,
        name: j['name']?.toString(),
        type: j['type']?.toString() ?? '',
        company: j['company']?.toString() ?? '',
        elements: (j['chemical_elements'] as List? ?? [])
            .map((e) => ChemicalElement.fromJson(e))
            .toList(),
        translations: (j['translations'] as List? ?? [])
            .map((t) => Translation.fromJson(t))
            .toList(),
      );

  String nameFor(String locale) {
    if (translations.isNotEmpty) {
      final exact = translations.where((t) => t.locale == locale);
      if (exact.isNotEmpty) {
        final n = exact.first.name.trim();
        if (n.isNotEmpty) return n;
      }
      final any = translations.first.name.trim();
      if (any.isNotEmpty) return any;
    }
    return name ?? 'Bez naziva';
  }

  String? descriptionFor(String locale) {
    if (translations.isNotEmpty) {
      final exact = translations.where((t) => t.locale == locale);
      if (exact.isNotEmpty) {
        final d = exact.first.description.trim();
        if (d.isNotEmpty) return d;
      }
      final any = translations.first.description.trim();
      if (any.isNotEmpty) return any;
    }
    return null;
  }

  String npkLabel() {
    double n = 0, p = 0, k = 0;
    for (final e in elements) {
      final s = e.symbol.toUpperCase();
      if (s == 'N') n = e.percentage;
      if (s == 'P2O5' || s == 'P') p = e.percentage;
      if (s == 'K2O' || s == 'K') k = e.percentage;
    }
    bool allZero = n == 0 && p == 0 && k == 0;
    if (allZero) return '';
    String fmt(double x) => x % 1 == 0 ? x.toStringAsFixed(0) : x.toStringAsFixed(1);
    return '${fmt(n)}-${fmt(p)}-${fmt(k)}';
  }
}
