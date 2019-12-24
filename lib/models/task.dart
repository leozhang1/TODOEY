import 'package:flutter/cupertino.dart';

class Task {
  final String taskName;
  bool val;

  Task({@required this.taskName, this.val = false});

  void toggleCheckBox() => val = !val;

  Task.fromMap(Map map)
      : this.taskName = map['taskName'],
        this.val = map['isChecked'];

//  this method must be called before fromMap does so that we have
//  an existing map
  Map toMap() {
    return {
      'taskName': this.taskName,
      'isChecked': this.val,
    };
  }
}
