import 'dart:async';

Future<String> fetchName() async {
  await Future.delayed(Duration(seconds: 2));
  return 'Ihor';
}

void main() async {
  String name = await fetchName();
  print('My name is $name');
}
