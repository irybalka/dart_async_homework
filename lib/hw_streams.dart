import 'dart:async';

void main() async {
  final stream = Stream<int>.fromIterable([1, 2, 3, 4, 5]);

  print('Вивід через await for:');
  await for (final value in stream) {
    print(value);
  }

  final stream2 = Stream<int>.fromIterable([1, 2, 3, 4, 5]);

  print('Вивід через listen:');
  stream2.listen((value) {
    print(value);
  });
}
