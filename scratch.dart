import 'dart:io';

void main() {
  performTask();
}

void performTask() async {
  taskOne();
  String? taskTwoData = await taskTwo();
  taskThree(taskTwoData);
}

void taskOne() {
  String s1 = "task one";
  print('completed $s1');
}

Future<String?> taskTwo() async {
  String? result;
  Duration threesec = Duration(seconds: 3);
  await Future.delayed(threesec, () {
    String s2 = "task two";
    print('completed task two ');
    result = 'task two data';
  });
  return result;
}

void taskThree(String? taskTwoData) {
  print('completed task three with the help of  $taskTwoData');
}
