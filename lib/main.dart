import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Screens/task_screen.dart';
import 'package:provider/provider.dart';
import 'models/task_data.dart';

void main() => runApp(Todoey());

class Todoey extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: TaskScreen(),
      ),
    );
  }
}

