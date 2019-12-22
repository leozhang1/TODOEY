import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'add_task_screen.dart';
import '../widgets/tasks_lists.dart';
import 'package:todoey/models/task.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_data.dart';

class TaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
          ),
          backgroundColor: Colors.lightBlueAccent,
          onPressed: () => showModalBottomSheet(
              context: context,
              builder: (context) => AddTaskScreen((newTaskTitle) {
                    // get rid of this callback parameter and use provider in the AddTaskScreen
                    try {
                      Provider.of<TaskData>(context)
                          .taskList
                          .add(Task(taskName: newTaskTitle));
                    } catch (ExceptionHandler) {
                      print(
                          '$ExceptionHandler, so using addTolist() from our provider instead');
                      Provider.of<TaskData>(context)
                          .addToList(Task(taskName: newTaskTitle));
                      Navigator.pop(context);
                    }
                  }))),
      backgroundColor: Colors.lightBlueAccent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 35, top: 70, bottom: 35),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.list,
                    size: 45,
                    color: Colors.lightBlueAccent,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Todoey',
                  style: TextStyle(
                      fontSize: 50,
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  Provider.of<TaskData>(context).taskLength != 1
                      ? '${Provider.of<TaskData>(context).taskLength} Tasks'
                      : '${Provider.of<TaskData>(context).taskLength} Task',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  )),
              child: TasksLists(),
            ),
          ),
        ],
      ),
    );
  }
}
