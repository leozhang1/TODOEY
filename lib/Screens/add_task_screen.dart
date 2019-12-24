import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:todoey/models/task.dart';
// import 'task_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AddTaskScreen extends StatelessWidget {

  final Function callBack;
  AddTaskScreen(this.callBack);

  @override
  Widget build(BuildContext context) {
    String enteredString;
    return Container(
      color: Color(0xff757575),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            )),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Text(
              'Add Task',
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 30,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 60,
              ),
              child: TextField(
                style: TextStyle(fontSize: 20),
                onChanged: (value) {
                    enteredString = value;
                },
                autofocus: true,
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.lightBlueAccent, width: 5.0)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.lightBlueAccent, width: 5.0)),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 60),
              child: ButtonTheme(
                minWidth: double.infinity,
                height: 45,
                child: RaisedButton(
                  child: Text(
                    'Add',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  color: Colors.lightBlueAccent,
                  onPressed: () {
                    if (enteredString != null)
                      callBack(enteredString);
                    else {
                      AlertDialog alert = AlertDialog(
                        title: Text('please enter a task'),
                        elevation: 24.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(45.0),
                          ),
                        actions: <Widget>[
                          FlatButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('OK'),
                          )
                        ],
                      );

                      showDialog(
                        context: context,
                        builder: (context) => alert);
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
