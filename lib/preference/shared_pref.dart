import 'dart:math';

import 'package:flutter_storage_benchmark/benchmark.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> sharedPrefBenchmark() async {
  final random = Random();

  final Map<String, String> testData = {};
  for (int i = 0; i < 10000; i++) {
    testData['key_$i'] = 'value_${random.nextInt(10000)}';
  }

  benchmark(() async {
    final prefs = await SharedPreferences.getInstance();
    testData.forEach((key, value) async {
      prefs.setString(key, value);
    });
  }, 'SharedPreferences Write Time');

  benchmark(() async {
    final prefs = await SharedPreferences.getInstance();
    for (int i = 0; i < 10000; i++) {
      prefs.getString('key_$i');
    }
  }, 'SharedPreferences Read Time');
}
