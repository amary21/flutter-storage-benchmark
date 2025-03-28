import 'dart:math';

import 'package:flutter_storage_benchmark/benchmark.dart';
import 'package:flutter_storage_benchmark/objectbox.g.dart';
import 'package:flutter_storage_benchmark/objectbox/objectbox_benchmark.dart';

Future<void> objectBoxBenchmark() async {
  final store = await openStore();

  final random = Random();
  final box = store.box<ObjectBoxBenchmark>();
  final List<ObjectBoxBenchmark> testData = [
    for (int i = 0; i < 10000; i++)
      ObjectBoxBenchmark(
        key: 'key_$i',
        value: 'value_${random.nextInt(10000)}',
      ),
  ];

  benchmark(() async {
    for (var data in testData) {
      box.put(data);
    }
  }, 'ObjectBox Write Time');

  benchmark(() async {
    for (var data in testData) {
      box.get(data.id);
    }
  }, 'ObjectBox Read Time');

  store.close();
}
