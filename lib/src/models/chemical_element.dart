
class ChemicalElement {
  final String symbol;
  final double percentage;

  ChemicalElement({required this.symbol, required this.percentage});

  factory ChemicalElement.fromJson(Map<String, dynamic> j) {
    final raw = j['percentage'];
    final p = (raw is num) ? raw.toDouble() : double.tryParse(raw.toString()) ?? 0.0;
    return ChemicalElement(symbol: j['symbol']?.toString() ?? '', percentage: p);
  }
}
