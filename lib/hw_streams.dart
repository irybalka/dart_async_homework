import 'dart:async';

void main() async {
  print('-------------------------- Task 6 ----------------------------------');
  final stream = Stream<int>.fromIterable([1, 2, 3, 4, 5]);

  print('Вивід через await for:');
  await for (final value in stream) {
    print(value);
  }

  final stream2 = Stream<int>.fromIterable([1, 2, 3, 4, 5]);
  print('Вивід через listen:');
  final completer = Completer();
  stream2.listen(
    (value) => print(value),
    onDone: () => completer.complete(),
  );
  await completer.future;
  print('-------------------------- Task 7 ----------------------------------');

  final periodicStream = Stream<int>.periodic(
    Duration(seconds: 1),
    (count) => count + 1,
  ).take(10);

  print('Вивід через Stream.periodic:');
  await for (final value in periodicStream) {
    print('\u001b[31m$value...\u001b[0m');
  }
}
