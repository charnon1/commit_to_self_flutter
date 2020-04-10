import 'package:flutter/material.dart';

import './taskduedate.dart';

class TaskDescription extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        title: Text("Add a description"),
      ),
      body: Row(
        children: <Widget>[
          Text("add your description here"),
          RaisedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TaskDueDate()),
              );
            },
            child: Text("Confirm task description"),
          ),
        ],
      ),
    );
  }
}