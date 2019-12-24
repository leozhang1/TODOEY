import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Screens/task_screen.dart';
import 'package:provider/provider.dart';
import 'models/task_data.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'models/task.dart';
import 'dart:convert';


void main() => runApp(Todoey());

class Todoey extends StatefulWidget {
  @override
  _TodoeyState createState() => _TodoeyState();
}

class _TodoeyState extends State<Todoey> {

  @override
  void initState() {
    super.initState();
    readData();
  }

  TaskData td;

  void saveData() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      setState(() {
        List<String> spList =
        td.taskList.map((task) => jsonEncode(task.toMap())).toList();
        print(spList);
//        readData();
        if (prefs == null) print('NULL!!');
        prefs.setStringList('list', spList);
      });
    } catch (e) {
      print(e);
      return;
    }
  }
  void readData() async {

    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      setState(() {
        td = TaskData(saveData);
        List<String> spList = prefs.getStringList('list') ?? [];
        print('read spList: $spList');
        td.taskList = spList.map((task) => Task.fromMap(jsonDecode(task))).toList();
      });

//      print('current from read data: ${_taskList.toString}');
    } catch (e) {
      print(e);
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskData(saveData),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: TaskScreen(),
      ),
    );
  }
}
