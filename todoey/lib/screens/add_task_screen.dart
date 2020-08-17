import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String toDoText;

    return Container(
      color: Color(0xFF757575),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        child: Column(
          children: <Widget>[
            Text(
              'Add Task',
              style: TextStyle(fontSize: 30, color: Colors.lightBlueAccent),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              style: TextStyle(fontSize: 30),
              onChanged: (value) {
                toDoText = value;
              },
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: 200,
              child: FlatButton(
                disabledColor: Colors.lightBlueAccent,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    'Add',
                    style: TextStyle(fontSize: 40, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
