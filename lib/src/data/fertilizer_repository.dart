import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import '../models/fertilizer.dart';

class FertilizerRepository {
  FertilizerRepository._();
  static final FertilizerRepository instance = FertilizerRepository._();

  List<Fertilizer>? _cache;

  Future<List<Fertilizer>> getAll() async {
    if (_cache != null) return _cache!;
    final raw = await rootBundle.loadString('assets/fertilizers.json');
    final obj = json.decode(raw);
    final list =
        (obj['data'] as List).map((e) => Fertilizer.fromJson(e)).toList();
    _cache = list;
    return list;
  }
}
