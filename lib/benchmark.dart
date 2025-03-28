Future<void> benchmark(Future<void> Function() action, String label) async {
  final stopwatch = Stopwatch()..start();
  await action();
  stopwatch.stop();
  print('$label: ${stopwatch.elapsedMilliseconds} ms');
}
