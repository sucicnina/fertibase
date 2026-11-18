
import '../models/fertilizer.dart';

List<Fertilizer> applyFilters(
  List<Fertilizer> all, {
  String q = '',
  String? type,
  String? company,
  double? nMin,
  double? nMax,
  double? pMin,
  double? pMax,
  double? kMin,
  double? kMax,
  Set<String> mustContainElements = const {},
  String locale = 'hr',
}) {
  bool inRange(double v, double? lo, double? hi) => (lo == null || v >= lo) && (hi == null || v <= hi);

  return all.where((f) {
    final name = f.nameFor(locale).toLowerCase();
    final matchQ = q.isEmpty ||
        name.contains(q.toLowerCase()) ||
        f.company.toLowerCase().contains(q.toLowerCase());

    final matchType = type == null || f.type == type;
    final matchCompany = company == null || f.company == company;

    double n = 0, p = 0, k = 0;
    for (final e in f.elements) {
      final s = e.symbol.toUpperCase();
      if (s == 'N') n = e.percentage;
      if (s == 'P2O5' || s == 'P') p = e.percentage;
      if (s == 'K2O' || s == 'K') k = e.percentage;
    }
    final matchN = inRange(n, nMin, nMax);
    final matchP = inRange(p, pMin, pMax);
    final matchK = inRange(k, kMin, kMax);

    final haveAllElems = mustContainElements.every(
      (sought) => f.elements.any((e) => e.symbol.toUpperCase() == sought.toUpperCase()),
    );

    return matchQ && matchType && matchCompany && matchN && matchP && matchK && haveAllElems;
  }).toList();
}
