import 'package:flutter/foundation.dart';
import 'task.dart';
import 'dart:collection';
import 'package:shared_preferences/shared_preferences.dart';

class TaskData extends ChangeNotifier {
  List<Task> taskList = [];
  Function saveData;
//    Task(taskName: 'buy bread'),
//    Task(taskName: 'buy milk'),
//    Task(taskName: 'buy eggs'),
//    Task(taskName: 'buy fish'),
//    Task(taskName: 'buy carrots'),
  TaskData(this.saveData);

//  void saveData() async {
//    try {
//      SharedPreferences prefs = await SharedPreferences.getInstance();
//      List<String> spList =
//          _taskList.map((task) => jsonEncode(task.toMap())).toList();
//      print(spList);
//      readData();
//      if (prefs == null) print('NULL!!');
//      prefs.setStringList('list', spList);
////      List<String> dummy = prefs.getStringList('list');
////      print('current from read data: $dummy');
//    } catch (e) {
//      print(e);
//      return;
//    }
//  }
//
//  void readData() async {
//    try {
//      SharedPreferences prefs = await SharedPreferences.getInstance();
//      List<String> spList = prefs.getStringList('list') ?? [];
//      print('read spList: $spList');
//      _taskList = spList.map((task) => Task.fromMap(jsonDecode(task))).toList();
//      print('current from read data: ${_taskList.toString}');
//    } catch (e) {
//      print(e);
//      return;
//    }
//  }



//  we have to create the two methods below in order impose a
//  change in state and to notify each listener, which subscribed to
//  our provider here in this class
  void toggleBox(int index) {
    taskList[index].toggleCheckBox();
    saveData();
    notifyListeners();
  }

  void addToList(Task task) {
    taskList.add(task);
    saveData();
    notifyListeners();
  }

  void deleteTaskAt(int index) {
    taskList.removeAt(index);
    saveData();
    notifyListeners();
  }

//  UnmodifiableListView<Task> get taskList => UnmodifiableListView(_taskList);
}
