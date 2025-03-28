import 'dart:math';

import 'package:flutter_storage_benchmark/benchmark.dart';
import 'package:flutter_storage_benchmark/isar/isar_benchmark.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

Future<void> isarBenchmark() async {
  final random = Random();
  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open([IsarBenchmarkSchema], directory: dir.path);

  final List<IsarBenchmark> testData = [
    for (int i = 0; i < 10000; i++)
      IsarBenchmark()
        ..id = i
        ..key = 'key_$i'
        ..value = 'value_${random.nextInt(10000)}',
  ];

  benchmark(() async {
    isar.writeTxn(() async {
      for (var data in testData) {
        isar.isarBenchmarks.put(data);
      }
    });
  }, 'Isar Write Time');

  benchmark(() async {
    for (var data in testData) {
      isar.isarBenchmarks.get(data.id);
    }
  }, 'Isar Read Time');
}
