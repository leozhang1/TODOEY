import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_data.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final Function onChange;
  final String description;
  final int taskIndex;

  TaskTile({this.description, this.isChecked, this.onChange, this.taskIndex});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: () {
        Provider.of<TaskData>(context).deleteTaskAt(taskIndex);
      },
      title: Text(
        description,
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null,
            fontSize: 25),
      ),
      subtitle: Text(
          'Press and hold to delete  :)',
          style: TextStyle(
            fontSize: 15,
          )),
      dense: true,
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: onChange,
      ),
    );
  }
}
