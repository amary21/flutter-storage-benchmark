import 'dart:math';

import 'package:flutter_storage_benchmark/benchmark.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> hiveBenchmark() async {
  await Hive.initFlutter();

  final random = Random();
  const boxName = 'benchmarkBox';
  final box = await Hive.openBox(boxName);

  final Map<String, String> testData = {};
  for (int i = 0; i < 10000; i++) {
    testData['key_$i'] = 'value_${random.nextInt(10000)}';
  }

  benchmark(() async {
    testData.forEach((key, value) async {
      box.put(key, value);
    });
  }, 'Hive Write Time');

  benchmark(() async {
    for (int i = 0; i < 10000; i++) {
      box.get('key_$i');
    }
  }, 'Hive Read Time');
}
