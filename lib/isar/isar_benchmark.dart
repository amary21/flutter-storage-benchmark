import 'package:isar/isar.dart';

part 'isar_benchmark.g.dart';

@Collection()
class IsarBenchmark {
  Id id = Isar.autoIncrement;
  late String key;
  late String value;
}