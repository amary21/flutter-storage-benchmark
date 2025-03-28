import 'package:flutter/material.dart';
import 'package:flutter_storage_benchmark/hive/hive.dart';
import 'package:flutter_storage_benchmark/isar/isar.dart';
import 'package:flutter_storage_benchmark/objectbox/obbjectbox.dart';
import 'package:flutter_storage_benchmark/preference/shared_pref.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  void initState() {
    super.initState();
    sharedPrefBenchmark();
    hiveBenchmark();
    isarBenchmark();
    objectBoxBenchmark();
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(body: Center(child: Text('Hello World!'))),
    );
  }
}
