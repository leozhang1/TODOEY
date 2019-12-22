import 'package:flutter/foundation.dart';
import 'task.dart';
import 'dart:collection';

class TaskData extends ChangeNotifier {
  List<Task> _taskList = [
    Task(taskName: 'buy bread'),
    Task(taskName: 'buy milk'),
    Task(taskName: 'buy eggs'),
    Task(taskName: 'buy fish'),
    Task(taskName: 'buy carrots'),
  ];

//  we have to create the two methods below in order impose a
//  change in state and to notify each listener, which subscribed to
//  our provider here in this class
  void toggleBox(int index) {
    _taskList[index].toggleCheckBox();
    notifyListeners();
  }

  void addToList(Task task) {
    _taskList.add(task);
    notifyListeners();
  }

  void deleteTaskAt(int index) {
    _taskList.removeAt(index);
    notifyListeners();
  }

  int get taskLength => _taskList.length;

  UnmodifiableListView<Task> get taskList => UnmodifiableListView(_taskList);

}
