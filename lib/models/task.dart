import 'package:flutter/cupertino.dart';

class Task {

  final String taskName;
  bool value;
  Task({@required this.taskName, this.value = false});

  void toggleCheckBox() => value = !value;
}