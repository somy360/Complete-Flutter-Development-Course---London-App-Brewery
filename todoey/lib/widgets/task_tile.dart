import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'item 1',
        style: TextStyle(fontSize: 30),
      ),
      trailing: Checkbox(
        value: false,
      ),
    );
  }
}
