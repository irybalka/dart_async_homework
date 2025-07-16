import 'dart:async';

void main() async {
  print('---------------------- PART I ----------------------------');
  print('---------------------- Task 1 ----------------------------');
  String name = await fetchName();
  print('My name is $name');
  print('---------------------- Task 2 ----------------------------');
  String ageString = await fetchAge(33);
  print(ageString);
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
  if ([2, 3, 4].contains(lastDigit)) yearsString = 'роки';

  final resultString = 'мені $age $yearsString';
  return resultString;
}
