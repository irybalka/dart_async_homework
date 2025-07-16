import 'dart:async';

void main() async {
  print('---------------------- PART I ----------------------------\n\n');
  print('---------------------- Task 1 ----------------------------');

  final nameStopwatch = Stopwatch()..start();
  String name = await fetchName();
  nameStopwatch.stop();
  print('My name is $name');
  print('fetchName() executed in ${nameStopwatch.elapsedMilliseconds} ms');

  print('---------------------- Task 2 ----------------------------');

  final ageStopwatch = Stopwatch()..start();
  String ageString = await fetchAge(25);
  ageStopwatch.stop();
  print(ageString);
  print('fetchAge() executed in ${ageStopwatch.elapsedMilliseconds} ms');
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
