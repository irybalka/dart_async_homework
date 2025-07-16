import 'dart:async';

void main() async {
  print('---------------------- PART I ----------------------------');
  print('---------------------- Task 1 ----------------------------');

  final nameStopwatch = Stopwatch()..start();
  String name = await fetchName();
  nameStopwatch.stop();
  print('Мене звати $name');
  print('fetchName() executed in ${nameStopwatch.elapsedMilliseconds} ms');

  print('---------------------- Task 2 ----------------------------');

  final ageStopwatch = Stopwatch()..start();
  String ageString = await fetchAge(25);
  ageStopwatch.stop();
  print(ageString);
  print('fetchAge() executed in ${ageStopwatch.elapsedMilliseconds} ms');

  print('---------------------- Task 4 ----------------------------');
  final stopwatchParallel = Stopwatch()..start();
  // Start both futures in parallel
  final List<String> results = await Future.wait([
    fetchName(),
    fetchAge(59),
  ]);
  stopwatchParallel.stop();

  String namePar = results[0];
  String ageStringPar = results[1];

  print('Паралельно мене звати $namePar');
  print(ageStringPar);
  print(
      'Обидві функції виконувалися протягом  ${stopwatchParallel.elapsedMilliseconds} ms');
}

Future<String> fetchName() async {
  await Future.delayed(Duration(seconds: 2));
  return 'Ihor';
}

Future<String> fetchAge(int age) async {
  await Future.delayed(Duration(milliseconds: 1500));
  String yearsString = 'років';
  int lastDigit = age % 10;
  if (lastDigit == 1) yearsString = 'рік';
  if ([2, 3, 4].contains(lastDigit)) yearsString = 'рік';
  final resultString = 'мені $age $yearsString';
  return resultString;
}
