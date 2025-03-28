import 'package:objectbox/objectbox.dart';



@Entity()
class ObjectBoxBenchmark {
  int id = 0;
  String key;
  String value;

  ObjectBoxBenchmark({required this.key, required this.value});
}