import 'package:flutter/material.dart';
import 'task_tile.dart';
import '../models/task_data.dart';
import 'package:provider/provider.dart';
import 'package:todoey/main.dart';

// We use a Consumer<AnyType> widget from the provider package so we can avoid
// typing Provider.of<TaskData>(context).something over and over...

class TasksLists extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
            itemCount: taskData.taskList.length,
            itemBuilder: (context, index) {
              return TaskTile(
                description: taskData.taskList[index].taskName,
                isChecked: taskData.taskList[index].val,
                onChange: (boolVal) {
                  taskData.toggleBox(index); // 'currying' is used here on index
                },
                taskIndex: index,
              );
            });
      },
    );
  }
}
