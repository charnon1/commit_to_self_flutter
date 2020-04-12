import 'package:flutter/material.dart';

import './taskamount.dart';
import './task.dart';

class TaskDueDate extends StatelessWidget {


  Task newTask;

  TaskDueDate(Task newTask){
    this.newTask = newTask;
  }

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        title: Text("Add a due date"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.navigate_next),
            onPressed: () => print("Going next"),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TaskAmount(this.newTask)),
          );
        },
        tooltip: 'Add task',
        child: Icon(Icons.add),
      ),
    );
  }
}